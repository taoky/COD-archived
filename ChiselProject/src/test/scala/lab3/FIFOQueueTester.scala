package lab3

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class FIFOQueueTester(c: FIFOQueue) extends PeekPokeTester(c) {
  poke(c.io.in, 1)
  poke(c.io.en_in, false)
  poke(c.io.en_out, false)
  reset(1)
  poke(c.io.en_in, true)
  step(1)
  poke(c.io.en_in, false)
  poke(c.io.in, 2)
  step(1)
  poke(c.io.en_in, true)
  step(1)
  poke(c.io.en_in, false)
  poke(c.io.en_out, true)
  step(1)
  expect(c.io.out, 1)
  poke(c.io.en_out, false)
  step(1)
  poke(c.io.en_out, true)
  step(1)
  expect(c.io.out, 2)
}

object FIFOQueueTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new FIFOQueue(enable_display = false)) {
    c => new FIFOQueueTester(c)
  }
}