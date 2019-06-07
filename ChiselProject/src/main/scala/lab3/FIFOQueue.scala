package lab3

import chisel3._
import chisel3.util._

//noinspection TypeAnnotation
class FIFOQueue (enable_display: Boolean) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(4.W))
    val en_in = Input(Bool())
    val en_out = Input(Bool())
    val out = Output(UInt(4.W))
    val display = if (enable_display) Some(Output(UInt(16.W))) else None
    val empty = Output(Bool())
    val full = Output(Bool())
  })

  val regfile = Module(new RegisterFile(m = 3, n = 4))  // 2**3 4-bit reg file

  // queue part
  val head = RegInit(0.U(3.W))
  val tail = RegInit(0.U(3.W))
  val empty = RegInit(true.B)
  val full = RegInit(false.B)

  val in_before = RegInit(false.B)
  val out_before = RegInit(false.B)
  val out_reg = RegInit(0.U(4.W))

  regfile.io.ra0 := DontCare
  if (enable_display) {
    val display = Module(new FIFODisplay)
    regfile.io.ra0 := display.io.ra0
    display.io.rd0 := regfile.io.rd0
    display.io.queue_head := head
    display.io.queue_tail := tail
    display.io.queue_empty := empty
    io.display.get := display.io.display
  }

  io.empty := empty
  io.full := full

  regfile.io.we := false.B
  regfile.io.wa := DontCare
  regfile.io.wd := DontCare
  regfile.io.ra1 := DontCare
  io.out := out_reg

//  printf("Head: %d, Tail: %d\n", head, tail)

  when (io.en_in & ~full & ~in_before) {
    regfile.io.we := true.B
    regfile.io.wa := head
    regfile.io.wd := io.in
    head := head + 1.U
    in_before := true.B
    empty := false.B

    when (head + 1.U === tail) {
//      printf("List is full!\n")
      full := true.B
    }
  }

  when (~io.en_in) {
    in_before := false.B
  }

  when (io.en_out & ~empty & ~out_before) {
    regfile.io.ra1 := tail
    out_reg := regfile.io.rd1
    tail := tail + 1.U
    out_before := true.B
    full := false.B

    when (head === tail + 1.U) {
      empty := true.B
    }
  }

  when (~io.en_out) {
    out_before := false.B
  }
}

object Lab3_3 extends App {
  chisel3.Driver.execute(args, () => new FIFOQueue(enable_display = true))
}