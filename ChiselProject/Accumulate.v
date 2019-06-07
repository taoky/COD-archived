module ALU( // @[:@3.2]
  input  [5:0] io_a, // @[:@6.4]
  input  [5:0] io_b, // @[:@6.4]
  output [5:0] io_y // @[:@6.4]
);
  wire [6:0] arith_result; // @[ALU.scala 26:26:@17.6]
  assign arith_result = io_a + io_b; // @[ALU.scala 26:26:@17.6]
  assign io_y = arith_result[5:0]; // @[ALU.scala 28:10:@23.6 ALU.scala 32:10:@35.8 ALU.scala 34:10:@41.10 ALU.scala 36:10:@47.12 ALU.scala 38:10:@53.14 ALU.scala 40:10:@59.16 ALU.scala 42:10:@62.16]
endmodule
module Register( // @[:@78.2]
  input        clock, // @[:@79.4]
  input  [5:0] io_in, // @[:@81.4]
  output [5:0] io_out // @[:@81.4]
);
  reg [5:0] reg$; // @[Reg.scala 11:16:@83.4]
  reg [31:0] _RAND_0;
  assign io_out = reg$; // @[Register.scala 15:10:@87.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[5:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    reg$ <= io_in;
  end
endmodule
module Accumulate( // @[:@89.2]
  input        clock, // @[:@90.4]
  input        reset, // @[:@91.4]
  input  [5:0] io_x, // @[:@92.4]
  output [5:0] io_s // @[:@92.4]
);
  wire [5:0] alu_io_a; // @[Accumulate.scala 13:19:@94.4]
  wire [5:0] alu_io_b; // @[Accumulate.scala 13:19:@94.4]
  wire [5:0] alu_io_y; // @[Accumulate.scala 13:19:@94.4]
  wire  reg$_clock; // @[Accumulate.scala 14:19:@97.4]
  wire [5:0] reg$_io_in; // @[Accumulate.scala 14:19:@97.4]
  wire [5:0] reg$_io_out; // @[Accumulate.scala 14:19:@97.4]
  ALU alu ( // @[Accumulate.scala 13:19:@94.4]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_y(alu_io_y)
  );
  Register reg$ ( // @[Accumulate.scala 14:19:@97.4]
    .clock(reg$_clock),
    .io_in(reg$_io_in),
    .io_out(reg$_io_out)
  );
  assign io_s = reg$_io_out; // @[Accumulate.scala 28:8:@112.4]
  assign alu_io_a = io_x; // @[Accumulate.scala 18:12:@102.4]
  assign alu_io_b = reset ? 6'h0 : reg$_io_out; // @[Accumulate.scala 22:14:@106.6 Accumulate.scala 25:14:@110.6]
  assign reg$_clock = clock; // @[:@98.4]
  assign reg$_io_in = reset ? io_x : alu_io_y; // @[Accumulate.scala 21:15:@105.6 Accumulate.scala 24:15:@109.6]
endmodule
