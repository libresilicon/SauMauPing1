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

import sifive.fpgashells.devices.xilinx.xilinxmia702mig._

class SayMauPingMIA702System(implicit p: Parameters) extends RocketSubsystem
    with HasPeripheryMaskROMSlave
    with HasPeripheryUART
    with HasPeripherySPI
    with HasPeripherySPIFlash
    with HasPeripheryGPIO
    with HasMemoryXilinxMIA702MIG
    {
      override lazy val module = new SayMauPingMIA702SystemModule(this)
}

class SayMauPingMIA702SystemModule[+L <: SayMauPingMIA702System](_outer: L)
  extends RocketSubsystemModuleImp(_outer)
    with HasRTCModuleImp
    with HasPeripheryUARTModuleImp
    with HasPeripherySPIModuleImp
    with HasPeripheryGPIOModuleImp
    with HasPeripherySPIFlashModuleImp
    with HasMemoryXilinxMIA702MIGModuleImp
    {
      // Reset vector is set to the location of the mask rom
      val maskROMParams = p(PeripheryMaskROMKey)
      global_reset_vector := maskROMParams(0).address.U
}
