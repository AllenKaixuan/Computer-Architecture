import chisel3._
import chisel3.util._
object Main {
  def main(args: Array[String]): Unit = {
    println(emitVerilog(new md5))
  }
}