import chisel3._
import chisel3.util._


object defs {
  val A = 0x67452301.S(32.W).asUInt
  val B = 0xefcdab89.S(32.W).asUInt
  val C = 0x98badcfe.S(32.W).asUInt
  val D = 0x10325476.S(32.W).asUInt
}
