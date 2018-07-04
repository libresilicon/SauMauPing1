// See LICENSE for license details.
package sifive.fpgashells.devices.xilinx.xilinxmia702mig

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange}

case object MemoryXilinxDDRKey extends Field[XilinxMIA702MIGParams]

trait HasMemoryXilinxMIA702MIG { this: BaseSubsystem =>
  val module: HasMemoryXilinxMIA702MIGModuleImp

  val xilinxvc707mig = LazyModule(new XilinxMIA702MIG(p(MemoryXilinxDDRKey)))

  require(nMemoryChannels == 1, "Core complex must have 1 master memory port")
  xilinxvc707mig.node := memBuses.head.toDRAMController(Some("xilinxvc707mig"))()
}

trait HasMemoryXilinxMIA702MIGBundle {
  val xilinxvc707mig: XilinxMIA702MIGIO
  def connectXilinxMIA702MIGToPads(pads: XilinxMIA702MIGPads) {
    pads <> xilinxvc707mig
  }
}

trait HasMemoryXilinxMIA702MIGModuleImp extends LazyModuleImp
    with HasMemoryXilinxMIA702MIGBundle {
  val outer: HasMemoryXilinxMIA702MIG
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR range must be contiguous")
  val depth = ranges.head.size
  val xilinxvc707mig = IO(new XilinxMIA702MIGIO(depth))

  xilinxvc707mig <> outer.xilinxvc707mig.module.io.port
}
