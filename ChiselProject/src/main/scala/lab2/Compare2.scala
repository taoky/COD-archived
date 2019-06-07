package lab2

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class Compare2(n: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(n.W))
    val y = Input(UInt(n.W))
    val ug = Output(Bool())
    val ul = Output(Bool())
    val eq = Output(Bool())
    val sg = Output(Bool())
    val sl = Output(Bool())
  })



  val alu = Module(new ALU2(n = n, m = 3, k = 3))
  alu.io.a := io.x
  alu.io.b := io.y
  alu.io.s := 1.U // minus
  io.eq := alu.io.f(0)  // zero
  io.ug := ~io.eq & ~alu.io.f(2)  // carry
  io.ul := ~io.eq & alu.io.f(2)
  io.sg := ~io.eq & (~alu.io.y(n - 1) ^ alu.io.f(1))
  io.sl := ~io.eq & (alu.io.y(n - 1) ^ alu.io.f(1))
}

object Lab2_Compare2 extends App {
  chisel3.Driver.execute(args, () => new Compare2(n = 6))
}