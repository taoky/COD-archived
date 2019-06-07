package lab1

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class Accumulate(n: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(n.W))
    val s = Output(UInt(n.W))
  })

  val alu = Module(new ALU(n = n, m = 3, k = 3))
  val reg = Module(new Register(n = n))
  reg.io.en := true.B
  alu.io.s := 0.U

  alu.io.a := io.x

  when (reset.toBool) {
    reg.io.in := io.x
    alu.io.b := 0.U
  }.otherwise {
    reg.io.in := alu.io.y
    alu.io.b := reg.io.out
  }

  io.s := reg.io.out
}

object Lab1_3b extends App {
  chisel3.Driver.execute(args, () => new Accumulate(n = 6))
}