package lab1

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class Fibonacci(n: Int) extends Module {
  val io = IO(new Bundle {
    val f0 = Input(UInt(n.W))
    val f1 = Input(UInt(n.W))
    val fn = Output(UInt(n.W))
  })

  val alu = Module(new ALU(n = n, m = 3, k = 3))
  alu.io.s := 0.U  // add
  val v1 = Module(new Register(n = n))
  val v2 = Module(new Register(n = n))
  v1.io.en := true.B
  v2.io.en := true.B

  alu.io.a := v1.io.out
  alu.io.b := v2.io.out

  when (reset.toBool) {
    v1.io.in := io.f0
    v2.io.in := io.f1
    alu.io.a := io.f0
    alu.io.b := io.f1
  }.otherwise {
    v1.io.in := v2.io.out
    v2.io.in := alu.io.y
  }

//  printf("v1.in: %d, v2.in: %d\n", v1.io.in, v2.io.in)
//  printf("v1.out: %d, v2.out: %d\n", v1.io.out, v2.io.out)
//  printf("io.fn: %d\n", io.fn)

  io.fn := v2.io.out
}

object Lab1_3c extends App {
  chisel3.Driver.execute(args, () => new Fibonacci(n = 6))
}