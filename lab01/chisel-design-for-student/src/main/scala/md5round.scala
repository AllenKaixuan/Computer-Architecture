import chisel3._
import chisel3.util._
class md5round extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(32.W))  // 参照c代码设置变量
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
 
  def F(x: UInt, y: UInt, z: UInt): UInt = {    // 四种处理方式
    (x & y) | ((~x).asUInt & z)
  }
  def G(x: UInt, y: UInt, z: UInt): UInt = {
    (x & z) | (y & (~z).asUInt)
  }
  def H(x: UInt, y: UInt, z: UInt): UInt = {
    x ^ y ^ z
  }
  def I(x: UInt, y: UInt, z: UInt): UInt = {
    y ^ (x | (~z).asUInt)
  }

 
  val res = Wire(UInt(32.W))   //处理结果
  res := 0.U
  

 
  switch(io.r) {
    is(0.U) {
      res := io.a + F(io.b, io.c, io.d) + io.m + io.t
    }
    is(1.U) {
      res := io.a + G(io.b, io.c, io.d) + io.m + io.t
    }
    is(2.U) {
      res := io.a + H(io.b, io.c, io.d) + io.m + io.t
    }
    is(3.U) {
      res := io.a + I(io.b, io.c, io.d) + io.m + io.t
    }
  }

  io.next_a := io.b +Seq(res << io.s, res >> (32.U - io.s)).reduce(_|_)
  
}
