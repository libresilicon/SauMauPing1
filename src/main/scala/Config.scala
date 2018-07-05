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
	case PeripherySPIKey => List(
		SPIParams(
			rAddress = BigInt(0x21000L)
		)
	)
	case PeripheryGPIOKey => List(
		GPIOParams(
			address = BigInt(0x22000L),
			width = 4
		)
	)
	case PeripheryDRAMKey => List(
		DRAMParams(
			address = AddressSet(0x3000000000L, 0xFFFFFFFFL),
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
})

class SauMauPingConfig extends Config(
	new WithNBigCores(1)			++
	new BaseConfig()			++
	new WithNExtTopInterrupts(0)		++
	new SauMauPingPeripherals()		/*++
	new SauMauPingConfig().alter((site,here,up) => {
		case PeripheryBusKey => up(PeripheryBusKey, site).copy(frequency = 50000000) // 50 MHz periphery
		case DTSTimebase => BigInt(1000000)
		case ExtMem => up(ExtMem).map(_.copy(size = 0x40000000L))
	})*/
)

