package libresilicon.soc

import Chisel._

import chisel3.experimental.{withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.pinctrl.{BasePin}

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy.LazyModule

class SauMauPing()(implicit p: Parameters)
	extends ASICShell
	with HasUART
	//with HasDRAM
{
	withClockAndReset(clk,rstn) {
		val dut = Module(LazyModule(new SauMauPingSystem).module)
		//dut.reset := ~rstn
		dut.reset := ~rstn | dut.debug.ndreset
		dut.clock := clk
		//---------------------------------------------------------------------
		// Connect peripherals
		//---------------------------------------------------------------------
		//connectSPIFlash (dut)
		//connectSPI      (dut)
		connectUART(dut)
		//connectDRAM(dut)
		dut.dontTouchPorts()
		dut.tieOffInterrupts()
		dut.connectSimAXIMem()
		dut.connectSimAXIMMIO()
		dut.l2_frontend_bus_axi4.foreach(_.tieoff)
		dut.connectDebug(clk, ~rstn, success)
	}
}
