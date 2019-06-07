package lab3

import chisel3._
import chisel3.core.withClock
import chisel3.util._

//noinspection TypeAnnotation
class FIFODisplay extends Module {
  val io = IO(new Bundle {
    val ra0 = Output(UInt(3.W))  // address
    val rd0 = Input(UInt(4.W))  // result
    val queue_head = Input(UInt(3.W))
    val queue_tail = Input(UInt(3.W))
    val queue_empty = Input(Bool())
    val display = Output(UInt(16.W))
  })

  val divide = Module(new freechip_utils.Pow2ClockDivider(pow2 = 17))

  withClock (divide.io.clock_out) {
    val i = RegInit(0.U(3.W))
    val dp = Module(new SegmentDisplay)

    val has_display = WireInit(true.B)
    val output_number = Wire(UInt(7.W))

    io.ra0 := i
    dp.io.number := 10.U  // will print nothing
//    when (i >= io.queue_tail | i <= io.queue_head) {
//      dp.io.number := io.rd0
//    }
    when (io.queue_tail < io.queue_head) {
      when (i >= io.queue_tail & i < io.queue_head) {
        dp.io.number := io.rd0
      }.otherwise {
        has_display := false.B
      }
    }.elsewhen (io.queue_tail === io.queue_head) {
      when (~io.queue_empty) {
        dp.io.number := io.rd0
      }.otherwise {
        has_display := false.B
      }
    }.otherwise {
      when (i >= io.queue_tail | i < io.queue_head) {
        dp.io.number := io.rd0
      }.otherwise {
        has_display := false.B
      }
    }

    when (has_display) {
      output_number := dp.io.segment
    }.otherwise {
      output_number := "b1111111".U
    }


    i := i + 1.U

    io.display := Cat(~UIntToOH(i, width = 8), i =/= io.queue_tail, output_number)
  }
}

//noinspection TypeAnnotation
class SegmentDisplay extends Module {
  val io = IO(new Bundle {
    val number = Input(UInt(4.W))
    val segment = Output(UInt(7.W))  // an[0..7]
  })

  io.segment := "b1111111".U  // display nothing
  switch (io.number) {
    is (0.U) { io.segment := "b0000001".U }
    is (1.U) { io.segment := "b1001111".U }
    is (2.U) { io.segment := "b0010010".U }
    is (3.U) { io.segment := "b0000110".U }
    is (4.U) { io.segment := "b1001100".U }
    is (5.U) { io.segment := "b0100100".U }
    is (6.U) { io.segment := "b0100000".U }
    is (7.U) { io.segment := "b0001111".U }
    is (8.U) { io.segment := "b0000000".U }
    is (9.U) { io.segment := "b0000100".U }
    is (10.U) { io.segment := "b0001000".U }
    is (11.U) { io.segment := "b1100000".U }
    is (12.U) { io.segment := "b0110001".U }
    is (13.U) { io.segment := "b1000010".U }
    is (14.U) { io.segment := "b0110000".U }
    is (15.U) { io.segment := "b0111000".U }
  }
}