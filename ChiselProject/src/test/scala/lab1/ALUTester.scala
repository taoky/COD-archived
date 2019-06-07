package lab1

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class ALUTester(c: ALU) extends PeekPokeTester(c) {
  poke(c.io.a, 1)
  poke(c.io.b, 2)
  poke(c.io.s, 0)
  step(1)
  expect(c.io.y, 3)
  expect(c.io.f, 0)  // 1 + 2 = 3, flags = 0

  poke(c.io.a, 30)
  poke(c.io.b, 23)
  poke(c.io.s, 1)
  step(1)
  expect(c.io.y, 7)
  expect(c.io.f, 0)  // 30 - 23 = 7, flags = 0

  poke(c.io.a, 20)
  poke(c.io.b, 15)
  poke(c.io.s, 2)
  step(1)
  expect(c.io.y, 4)
  expect((peek(c.io.f) & 1).U, 0)  // 20 & 15 = 4, zero flag = 0

  poke(c.io.a, 20)
  poke(c.io.b, 15)
  poke(c.io.s, 3)
  step(1)
  expect(c.io.y, 31)
  expect((peek(c.io.f) & 1).U, 0)  // 20 | 15 = 31, zero flag = 0

  poke(c.io.a, 20)
  poke(c.io.s, 4)
  step(1)
  expect(c.io.y, 43)
  expect((peek(c.io.f) & 1).U, 0)  // ~20 = 43 (n = 6), zero flag = 0

  poke(c.io.a, 20)
  poke(c.io.b, 15)
  poke(c.io.s, 5)
  step(1)
  expect(c.io.y, 27)
  expect((peek(c.io.f) & 1).U, 0)  // 20 ^ 15 = 27, zero flag = 0

  poke(c.io.a, 20)
  poke(c.io.b, 20)
  poke(c.io.s, 5)
  step(1)
  expect(c.io.y, 0)
  expect((peek(c.io.f) & 1).U, 1)  // 20 ^ 20 = 0, zero flag = 1

  poke(c.io.a, 31)
  poke(c.io.b, 31)
  poke(c.io.s, 0)
  step(1)
  expect(c.io.y, 62)
  expect(c.io.f, 2)  // 31 + 31 = 62 (-2), flags = 2 (OVERFLOW)

  poke(c.io.a, 32)
  poke(c.io.b, 32)
  poke(c.io.s, 0)
  step(1)
  expect(c.io.y, 0)
  expect(c.io.f, 7)  // (-32 + -32 = 0) , flags = 7 (CARRY & OVERFLOW & ZERO)
}

object ALUTest extends App {
  val _args = Array("--backend-name", "treadle", "-tgvo", "on")
  chisel3.iotesters.Driver.execute(_args, () => new ALU(n = 6, m = 3, k = 3)) {
    c => new ALUTester(c)
  }
}