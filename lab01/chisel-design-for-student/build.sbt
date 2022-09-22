ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.8"
addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.3" cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.3"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.3" % "test"

lazy val root = (project in file("."))
  .settings(
    name := "md5-chip"
  )
