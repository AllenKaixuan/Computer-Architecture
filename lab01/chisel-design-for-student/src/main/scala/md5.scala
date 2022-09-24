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
  val Anext = Wire(UInt(32.W))
  val Bnext = Wire(UInt(32.W))
  val Cnext = Wire(UInt(32.W))
  val Dnext = Wire(UInt(32.W))
  val phase = RegInit(0.U(4.W))
  val state = RegInit(1.U(8.W))
  val next_state = Wire(UInt(8.W))
  val msg = RegInit(0.U(512.W))
  val out_r = RegInit(false.B)
  
  
  val md5Round = Module(new md5round) //md5模块

 
  val cya = Wire(UInt(32.W))   //接口
  val cyb = Wire(UInt(32.W))
  val cyc = Wire(UInt(32.W))
  val cyd = Wire(UInt(32.W))

  // inital wires
  Anext := A
  Bnext := B
  Cnext := C
  Dnext := D
  next_state := state

  out_r := state(finished)
  io.out_valid := out_r
  io.ready := state(idle)
  io.out := A ## B ## C ## D

 
  md5Round.io.a := 0.U
  md5Round.io.b := 0.U
  md5Round.io.c := 0.U
  md5Round.io.d := 0.U
  md5Round.io.m := 0.U
  md5Round.io.s := 0.U
  md5Round.io.t := 0.U
  md5Round.io.r := 0.U
  cya := 0.U
  cyb := 0.U
  cyc := 0.U
  cyd := 0.U
  
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
 
  when(next_state(idle)) {   //根据时钟用Anext,Bnext,Cnext,Dnext更新A B C D
    A := defs.A
    B := defs.B
    C := defs.C
    D := defs.D
  }.otherwise {
    A := Anext
    B := Bnext
    C := Cnext
    D := Dnext
  }

  // TODO: add code for update phase
  
  when(next_state(r0) && state(idle)) {
    phase := 0.U
  } .otherwise {
    phase := phase + 1.U  // 进入下一轮循环
  }

  when(next_state(idle)) {
    msg := 0.U
  }.elsewhen(next_state(r0) && state(idle)) {
    
    msg := Cat(io.in, io.in, io.in, io.in) // 应该是对md5算法的修改，简单复制四份
  }

  // combine logic
  // TODO: add code for the starting of the state machine
 
  when(state(idle) && io.in_valid){  // 当idle状态时同时满足in_valid为1时启动
    next_state := UIntToOH(r0)
  }

  
  switch(phase(1, 0)) { //多路选择器
    is(0.U) {
      cya := A
      cyb := B
      cyc := C
      cyd := D
    }
    is(1.U) {
      cya := D
      cyb := A
      cyc := B
      cyd := C
    }
    is(2.U) {
      cya := C
      cyb := D
      cyc := A
      cyd := B
    }
    is(3.U) {
      cya := B
      cyb := C
      cyc := D
      cyd := A
    }
  }

  // TODO: add code for 4 rounds calc, you must use md5round module
  // round 0
  when(state(r0)) {
    md5Round.io.r := 0.U
    switch(phase(1, 0)) {
      is(0.U) {
        Anext := md5Round.io.next_a
      }
      is(1.U) {
        Dnext := md5Round.io.next_a
      }
      is(2.U) {
        Cnext := md5Round.io.next_a
      }
      is(3.U) {
        Bnext := md5Round.io.next_a
      }
    }
    md5Round.io.a := cya
    md5Round.io.b := cyb
    md5Round.io.c := cyc
    md5Round.io.d := cyd

    
    for(i <- 0 until 16) //每份明文32bit，512/32=16
      when(phase === i.U) {
        md5Round.io.m := msg(i * 32 + 31, i * 32)
        md5Round.io.s := defs.S(i)
        md5Round.io.t := defs.K(i)
      }

   
    when(phase === "b1111".U) {
      next_state := UIntToOH(r1)
    }
  }
  // round 1
  when(state(r1)) {
    md5Round.io.r := 1.U
    switch(phase(1, 0)) {
      is(0.U) {
        Anext := md5Round.io.next_a
      }
      is(1.U) {
        Dnext := md5Round.io.next_a
      }
      is(2.U) {
        Cnext := md5Round.io.next_a
      }
      is(3.U) {
        Bnext := md5Round.io.next_a
      }
    }
    md5Round.io.a := cya
    md5Round.io.b := cyb
    md5Round.io.c := cyc
    md5Round.io.d := cyd

   
    for(i <- 0 until 16)     // 第二轮处理
      when(phase === i.U) {
        val j = (i >> 1) | ((i << 3) & 0xf)
        md5Round.io.m := msg(j * 32 + 31, j * 32)
        md5Round.io.s := defs.S(16 + i)
        md5Round.io.t := defs.K(16 + i)
      }

    
    when(phase === "b1111".U) {
      next_state := UIntToOH(r2)
    }
  }
  // round 2
  when(state(r2)) {
    md5Round.io.r := 2.U
    switch(phase(1, 0)) {
      is(0.U) {
        Anext := md5Round.io.next_a
      }
      is(1.U) {
        Dnext := md5Round.io.next_a
      }
      is(2.U) {
        Cnext := md5Round.io.next_a
      }
      is(3.U) {
        Bnext := md5Round.io.next_a
      }
    }
    md5Round.io.a := cya
    md5Round.io.b := cyb
    md5Round.io.c := cyc
    md5Round.io.d := cyd

    
    for(i <- 0 until 16)    // 第三轮处理
      when(phase === i.U) {
        val j = (i >> 2) | ((i << 2) & 0xf)
        md5Round.io.m := msg(j * 32 + 31, j * 32)
        md5Round.io.s := defs.S(32 + i)
        md5Round.io.t := defs.K(32 + i)
      }

    when(phase === "b1111".U) {
      next_state := UIntToOH(r3)
    }
  }
  // round 3
  when(state(r3)) {
    md5Round.io.r := 3.U
    switch(phase(1, 0)) {
      is(0.U) {
        Anext := md5Round.io.next_a
      }
      is(1.U) {
        Dnext := md5Round.io.next_a
      }
      is(2.U) {
        Cnext := md5Round.io.next_a
      }
      is(3.U) {
        Bnext := md5Round.io.next_a
      }
    }
    md5Round.io.a := cya
    md5Round.io.b := cyb
    md5Round.io.c := cyc
    md5Round.io.d := cyd
    
    
    for(i <- 0 until 16)  //第四轮处理
      when(phase === i.U) {
        val j = (i >> 3) | ((i << 1) & 0xf)
        md5Round.io.m := msg(j * 32 + 31, j * 32)
        md5Round.io.s := defs.S(48 + i)
        md5Round.io.t := defs.K(48 + i)
      }

   
    when(phase === "b1111".U) {
      next_state := UIntToOH(finished)
    }
  }

  
  when(state(finished)) {
    printf(p"finished\n")
    // TODO: according to c code, add the final accumulate step
    
    Anext := A + AA   //初始值相加
    Bnext := B + BB
    Cnext := C + CC
    Dnext := D + DD
    next_state := UIntToOH(turn_arnd)
  }

  when(state(turn_arnd)) {
  
    next_state := UIntToOH(idle)
  }
}
