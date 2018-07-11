// See LICENSE for license details.
package libresilicon.soc

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.system._
import freechips.rocketchip.tile._
import freechips.rocketchip.system.DefaultConfig
import freechips.rocketchip.system.BaseConfig
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy._

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

import libresilicon.soc.dram._

class SauMauPingPeripherals extends Config((site, here, up) => {
	case PeripheryDRAMKey => List(
		DRAMParams(
			address = AddressSet(0x80000000L, 0x10000000L),
			data_width = 32,
			address_width = 15,
			bank_address_width = 3,
			data_mask_wdith = 4,
			differential_data_strobe_width = 4
		)
	)
	case PeripheryMaskROMKey => List(
		MaskROMParams(
			address = 0x10000,
			depth = 2048,
			//depth = 4096,
			//depth = 32768,
			name = "BootROM"
		)
	)
	case PeripheryUARTKey => List(
		UARTParams(
			address = BigInt(0x20000L)
		)
	)
	case PeripherySPIFlashKey => List(
		SPIFlashParams(
			fAddress = 0x20000000,
			rAddress = 0x10014000,
			sampleDelay = 3
		)
	)
	case PeripherySPIKey => List(
		SPIParams(
			rAddress = BigInt(0x30000L)
		)
	)
	case PeripheryGPIOKey => List(
		GPIOParams(
			address = BigInt(0x65000L),
			width = 4
		)
	)
})

class SauMauPingConfig extends Config(
	new TinyConfig()			++
	//new DefaultConfig()			++
	new SauMauPingPeripherals()
)

