import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class roundTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "md5round"
  it should "do right thing" in {
    test(new md5round) { c =>
      c.io.a.poke(1.U)
      c.io.b.poke(0.U)
      c.io.c.poke(0.U)
      c.io.d.poke(0.U)
      c.io.m.poke(0.U)
      c.io.s.poke(0.U)
      c.io.t.poke(0.U)
      c.io.r.poke(0.U)
      println(s"out: ${c.io.next_a.peek().litValue}")
    }
  }
}
