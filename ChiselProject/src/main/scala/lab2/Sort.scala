package lab2

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class CompareSwap(n: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(n.W))
    val y = Input(UInt(n.W))
    val new_x = Output(UInt(n.W))
    val new_y = Output(UInt(n.W))
  })  // descending order

  val cmp = Module(new lab1.Compare(n = n))
  cmp.io.x := io.x
  cmp.io.y := io.y
  io.new_x := io.x
  io.new_y := io.y

  when (cmp.io.ul) {
    io.new_x := io.y
    io.new_y := io.x
  }
}

//noinspection TypeAnnotation
class Sort extends Module {
  val io = IO(new Bundle {
    val x0 = Input(UInt(4.W))
    val x1 = Input(UInt(4.W))
    val x2 = Input(UInt(4.W))
    val x3 = Input(UInt(4.W))
    val s0 = Output(UInt(4.W))
    val s1 = Output(UInt(4.W))
    val s2 = Output(UInt(4.W))
    val s3 = Output(UInt(4.W))
    val done = Output(Bool())
  })

  val cmp1 = Module(new CompareSwap(n = 4))
  val cmp2 = Module(new CompareSwap(n = 4))  // for parallel comparing
  val sInit :: s1 :: s2 :: sDone :: Nil = Enum(4)
  val new_x = RegInit(VecInit(io.x0, io.x1, io.x2, io.x3))
  val state = RegInit(sInit)

  io.done := (state === sDone)
  io.s0 := new_x(0)
  io.s1 := new_x(1)
  io.s2 := new_x(2)
  io.s3 := new_x(3)

  cmp1.io.x := io.s0
  cmp1.io.y := io.s1
  cmp2.io.x := io.s2
  cmp2.io.y := io.s3


  switch (state) {
    is (sInit) {
      cmp1.io.x := new_x(0)
      cmp1.io.y := new_x(1)
      cmp2.io.x := new_x(2)
      cmp2.io.y := new_x(3)
      new_x := VecInit(cmp1.io.new_x, cmp1.io.new_y, cmp2.io.new_x, cmp2.io.new_y)

      state := s1
    }
    is (s1) {
      cmp1.io.x := new_x(1)
      cmp1.io.y := new_x(2)
      cmp2.io.x := new_x(0)
      cmp2.io.y := new_x(3)
      new_x := VecInit(cmp2.io.new_x, cmp1.io.new_x, cmp1.io.new_y, cmp2.io.new_y)

      state := s2
    }
    is (s2) {
      cmp1.io.x := new_x(0)
      cmp1.io.y := new_x(1)
      cmp2.io.x := new_x(2)
      cmp2.io.y := new_x(3)
      new_x := VecInit(cmp1.io.new_x, cmp1.io.new_y, cmp2.io.new_x, cmp2.io.new_y)

      state := sDone
    }
  }

}

object Lab2_1 extends App {
  chisel3.Driver.execute(args, () => new Sort())
}