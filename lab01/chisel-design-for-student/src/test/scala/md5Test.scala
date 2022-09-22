import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class md5Test extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "md5"
  it should "do right thing" in {
    test(new md5).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      while(c.io.ready.peek().litValue == 0) c.clock.step()
      c.io.in.poke(0x35.U)
      c.io.in_valid.poke(true.B)
      while(c.io.out_valid.peek().litValue == 0) c.clock.step()
      println(c.io.out.peek().litValue.toString(16))
      c.reset.poke(true.B)
      c.clock.step()
      c.reset.poke(false.B)
      while(c.io.ready.peek().litValue == 0) c.clock.step()
      c.io.in.poke(0x3.U)
      c.io.in_valid.poke(true.B)
      while(c.io.out_valid.peek().litValue == 0) c.clock.step()
      println(c.io.out.peek().litValue.toString(16))
    }
  }
}
