package lab2

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class DivideTester(c: Divide) extends PeekPokeTester(c) {
  for (x0 <- 0 to 15) {
    for (x1 <- 0 to 15) {
      poke(c.io.x, x0)
      poke(c.io.y, x1)
      reset(1)
      step(4)
      expect(c.io.done, true)
      if (x1 == 0) {
        expect(c.io.error, true)
      }
      else {
        expect(c.io.q, x0 / x1)
        expect(c.io.r, x0 % x1)
      }
    }
  }
//  poke(c.io.x, 12)
//  poke(c.io.y, 5)
//  reset(1)
//  step(10)
}

object DivideTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new Divide()) {
    c => new DivideTester(c)
  }
}