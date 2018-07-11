package libresilicon.soc

import Chisel._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.util.DontTouch

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

import libresilicon.soc.dram._

class SauMauPingSystem(implicit p: Parameters) extends RocketSubsystem
	with HasPeripheryUART
	with HasPeripherySPI
	with HasPeripheryGPIO
	//with HasPeripheryDRAM
	with HasAsyncExtInterrupts
	//with HasPeripheryBootROM
	//with HasPeripheryMaskROMSlave
	with CanHaveMasterTLMMIOPort 
	with HasSystemErrorSlave 
{
	override lazy val module = new SauMauPingSystemModuleImp(this)
}

class SauMauPingSystemModuleImp[+L <: SauMauPingSystem](_outer: L) extends RocketSubsystemModuleImp(_outer)
	with HasPeripheryUARTModuleImp
	with HasPeripherySPIModuleImp
	with HasPeripheryGPIOModuleImp
	//with HasPeripheryDRAMImp
	with HasRTCModuleImp
	with HasExtInterruptsModuleImp
	//with HasPeripheryBootROMModuleImp
	with CanHaveMasterTLMMIOPortModuleImp
	with DontTouch

