organization := "com.libresilicon"
name := "saumauping"
version := "0.1.0"

lazy val commonSettings = Seq(
	scalaVersion := "2.12.4",  // This needs to match rocket-chip's scalaVersion
	scalacOptions ++= Seq(
		"-feature",
		"-unchecked",
		"-deprecation",
		"-language:reflectiveCalls",
		"-Xsource:2.11",
		"-Xsource:2.10"
	)
)

// A RootProject (not well-documented) tells sbt to treat the target directory
// as its own root project, reading its build settings. If we instead used the
// normal `project in file()` declaration, sbt would ignore all of rocket-chip's
// build settings, and therefore not understand that it has its own dependencies
// on chisel, etc.
lazy val rocketchip = RootProject(file("rocket-chip"))

lazy val scalafx = (project in file("scalafx"))
	.settings(commonSettings: _*)

lazy val fir2dot = (project in file("fir2dot"))
	.settings(commonSettings: _*)

lazy val firviewer = (project in file("firviewer"))
	.dependsOn(scalafx)
	.settings(commonSettings: _*)

lazy val sifiveBlocks = (project in file("sifive-blocks"))
	.dependsOn(rocketchip)
	.settings(commonSettings: _*)

lazy val fpgaShells = (project in file("fpga-shells"))
	.dependsOn(rocketchip)
	.dependsOn(sifiveBlocks)
	.settings(commonSettings: _*)

lazy val libreSiliconBlocks = (project in file("libresilicon-blocks"))
	.dependsOn(fpgaShells)
	.dependsOn(sifiveBlocks)
	.dependsOn(rocketchip)
	.settings(commonSettings: _*)

lazy val libreSiliconChips = (project in file("."))
	.dependsOn(libreSiliconBlocks) 
	.dependsOn(fpgaShells)
	.dependsOn(sifiveBlocks)
	.dependsOn(rocketchip)
	.dependsOn(fir2dot)
	.dependsOn(firviewer)
	.settings(commonSettings: _*)
