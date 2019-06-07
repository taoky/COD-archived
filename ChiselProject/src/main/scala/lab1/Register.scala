package lab1

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class Register(n: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(n.W))
    val en = Input(Bool())
    val out = Output(UInt(n.W))
  })

  val reg = RegEnable(io.in, io.en)
  io.out := reg
}

object Lab1_2 extends App {
  chisel3.Driver.execute(args, () => new Register(n = 2))
}