package libresilicon.soc.dram

import Chisel._

import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.util.HeterogeneousBag
import freechips.rocketchip.diplomacy._

case class DRAMParams(
	address : AddressSet,
	data_width: Int,
	address_width: Int,
	bank_address_width: Int,
	data_mask_wdith: Int,
	differential_data_strobe_width: Int
)

case object PeripheryDRAMKey extends Field[Seq[DRAMParams]]

trait HasPeripheryDRAM
{ this: BaseSubsystem =>
	val module: HasPeripheryDRAMImp
	val dramParams = p(PeripheryDRAMKey)
	val drams = dramParams.zipWithIndex.map { case(params, i) =>
		val name = Some(s"dram_$i")
		val dram = LazyModule(new DRAMCore(params)).suggestName(name)
		dram
	}
}

trait HasPeripheryDRAMImp
	extends LazyModuleImp
{
	val outer: HasPeripheryDRAM
	val dramParams = p(PeripheryDRAMKey)
	val drams = dramParams.zipWithIndex.map {
		case(params, i) =>
			val dram = IO(new DRAMPortIO(params))
			dram
	}
	(drams zip outer.drams).foreach { case (io, device) =>
		io <> device.module.ddr3
	}
}
