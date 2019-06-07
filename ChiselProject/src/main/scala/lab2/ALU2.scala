package lab2

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class ALU2(n: Int, m: Int, k: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val s = Input(UInt(k.W))
    val y = Output(UInt(n.W))
    val f = Output(UInt(m.W))
  })  // ALU2 now has LS << and RS >>

  val sADD :: sMINUS :: sAND :: sOR :: sNOT :: sXOR :: sLS :: sRS :: Nil = Enum(8)
  val flag_zero = Wire(Bool())
//  val flag_sign = Wire(Bool())
  val flag_overflow = Wire(Bool())
  val flag_carry = Wire(Bool())
  // Carry, Sign, Overflow, Zeros
  val arith_result = WireInit(UInt((n + 1).W), 0.U)
  val sext_result = WireInit(SInt((n + 1).W), 0.S)

  when (io.s === sADD) {
    arith_result := io.a +& io.b
    sext_result := io.a.asSInt +& io.b.asSInt
    io.y := arith_result
  }.elsewhen (io.s === sMINUS) {
    arith_result := io.a -& io.b
    sext_result := io.a.asSInt -& io.b.asSInt
    io.y := arith_result
  }.elsewhen (io.s === sAND) {
    io.y := io.a & io.b
  }.elsewhen (io.s === sOR) {
    io.y := io.a | io.b
  }.elsewhen (io.s === sNOT) {
    io.y := ~io.a
  }.elsewhen (io.s === sXOR) {
    io.y := io.a ^ io.b
  }.elsewhen (io.s === sLS) {
    io.y := io.a << io.b
  }.elsewhen (io.s === sRS) {
    io.y := io.a >> io.b
  }.otherwise {
    io.y := 0.U
  }

  flag_zero := io.y === 0.U
  flag_overflow := (sext_result(n, n - 1) === "b01".U) | (sext_result(n, n - 1) === "b10".U)  // 01b or 10b
  flag_carry := arith_result(n)

  io.f := Cat(flag_carry, flag_overflow, flag_zero)
}

object Lab2_ALU2 extends App {
  chisel3.Driver.execute(args, () => new ALU2(n = 6, m = 3, k = 3))
}

/*
Note:
In unsigned arithmetic, watch the carry flag to detect errors.
In unsigned arithmetic, the overflow flag tells you nothing interesting.

In signed arithmetic, watch the overflow flag to detect errors.
In signed arithmetic, the carry flag tells you nothing interesting.
(From: http://teaching.idallen.com/dat2343/10f/notes/040_overflow.txt)
 */