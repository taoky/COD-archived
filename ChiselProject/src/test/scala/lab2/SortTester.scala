package lab2

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class SortTester(c: Sort) extends PeekPokeTester(c) {
  for (x0 <- 0 to 15) {
    for (x1 <- 0 to 15) {
      for (x2 <- 0 to 15) {
        for (x3 <- 0 to 15) {
          poke(c.io.x0, x0)
          poke(c.io.x1, x1)
          poke(c.io.x2, x2)
          poke(c.io.x3, x3)
          reset(1)
          step(3)
          val l = Seq(x0, x1, x2, x3).sorted(Ordering.Int.reverse)
          expect(c.io.s0, l(0))
          expect(c.io.s1, l(1))
          expect(c.io.s2, l(2))
          expect(c.io.s3, l(3))
          expect(c.io.done, true)
        }
      }
    }
  }
}

object SortTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new Sort()) {
    c => new SortTester(c)
  }
}