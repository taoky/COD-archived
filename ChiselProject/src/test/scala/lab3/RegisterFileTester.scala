package lab3

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class RegisterFileTester(c: RegisterFile) extends PeekPokeTester(c) {
  reset(1)
  poke(c.io.we, true)
  poke(c.io.wa, 1)
  poke(c.io.wd, 2)
  step(1)
  poke(c.io.wa, 2)
  poke(c.io.wd, 0)
  step(1)

  poke(c.io.we, false)
  poke(c.io.ra0, 1)
  expect(c.io.rd0, 2)

  poke(c.io.ra1, 2)
  expect(c.io.rd1, 0)

  step(1)
  poke(c.io.wa, 0)
  poke(c.io.wd, 1)
  step(1)
  poke(c.io.ra0, 0)
  expect(c.io.rd0, 0)  // this value should not be changed
  step(1)
}

object RegisterFileTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new RegisterFile(n = 2, m = 2)) {
    c => new RegisterFileTester(c)
  }
}