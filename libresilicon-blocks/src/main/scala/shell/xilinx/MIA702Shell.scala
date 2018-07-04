package sifive.fpgashells.shell.xilinx.mia702shell

import Chisel._
import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg, ElaborationArtefacts, HeterogeneousBag}

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._
import sifive.blocks.devices.chiplink._


import sifive.blocks.devices.pinctrl.{BasePin}

import sifive.fpgashells.devices.xilinx.xilinxmia702mig._
import sifive.fpgashells.ip.xilinx.{IBUFDS, sdio_spi_bridge, Series7MMCM, vc707reset, IBUFG, IOBUF, PULLUP, mmcm, reset_sys, PowerOnResetFPGAOnly}

import sifive.fpgashells.clocks._

//-------------------------------------------------------------------------
// MIA702Shell
//-------------------------------------------------------------------------

trait HasDDR3 { this: MIA702Shell =>
  require(!p.lift(MemoryXilinxDDRKey).isEmpty)
  val ddr = IO(new XilinxMIA702MIGPads(p(MemoryXilinxDDRKey)))
  
  def connectMIG(dut: HasMemoryXilinxMIA702MIGModuleImp): Unit = {
    // Clock & Reset
    dut.xilinxvc707mig.sys_clk_i := sys_clock.asUInt
    mig_clock                    := dut.xilinxvc707mig.ui_clk
    mig_sys_reset                := dut.xilinxvc707mig.ui_clk_sync_rst
    mig_mmcm_locked              := dut.xilinxvc707mig.mmcm_locked
    dut.xilinxvc707mig.aresetn   := mig_resetn
    dut.xilinxvc707mig.sys_rst   := sys_reset

    ddr <> dut.xilinxvc707mig
  }
}

trait HasSDIO { this: MIA702Shell =>
  //-------------------------------------------------------------------
    // SDIO <> SPI Bridge
    //-------------------------------------------------------------------
    val ip_sdio_spi = Module(new sdio_spi_bridge())

    // SDIO
    val sdio_cd              = IO(Analog(1.W))
    val sdio_clk             = IO(Output(Bool()))
    val sdio_cmd             = IO(Analog(1.W))
    val sdio_dat             = IO(Analog(4.W))

    ip_sdio_spi.io.clk   := dut_clock
    ip_sdio_spi.io.reset := dut_reset

    // SDIO
    attach(sdio_dat, ip_sdio_spi.io.sd_dat)
    attach(sdio_cmd, ip_sdio_spi.io.sd_cmd)
    sdio_clk := ip_sdio_spi.io.spi_sck

    // SPI
    ip_sdio_spi.io.spi_sck  := sd_spi_sck
    ip_sdio_spi.io.spi_cs   := sd_spi_cs
    sd_spi_dq_i             := ip_sdio_spi.io.spi_dq_i.toBools
    ip_sdio_spi.io.spi_dq_o := sd_spi_dq_o.asUInt
}

abstract class MIA702Shell(implicit val p: Parameters) extends RawModule {

  //-----------------------------------------------------------------------
  // Interface
  //-----------------------------------------------------------------------
  
  // 125Mhz sysclk
  val clock                = IO(Input(Bool()))

  // low active reset
  val resetn               = IO(Input(Bool())) // low active reset input

  // UART
  val uart_tx              = IO(Output(Bool()))
  val uart_rx              = IO(Input(Bool()))

  val qspi_cs      = IO(Analog(1.W))
  val qspi_sck     = IO(Analog(1.W))
  val qspi_dq      = IO(Vec(4, Analog(1.W)))

  // LEDs
  val gpio_leds    = IO(Vec(4, Bool()))

  //-----------------------------------------------------------------------
  // Wire declrations
  //-----------------------------------------------------------------------

  val sys_reset       = Wire(Bool())
  val sys_clock       = Wire(Bool())

  val dut_clock       = Wire(Clock())
  val dut_reset       = Wire(Bool())
  val dut_resetn      = Wire(Bool())

  val sd_spi_sck      = Wire(Bool())
  val sd_spi_cs       = Wire(Bool())
  val sd_spi_dq_i     = Wire(Vec(4, Bool()))
  val sd_spi_dq_o     = Wire(Vec(4, Bool()))

  val mig_mmcm_locked = Wire(Bool())
  val mig_sys_reset   = Wire(Bool())

  val mig_clock       = Wire(Clock())
  val mig_resetn      = Wire(Bool())

  //-----------------------------------------------------------------------
  // System clock and reset
  //-----------------------------------------------------------------------

  val sys_clock_mmcm0_locked = Wire(Bool())
  sys_reset := (~resetn)|(~sys_clock_mmcm0_locked)
  sys_clock := clock

  //-----------------------------------------------------------------------
  // Clock Generator
  //-----------------------------------------------------------------------

  //125MHz and multiples
  val sys_clock_mmcm0 = Module(new Series7MMCM(PLLParameters(
    "sys_clock_mmcm2",
    InClockParameters(125, 50), 
    Seq(OutClockParameters(800.00)))))
 
  sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
  sys_clock_mmcm0.io.reset   := ~resetn
  sys_clock_mmcm0_locked     := sys_clock_mmcm0.io.locked

  val Seq(clk500) = sys_clock_mmcm0.getClocks
  
  // DUT clock
  dut_clock := clk500

  //-----------------------------------------------------------------------
  // System reset
  //-----------------------------------------------------------------------
  dut_reset           := sys_reset
  mig_resetn          := ~sys_reset
  
  //provide defaults to allow above reset sequencing logic to work without both
  mig_clock            := dut_clock
  mig_mmcm_locked      := UInt("b1")

  //-----------------------------------------------------------------------
  // UART
  //-----------------------------------------------------------------------

  def connectUART(dut: HasPeripheryUARTModuleImp): Unit = {
    val uartParams = p(PeripheryUARTKey)
    if (!uartParams.isEmpty) {
      // uart connections
      dut.uart(0).rxd := SyncResetSynchronizerShiftReg(uart_rx, 2, init = Bool(true), name=Some("uart_rxd_sync"))
      uart_tx         := dut.uart(0).txd
    }
  }

  //-----------------------------------------------------------------------
  // SPI
  //-----------------------------------------------------------------------

  def connectSPI(dut: HasPeripherySPIModuleImp): Unit = {
    // SPI
    sd_spi_sck := dut.spi(0).sck
    sd_spi_cs  := dut.spi(0).cs(0)

    dut.spi(0).dq.zipWithIndex.foreach {
      case(pin, idx) =>
        sd_spi_dq_o(idx) := pin.o
        pin.i            := sd_spi_dq_i(idx)
    }
  }
  //-----------------------------------------------------------------------
  // SPI Flash
  //-----------------------------------------------------------------------

  def connectSPIFlash(dut: HasPeripherySPIFlashModuleImp): Unit = {
    val qspiParams = p(PeripherySPIFlashKey)
    if (!qspiParams.isEmpty) {
      val qspi_params = qspiParams(0)
      val qspi_pins = Wire(new SPIPins(() => {new BasePin()}, qspi_params))

      SPIPinsFromPort(qspi_pins,
        dut.qspi(0),
        dut.clock,
        dut.reset,
        syncStages = qspi_params.sampleDelay
      )

      IOBUF(qspi_sck, dut.qspi(0).sck)
      IOBUF(qspi_cs,  dut.qspi(0).cs(0))

      (qspi_dq zip qspi_pins.dq).foreach {
        case(a, b) => IOBUF(a,b)
      }
    }
  }


}

