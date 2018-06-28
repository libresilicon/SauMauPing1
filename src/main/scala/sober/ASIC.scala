package libresilicon.soc

import Chisel._

import chisel3.experimental.{withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.pinctrl.{BasePin}

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy.LazyModule

class SauMauPingASIC()(implicit p: Parameters) extends PadFrame {
  val dut = Module(LazyModule(new SauMauPingSystem).module)
  dut.reset := reset
  connectUART(dut)
}
