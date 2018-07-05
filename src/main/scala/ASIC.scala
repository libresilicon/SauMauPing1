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
	//with HasSPIFlash
	with HasDRAM
{
	withClockAndReset(clk,rstn) {
		val dut = Module(LazyModule(new SauMauPingSystem).module)
		dut.reset := ~rstn
		dut.clock := clk
		//---------------------------------------------------------------------
		// Connect peripherals
		//---------------------------------------------------------------------
		//connectSPIFlash (dut)
		//connectSPI      (dut)
		connectUART(dut)
		connectDRAM(dut)
	}
}
