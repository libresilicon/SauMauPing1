package libresilicon.soc
  
import chisel3._

//import chisel3.experimental.{withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.pinctrl.{BasePin}
import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg, ElaborationArtefacts, HeterogeneousBag}


import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy.LazyModule

import scala.collection.mutable.ArrayBuffer

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._
import sifive.blocks.devices.chiplink._

class PadFrame extends Module {
	val io = IO(new Bundle {
		// UART 
		val uart_tx   = Output(Bool())
		val uart_rx   = Input(Bool()) 
		val uart_rtsn = Output(Bool())
		val uart_ctsn = Input(Bool())
	})

	def connectUART(dut: HasPeripheryUARTModuleImp): Unit = {
		dut.uart(0).rxd  := SyncResetSynchronizerShiftReg(io.uart_rx, 2, init = true.B, name=Some("uart_rxd_sync"))
		io.uart_tx       := dut.uart(0).txd
		io.uart_rtsn	 := true.B
	}
}
