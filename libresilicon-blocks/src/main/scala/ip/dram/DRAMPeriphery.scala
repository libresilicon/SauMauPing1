// See LICENSE for license details.
package libresilicon.soc.dram

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange, AddressSet}

case class DRAMParams(
	address : AddressSet,
	data_width: Int,
	address_width: Int,
	bank_address_width: Int,
	data_mask_wdith: Int,
	differential_data_strobe_width: Int
)

case object PeripheryDRAMKey extends Field[Seq[DRAMParams]]

trait HasPeripheryDRAM { this: BaseSubsystem =>
	val module: HasPeripheryDRAMImp
	//val dram_controller = LazyModule(new LibreSiliconDRAMController(p(PeripheryDRAMKey)))
}

trait HasPeripheryDRAMImp extends LazyModuleImp
{
	val outer: HasPeripheryDRAM
	//val range = p(PeripheryDRAMKey).address
	//val depth = range.size
	//val dram_interface = new LibreSiliconDRAMControllerInterface(depth)
	//dram_interface <> outer.dram_controller.module.io.port
}

class LibreSiliconDRAMControllerInterface(c: DRAMParams)(implicit val p: Parameters) extends Module 
{
	val io = new IODDR(c) with IOClocksReset {
		// User interface signals
		val app_sr_req            = Bool(INPUT)
		val app_ref_req           = Bool(INPUT)
		val app_zq_req            = Bool(INPUT)
		val app_sr_active         = Bool(OUTPUT)
		val app_ref_ack           = Bool(OUTPUT)
		val app_zq_ack            = Bool(OUTPUT)
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
		//misc
		val device_temp           = Bits(OUTPUT,12)
	}
}
