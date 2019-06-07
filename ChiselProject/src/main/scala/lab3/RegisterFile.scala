package lab3

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class RegisterFile (n: Int, m: Int) extends Module {
  val io = IO(new Bundle {
    val ra0 = Input(UInt(m.W))
    val rd0 = Output(UInt(n.W))
    val ra1 = Input(UInt(m.W))
    val rd1 = Output(UInt(n.W))
    val wa = Input(UInt(m.W))
    val wd = Input(UInt(n.W))
    val we = Input(Bool())
  })  // 2**m n-bit regs

  val regTotalNum = 1 << m
  val regs = RegInit(VecInit(Seq.fill(regTotalNum)(0.U(n.W))))

  io.rd0 := regs(io.ra0)
  io.rd1 := regs(io.ra1)

  when (io.we) {
    regs(io.wa) := io.wd
  }
}

object Lab3_1 extends App {
  chisel3.Driver.execute(args, () => new RegisterFile(m = 2, n = 2))  // 4 4-bit regs
}