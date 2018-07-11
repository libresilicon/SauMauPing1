package libresilicon.soc

import Chisel._

import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg, ElaborationArtefacts, HeterogeneousBag}

import sifive.blocks.devices.pinctrl.{BasePin}

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._
import libresilicon.soc.dram._


//-------------------------------------------------------------------------
// ASICShell
//-------------------------------------------------------------------------

trait HasDRAM
{ this: ASICShell =>
	val dramParams = p(PeripheryDRAMKey)
	val drams = dramParams.zipWithIndex.map { case(params, i) =>
		val dram = IO(new DRAMPortIO(params))
		dram
	}
	def connectDRAM(dut: HasPeripheryDRAMImp): Unit = {
		(drams zip dut.drams).foreach { case (io, device) =>
			io <> device
		}
	}
}

trait HasUART { this: ASICShell =>
	val uart_tx	= IO(Output(Bool()))
	val uart_rx	= IO(Input(Bool()))

	def connectUART(dut: HasPeripheryUARTModuleImp): Unit = {
		val uartParams = p(PeripheryUARTKey)
		if (!uartParams.isEmpty) {
			// uart connections
			dut.uart(0).rxd := SyncResetSynchronizerShiftReg(uart_rx, 2, init = Bool(true), name=Some("uart_rxd_sync"))
			uart_tx         := dut.uart(0).txd
		}
	}
}

trait HasSPIFlash { this: ASICShell =>
	val qspi_cs      = IO(Analog(1.W))
	val qspi_sck     = IO(Analog(1.W))
	val qspi_dq      = IO(Vec(4, Analog(1.W)))

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

			qspi_sck := dut.qspi(0).sck
			qspi_cs := dut.qspi(0).cs(0)

			(qspi_dq zip qspi_pins.dq).foreach {
				case(a, b) => a := b
			}
		}
	}
}

trait HasSDIO { this: ASICShell =>
	//-------------------------------------------------------------------
	// SDIO <> SPI Bridge
	//-------------------------------------------------------------------
	//val ip_sdio_spi = Module(new sdio_spi_bridge())

	// SDIO
	val sdio_cd              = IO(Analog(1.W))
	val sdio_clk             = IO(Output(Bool()))
	val sdio_cmd             = IO(Analog(1.W))
	val sdio_dat             = IO(Analog(4.W))

	/*
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
	*/

	val sd_spi_sck      = Wire(Bool())
	val sd_spi_cs       = Wire(Bool())
	val sd_spi_dq_i     = Wire(Vec(4, Bool()))
	val sd_spi_dq_o     = Wire(Vec(4, Bool()))

	def connectSDIO(dut: HasPeripherySPIModuleImp): Unit = {
		sd_spi_sck := dut.spi(0).sck
		sd_spi_cs  := dut.spi(0).cs(0)

		dut.spi(0).dq.zipWithIndex.foreach {
			case(pin, idx) =>
				sd_spi_dq_o(idx) := pin.o
				pin.i            := sd_spi_dq_i(idx)
		}
	}
}

abstract class ASICShell(implicit val p: Parameters)
	extends RawModule
{
	// Interface
	val io = IO(new Bundle {
		val rstn = Input(Bool()) // low active reset
		val clk = Input(Clock())
		val success = Output(Bool())
	})


	//-----------------------------------------------------------------------
	// Wire declrations
	//-----------------------------------------------------------------------
	val dut_clock       = Wire(Clock())
	val dut_reset       = Wire(Bool())

	//-----------------------------------------------------------------------
	// System reset
	//-----------------------------------------------------------------------
	dut_reset := ~io.rstn
	dut_clock := io.clk

}
