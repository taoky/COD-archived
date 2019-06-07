package lab3

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class MyCounterTester(c: MyCounter) extends PeekPokeTester(c) {
  reset(1)
  poke(c.io.d, 2)
  poke(c.io.pe, true)
  step(1)
  poke(c.io.pe, false)
  expect(c.io.q, 2)
  poke(c.io.ce, true)
  step(1)
  expect(c.io.q, 3)
  step(1)
  expect(c.io.q, 4)
  step(1)
}

object MyCounterTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new MyCounter(n = 4)) {
    c => new MyCounterTester(c)
  }
}