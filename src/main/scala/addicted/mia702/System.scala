package libresilicon.soc

import Chisel._

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.system._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

import sifive.fpgashells.devices.xilinx.xilinxvc707mig._
import sifive.fpgashells.devices.xilinx.xilinxvc707pciex1._

//-------------------------------------------------------------------------
// U500VC707DevKitSystem
//-------------------------------------------------------------------------

class SayMauPingMIA702System(implicit p: Parameters) extends RocketSubsystem
    //with HasPeripheryMaskROMSlave
    with HasPeripheryDebug
    with HasSystemErrorSlave
    with HasPeripheryUART
    with HasPeripherySPI
    with HasPeripheryGPIO
    with HasMemoryXilinxVC707MIG {
    //with HasSystemXilinxVC707PCIeX1 {
  override lazy val module = new SayMauPingMIA702SystemModule(this)
}

class SayMauPingMIA702SystemModule[+L <: SayMauPingMIA702System](_outer: L)
  extends RocketSubsystemModuleImp(_outer)
    //with HasRTCModuleImp
    with HasPeripheryDebugModuleImp
    with HasPeripheryUARTModuleImp
    with HasPeripherySPIModuleImp
    with HasPeripheryGPIOModuleImp
    with HasMemoryXilinxVC707MIGModuleImp {
    //with HasSystemXilinxVC707PCIeX1ModuleImp {
  // Reset vector is set to the location of the mask rom
  //val maskROMParams = p(PeripheryMaskROMKey)
  //global_reset_vector := maskROMParams(0).address.U
}
