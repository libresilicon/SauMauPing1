package libresilicon.soc.dram

import Chisel._

import chisel3.experimental.{Analog,attach}
import freechips.rocketchip.util.{ElaborationArtefacts}
import freechips.rocketchip.util.GenericParameterizedBundle
import freechips.rocketchip.config._

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange, AddressSet}

class LibreSiliconDRAMController(c: DRAMParams)(implicit p: Parameters) extends LazyModule {
	//val ranges = AddressRange.fromSets(c.address)
	//val depth = ranges.head.size
	//val buffer  = LazyModule(new TLBuffer)
	//val toaxi4  = LazyModule(new TLToAXI4(adapterName = Some("mem"), stripBits = 1))
	//val indexer = LazyModule(new AXI4IdIndexer(idBits = 4))
	//val deint   = LazyModule(new AXI4Deinterleaver(p(CacheBlockBytes)))
	//val yank    = LazyModule(new AXI4UserYanker)
	//val island  = LazyModule(new XilinxVC707MIGIsland(c))
	
	//val node: TLInwardNode =
	//island.node := island.crossAXI4In := yank.node := deint.node := indexer.node := toaxi4.node := buffer.node
	
	lazy val module = new LazyModuleImp(this) {
		val io = IO(new Bundle {
			val port = new LibreSiliconDRAMControllerInterface(c)
		})
		//io.port <> island.module.io.port
	}
}
