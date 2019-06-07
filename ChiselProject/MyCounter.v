module MyCounter( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [7:0] io_d, // @[:@6.4]
  input        io_ce, // @[:@6.4]
  input        io_pe, // @[:@6.4]
  output [7:0] io_q // @[:@6.4]
);
  reg [7:0] cnt; // @[MyCounter.scala 15:20:@8.4]
  reg [31:0] _RAND_0;
  wire [8:0] _T_16; // @[MyCounter.scala 21:16:@15.8]
  wire [7:0] _T_17; // @[MyCounter.scala 21:16:@16.8]
  wire [7:0] _GEN_0; // @[MyCounter.scala 20:22:@14.6]
  wire [7:0] _GEN_1; // @[MyCounter.scala 18:16:@10.4]
  assign _T_16 = cnt + 8'h1; // @[MyCounter.scala 21:16:@15.8]
  assign _T_17 = cnt + 8'h1; // @[MyCounter.scala 21:16:@16.8]
  assign _GEN_0 = io_ce ? _T_17 : cnt; // @[MyCounter.scala 20:22:@14.6]
  assign _GEN_1 = io_pe ? io_d : _GEN_0; // @[MyCounter.scala 18:16:@10.4]
  assign io_q = cnt; // @[MyCounter.scala 16:8:@9.4]
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
  cnt = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      cnt <= 8'h0;
    end else begin
      if (io_pe) begin
        cnt <= io_d;
      end else begin
        if (io_ce) begin
          cnt <= _T_17;
        end
      end
    end
  end
endmodule
