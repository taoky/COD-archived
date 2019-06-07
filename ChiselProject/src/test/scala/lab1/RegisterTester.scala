package lab1

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class RegisterTester(c: Register) extends PeekPokeTester(c){
  poke(c.io.in, 5)
  poke(c.io.en, true)
  step(1)
  expect(c.io.out, 5)

  poke(c.io.en, false)
  poke(c.io.in, 10)
  step(1)
  expect(c.io.out, 5)  // the value should not be changed.

  poke(c.io.en, true)
  step(1)
  expect(c.io.out, 10)
}

object RegisterTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new Register(n = 5)) {
    c => new RegisterTester(c)
  }
}