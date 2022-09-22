import chisel3._
import chisel3.util._
class md5round extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))
    val c = Input(UInt(32.W))
    val d = Input(UInt(32.W))
    val m = Input(UInt(32.W))
    val s = Input(UInt(5.W))
    val t = Input(UInt(32.W))
    val r = Input(UInt(2.W))
    val next_a = Output(UInt(32.W))
  })
  // TODO: add code for calculating single round
  ???
}
