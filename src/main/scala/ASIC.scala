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
	with HasSDIO
	//with HasDRAM
{
	withClockAndReset(dut_clock,dut_reset) {
		val dut = Module(LazyModule(new SauMauPingSystem).module)
		dut.reset := dut_reset | dut.debug.ndreset
		dut.clock := dut_clock
		//---------------------------------------------------------------------
		// Connect peripherals
		//---------------------------------------------------------------------
		//connectSPIFlash (dut)
		//connectSDIO(dut)
		connectUART(dut)
		//connectDRAM(dut)
		dut.dontTouchPorts()
		dut.tieOffInterrupts()
		//dut.connectSimAXIMem()
		//dut.connectSimAXIMMIO()
		//dut.l2_frontend_bus_axi4.foreach(_.tieoff)
		dut.connectDebug(dut_clock, dut_reset, io.success)
	}
}
