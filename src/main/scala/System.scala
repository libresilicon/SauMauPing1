package libresilicon.soc

import Chisel._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.util.DontTouch

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

class SauMauPingSystem(implicit p: Parameters) extends RocketSubsystem
	with HasPeripheryUART
	with HasPeripherySPI
	with HasPeripheryGPIO
	//with HasPeripheryMaskROMSlave
	with HasAsyncExtInterrupts
	with CanHaveMasterAXI4MemPort
	with CanHaveMasterAXI4MMIOPort
	with CanHaveSlaveAXI4Port
	with HasPeripheryBootROM
	with HasSystemErrorSlave {
		override lazy val module = new SauMauPingSystemModuleImp(this)
	}

class SauMauPingSystemModuleImp[+L <: SauMauPingSystem](_outer: L) extends RocketSubsystemModuleImp(_outer)
	with HasPeripheryUARTModuleImp
	with HasPeripherySPIModuleImp
	with HasPeripheryGPIOModuleImp
	//with HasPeripheryBootROMModuleImp
	with HasRTCModuleImp
	with HasExtInterruptsModuleImp
	with CanHaveMasterAXI4MemPortModuleImp
	with CanHaveMasterAXI4MMIOPortModuleImp
	with CanHaveSlaveAXI4PortModuleImp
	with DontTouch
