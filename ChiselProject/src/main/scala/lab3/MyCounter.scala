package lab3

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class MyCounter (n: Int) extends Module {
  val io = IO(new Bundle {
    val d = Input(UInt(n.W))
    val ce = Input(Bool())
    val pe = Input(Bool())
    val q = Output(UInt(n.W))
  })

  val cnt = RegInit(0.U(n.W))
  io.q := cnt

  when (io.pe) {
    cnt := io.d
  }.elsewhen (io.ce) {
    cnt := cnt + 1.U
  }
}

object Lab3_2 extends App {
  chisel3.Driver.execute(args, () => new MyCounter(n = 8))  // 8-bit counter
}