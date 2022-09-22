import chisel3._
import chisel3.util._

import scala.language.postfixOps

class md5 extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(128.W))
    val in_valid = Input(Bool())

    val out = Output(UInt(128.W))
    val out_valid = Output(Bool())
    val ready = Output(Bool())
  })
  io.out := 0.U
  io.out_valid := false.B
  io.ready := false.B
  val idle :: r0 :: r1 :: r2 :: r3 :: finished :: turn_arnd :: Nil = Enum(7)
  val A = RegInit(defs.A)
  val B = RegInit(defs.B)
  val C = RegInit(defs.C)
  val D = RegInit(defs.D)
  val AA = RegInit(0.U(32.W))
  val BB = RegInit(0.U(32.W))
  val CC = RegInit(0.U(32.W))
  val DD = RegInit(0.U(32.W))
  val next_A = Wire(UInt(32.W))
  val next_B = Wire(UInt(32.W))
  val next_C = Wire(UInt(32.W))
  val next_D = Wire(UInt(32.W))
  val phase = RegInit(0.U(4.W))
  val state = RegInit(1.U(8.W))
  val next_state = Wire(UInt(8.W))
  val msg = RegInit(0.U(512.W))
  val out_r = RegInit(false.B)

  // inital wires
  next_A := A
  next_B := B
  next_C := C
  next_D := D
  next_state := state

  out_r := state(finished)
  io.out_valid := out_r
  io.ready := state(idle)
  io.out := A ## B ## C ## D

  // update regs
  state := next_state

  when(next_state(idle)) {
    AA := 0.U
    BB := 0.U
    CC := 0.U
    DD := 0.U
  }.elsewhen(next_state(r0) && state(idle)) {
    AA := A
    BB := B
    CC := C
    DD := D
  }

  // TODO: add code for update A B C D
  ???

  // TODO: add code for update phase
  ???

  when(next_state(idle)) {
    msg := 0.U
  }.elsewhen(next_state(r0) && state(idle)) {
    msg := Cat(io.in, io.in, io.in, io.in)
  }

  // combine logic
  // TODO: add code for the starting of the state machine
  ???

  // TODO: add code for 4 rounds calc, you must use md5round module
  ???

  when(state(finished)) {
    printf(p"finished\n")
    // TODO: according to c code, add the final accumulate step
    ???
    next_state := UIntToOH(turn_arnd)
  }

  when(state(turn_arnd)) {
    printf(p"turn_arnd\n")
    next_state := UIntToOH(idle)
  }
}
