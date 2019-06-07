package lab1

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class AccumulateTester (c: Accumulate) extends PeekPokeTester(c) {
  poke(c.io.x, 1)
  reset(1)
  expect(c.io.s, 1)
  step(2)
  expect(c.io.s, 3)
  poke(c.io.x, 2)
  step(1)
  expect(c.io.s, 5)

  poke(c.io.x, 5)
  step(1)
  expect(c.io.s, 10)
}

object AccumulateTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new Accumulate(n = 6)) {
    c => new AccumulateTester(c)
  }
}