package lab2

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class Divide extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(4.W))
    val y = Input(UInt(4.W))
    val q = Output(UInt(4.W))
    val r = Output(UInt(4.W))
    val error = Output(Bool())
    val done = Output(Bool())
  })  // x / y = q ... r

  val sInit :: s1 :: s2 :: s3 :: sDone :: Nil = Enum(5)
  val state = RegInit(sInit)

  val alu_shift = Module(new ALU2(n = 8, m = 3, k = 3))
  alu_shift.io.s := 6.U
  val alu_minus = Module(new ALU2(n = 8, m = 3, k = 3))
  alu_minus.io.s := 1.U
  val alu_q = Module(new ALU2(n = 4, m = 3, k = 3))
  alu_q.io.s := 3.U  // or
  val cmp = Module(new Compare2(n = 8))

  val next_x = RegInit(io.x)

  alu_shift.io.a := io.y
  alu_shift.io.b := 0.U
  alu_minus.io.a := next_x
  alu_minus.io.b := 0.U

  val q_now = RegInit(0.U)
  alu_q.io.a := q_now
  alu_q.io.b := 0.U

  cmp.io.x := next_x
  cmp.io.y := alu_shift.io.y
  when (cmp.io.ug | cmp.io.eq) {  // next_x >= ls_y
    alu_minus.io.b := alu_shift.io.y
    next_x := alu_minus.io.y
    q_now := alu_q.io.y
  }

  io.error := false.B  // unless y = 0
  io.done := false.B
  io.q := q_now
  io.r := next_x

//  printf("next_x %d\n", next_x)
//  printf("LS A=%d, B=%d, Y=%d\n", alu_shift.io.a, alu_shift.io.b, alu_shift.io.y)
//  printf("MINUS A=%d, B=%d, Y=%d\n", alu_minus.io.a, alu_minus.io.b, alu_minus.io.y)
//  printf("CMP > %d, = %d\n", cmp.io.ug, cmp.io.eq)

  switch (state) {
    is (sInit) {
      when (io.y === 0.U) {
        io.error := true.B
        io.done := true.B
        io.q := 0.U
        io.r := 0.U
      }.otherwise {
        alu_shift.io.b := 3.U
        alu_q.io.b := "b1000".U
        state := s1
      }
    }
    is (s1) {
      alu_shift.io.b := 2.U
      alu_q.io.b := "b0100".U
      state := s2
    }
    is (s2) {
      alu_shift.io.b := 1.U
      alu_q.io.b := "b0010".U
      state := s3
    }
    is (s3) {
      alu_shift.io.b := 0.U
      alu_q.io.b := "b0001".U
      state := sDone
    }
    is (sDone) {
      io.done := true.B
    }
  }

}

object Lab2_2 extends App {
  chisel3.Driver.execute(args, () => new Divide())
}

// thanks to http://www.ece.lsu.edu/ee3755/2012f/l07.v.html for the algorithm