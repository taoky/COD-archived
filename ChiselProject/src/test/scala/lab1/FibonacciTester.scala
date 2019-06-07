package lab1

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class FibonacciTester(c: Fibonacci) extends PeekPokeTester(c) {
  poke(c.io.f0, 1)
  poke(c.io.f1, 2)
  reset(1)
  expect(c.io.fn, 2)
  step(1)
  expect(c.io.fn, 3)
  step(1)
  expect(c.io.fn, 5)
  step(1)
  expect(c.io.fn, 8)
  step(1)
  expect(c.io.fn, 13)
  step(1)
  expect(c.io.fn, 21)
//  for (i <- 0 to 10) {
//    println(s"result: ${peek(c.io.fn)} when i = $i")
//    step(1)
//  }
}

object FibonacciTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new Fibonacci(n = 6)) {
    c => new FibonacciTester(c)
  }
}