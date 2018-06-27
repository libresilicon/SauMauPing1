// See LICENSE for license details.
package libresilicon.soc

import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.system._
import freechips.rocketchip.tile._
import freechips.rocketchip.system.DefaultConfig
import freechips.rocketchip.system.BaseConfig

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._

class SauMauPingPeripherals extends Config((site, here, up) => {
  case PeripheryUARTKey => List(UARTParams(address = BigInt(0x20000L)))
  case PeripherySPIKey => List(SPIParams(rAddress = BigInt(0x21000L)))
  case PeripheryGPIOKey => List(GPIOParams(address = BigInt(0x22000L), width = 4))
  case PeripheryMaskROMKey => List(MaskROMParams(address = 0x10000, name = "BootROM"))
})

class SauMauPingConfig extends Config(
  new DefaultConfig()    ++
  new SauMauPingPeripherals
)

