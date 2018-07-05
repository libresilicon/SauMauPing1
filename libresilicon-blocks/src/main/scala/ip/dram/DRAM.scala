package libresilicon.soc.dram

import Chisel._
import chisel3.experimental.{Analog,attach}
import freechips.rocketchip.util.{ElaborationArtefacts}
import freechips.rocketchip.util.GenericParameterizedBundle
import freechips.rocketchip.config._

class IODDR(c: DRAMParams) extends GenericParameterizedBundle(c) {
	val ddr3_addr             = Bits(OUTPUT,32)
	val ddr3_ba               = Bits(OUTPUT,6)
	val ddr3_ras_n            = Bool(OUTPUT)
	val ddr3_cas_n            = Bool(OUTPUT)
	val ddr3_we_n             = Bool(OUTPUT)
	val ddr3_reset_n          = Bool(OUTPUT)
	val ddr3_ck_p             = Bits(OUTPUT,1)
	val ddr3_ck_n             = Bits(OUTPUT,1)
	val ddr3_cke              = Bits(OUTPUT,1)
	val ddr3_cs_n             = Bits(OUTPUT,1)
	val ddr3_dm               = Bits(OUTPUT,4)
	val ddr3_odt              = Bits(OUTPUT,1)

	val ddr3_dq               = Analog(32.W)
	val ddr3_dqs_n            = Analog(4.W)
	val ddr3_dqs_p            = Analog(4.W)
}

//reused directly in io bundle for sifive.blocks.devices.xilinxvc707mig
trait IOClocksReset extends Bundle {
	//inputs
	//"NO_BUFFER" clock source (must be connected to IBUF outside of IP)
	val sys_clk_i             = Bool(INPUT)
	//user interface signals
	val ui_clk                = Clock(OUTPUT)
	val ui_clk_sync_rst       = Bool(OUTPUT)
	val mmcm_locked           = Bool(OUTPUT)
	val aresetn               = Bool(INPUT)
	//misc
	val init_calib_complete   = Bool(OUTPUT)
	val sys_rst               = Bool(INPUT)
}
