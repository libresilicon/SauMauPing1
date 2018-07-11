package libresilicon.soc.dram

import Chisel._

import chisel3.experimental.{Analog,attach}
import freechips.rocketchip.util.{ElaborationArtefacts}
import freechips.rocketchip.util.GenericParameterizedBundle
import freechips.rocketchip.config._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.interrupts._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.util.HeterogeneousBag
import sifive.blocks.util.{NonBlockingEnqueue, NonBlockingDequeue}

import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.util.HeterogeneousBag
import freechips.rocketchip.diplomacy._

class DRAMPortIO(c: DRAMParams)
	extends Bundle
{
	val addr             = Bits(OUTPUT,32)
	val ba               = Bits(OUTPUT,6)
	val ras_n            = Bool(OUTPUT)
	val cas_n            = Bool(OUTPUT)
	val we_n             = Bool(OUTPUT)
	val reset_n          = Bool(OUTPUT)
	val ck_p             = Bits(OUTPUT,1)
	val ck_n             = Bits(OUTPUT,1)
	val cke              = Bits(OUTPUT,1)
	val cs_n             = Bits(OUTPUT,1)
	val dm               = Bits(OUTPUT,4)
	val odt              = Bits(OUTPUT,1)
	val dq               = Analog(32.W)
	val dqs_n            = Analog(4.W)
	val dqs_p            = Analog(4.W)
}

class IOClocksReset(c: DRAMParams)
	extends Bundle
{
	//inputs
	//"NO_BUFFER" clock source (must be connected to IBUF outside of IP)
	val sys_clk               = Clock(INPUT)
	//misc
	val sys_rst               = Bool(INPUT)
}

class DRAMControllerInterface(c: DRAMParams)
	extends Bundle
{
	val ddr3 = new DRAMPortIO(c)
	val ctrl = new IOClocksReset(c)
}

abstract class DRAMCoreBase(c: DRAMParams)(implicit p: Parameters)
	extends LazyModule
{
	val device = new SimpleDevice("dram", Seq("libresilicon,dram"))
	/*val rnode = TLRegisterNode(
		address = Seq(c.address),
		device = device
	)*/
}

class DRAMCore(c: DRAMParams)(implicit p: Parameters)
	extends DRAMCoreBase(c)(p)
{
	var io = new DRAMControllerInterface(c)
	lazy val module = new DRAMController(c, this)
}
