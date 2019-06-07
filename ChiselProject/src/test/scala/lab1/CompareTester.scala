package lab1

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class CompareTester (c: Compare) extends PeekPokeTester(c) {

  def s_handle(x: Int): Int = {
    if (x >= 32) x - 64 else x
  }

  for (i <- 0 to 63) {
    for (j <- 0 to 63) {
      println(s"i = $i, j = $j")
      poke(c.io.x, i)
      poke(c.io.y, j)
      expect(c.io.eq, i == j)
      expect(c.io.ul, i < j)
      expect(c.io.ug, i > j)
      expect(c.io.sl, s_handle(i) < s_handle(j))
      expect(c.io.sg, s_handle(i) > s_handle(j))
      step(1)  // for the wave
    }
  }
}

object CompareTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new Compare(n = 6)) {
    c => new CompareTester(c)
  }
}