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

class DRAMPortIO(c: DRAMParams) extends Bundle {
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

class IOClocksReset(c: DRAMParams)  extends Bundle {
	//inputs
	//"NO_BUFFER" clock source (must be connected to IBUF outside of IP)
	val sys_clk               = Clock(INPUT)
	//misc
	val sys_rst               = Bool(INPUT)
}

class AXInterface(c: DRAMParams)  extends Bundle {
	//axi_s
	//slave interface write address ports
	val s_axi_awid            = Bits(INPUT,4)
	val s_axi_awaddr          = Bits(INPUT,32)
	val s_axi_awlen           = Bits(INPUT,8)
	val s_axi_awsize          = Bits(INPUT,3)
	val s_axi_awburst         = Bits(INPUT,2)
	val s_axi_awlock          = Bits(INPUT,1)
	val s_axi_awcache         = Bits(INPUT,4)
	val s_axi_awprot          = Bits(INPUT,3)
	val s_axi_awqos           = Bits(INPUT,4)
	val s_axi_awvalid         = Bool(INPUT)
	val s_axi_awready         = Bool(OUTPUT)
	//slave interface write data ports
	val s_axi_wdata           = Bits(INPUT,64)
	val s_axi_wstrb           = Bits(INPUT,8)
	val s_axi_wlast           = Bool(INPUT)
	val s_axi_wvalid          = Bool(INPUT)
	val s_axi_wready          = Bool(OUTPUT)
	//slave interface write response ports
	val s_axi_bready          = Bool(INPUT)
	val s_axi_bid             = Bits(OUTPUT,4)
	val s_axi_bresp           = Bits(OUTPUT,2)
	val s_axi_bvalid          = Bool(OUTPUT)
	//slave interface read address ports
	val s_axi_arid            = Bits(INPUT,4)
	val s_axi_araddr          = Bits(INPUT,32)
	val s_axi_arlen           = Bits(INPUT,8)
	val s_axi_arsize          = Bits(INPUT,3)
	val s_axi_arburst         = Bits(INPUT,2)
	val s_axi_arlock          = Bits(INPUT,1)
	val s_axi_arcache         = Bits(INPUT,4)
	val s_axi_arprot          = Bits(INPUT,3)
	val s_axi_arqos           = Bits(INPUT,4)
	val s_axi_arvalid         = Bool(INPUT)
	val s_axi_arready         = Bool(OUTPUT)
	//slave interface read data ports
	val s_axi_rready          = Bool(INPUT)
	val s_axi_rid             = Bits(OUTPUT,4)
	val s_axi_rdata           = Bits(OUTPUT,64)
	val s_axi_rresp           = Bits(OUTPUT,2)
	val s_axi_rlast           = Bool(OUTPUT)
	val s_axi_rvalid          = Bool(OUTPUT)
}

class DRAMControllerInterface(c: DRAMParams, outer: DRAMCore)
	extends LazyModuleImp(outer)
{
	val ddr3 = IO(new DRAMPortIO(c))
	val ctrl = IO(new IOClocksReset(c))
	val axi = IO(new AXInterface(c))
}

class DRAMCore(c: DRAMParams)(implicit p: Parameters)
	extends LazyModule
{
	var width = c.data_width
	val device = new SimpleDevice("dram", Seq("libresilicon,dram"))
	lazy val module = new DRAMControllerInterface(c, this)
	
}

/*class DRAMTopModule(c: DRAMParams, outer: DRAMCoreBase)
	extends LazyModuleImp(outer)
{
	val io = IO(new Bundle {
		val ddr3 = new DRAMPortIO(c)
	})
}*/




