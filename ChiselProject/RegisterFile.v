module RegisterFile( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [1:0] io_ra0, // @[:@6.4]
  output [1:0] io_rd0, // @[:@6.4]
  input  [1:0] io_ra1, // @[:@6.4]
  output [1:0] io_rd1, // @[:@6.4]
  input  [1:0] io_wa, // @[:@6.4]
  input  [1:0] io_wd, // @[:@6.4]
  input        io_we // @[:@6.4]
);
  reg [1:0] regs_0; // @[RegisterFile.scala 19:21:@13.4]
  reg [31:0] _RAND_0;
  reg [1:0] regs_1; // @[RegisterFile.scala 19:21:@13.4]
  reg [31:0] _RAND_1;
  reg [1:0] regs_2; // @[RegisterFile.scala 19:21:@13.4]
  reg [31:0] _RAND_2;
  reg [1:0] regs_3; // @[RegisterFile.scala 19:21:@13.4]
  reg [31:0] _RAND_3;
  wire [1:0] _GEN_1; // @[RegisterFile.scala 21:10:@14.4]
  wire [1:0] _GEN_2; // @[RegisterFile.scala 21:10:@14.4]
  wire [1:0] _GEN_5; // @[RegisterFile.scala 22:10:@15.4]
  wire [1:0] _GEN_6; // @[RegisterFile.scala 22:10:@15.4]
  wire [1:0] _GEN_8; // @[RegisterFile.scala 25:17:@17.6]
  wire [1:0] _GEN_9; // @[RegisterFile.scala 25:17:@17.6]
  wire [1:0] _GEN_10; // @[RegisterFile.scala 25:17:@17.6]
  wire [1:0] _GEN_11; // @[RegisterFile.scala 25:17:@17.6]
  wire [1:0] _GEN_12; // @[RegisterFile.scala 24:16:@16.4]
  wire [1:0] _GEN_13; // @[RegisterFile.scala 24:16:@16.4]
  wire [1:0] _GEN_14; // @[RegisterFile.scala 24:16:@16.4]
  wire [1:0] _GEN_15; // @[RegisterFile.scala 24:16:@16.4]
  assign _GEN_1 = 2'h1 == io_ra0 ? regs_1 : regs_0; // @[RegisterFile.scala 21:10:@14.4]
  assign _GEN_2 = 2'h2 == io_ra0 ? regs_2 : _GEN_1; // @[RegisterFile.scala 21:10:@14.4]
  assign _GEN_5 = 2'h1 == io_ra1 ? regs_1 : regs_0; // @[RegisterFile.scala 22:10:@15.4]
  assign _GEN_6 = 2'h2 == io_ra1 ? regs_2 : _GEN_5; // @[RegisterFile.scala 22:10:@15.4]
  assign _GEN_8 = 2'h0 == io_wa ? io_wd : regs_0; // @[RegisterFile.scala 25:17:@17.6]
  assign _GEN_9 = 2'h1 == io_wa ? io_wd : regs_1; // @[RegisterFile.scala 25:17:@17.6]
  assign _GEN_10 = 2'h2 == io_wa ? io_wd : regs_2; // @[RegisterFile.scala 25:17:@17.6]
  assign _GEN_11 = 2'h3 == io_wa ? io_wd : regs_3; // @[RegisterFile.scala 25:17:@17.6]
  assign _GEN_12 = io_we ? _GEN_8 : regs_0; // @[RegisterFile.scala 24:16:@16.4]
  assign _GEN_13 = io_we ? _GEN_9 : regs_1; // @[RegisterFile.scala 24:16:@16.4]
  assign _GEN_14 = io_we ? _GEN_10 : regs_2; // @[RegisterFile.scala 24:16:@16.4]
  assign _GEN_15 = io_we ? _GEN_11 : regs_3; // @[RegisterFile.scala 24:16:@16.4]
  assign io_rd0 = 2'h3 == io_ra0 ? regs_3 : _GEN_2; // @[RegisterFile.scala 21:10:@14.4]
  assign io_rd1 = 2'h3 == io_ra1 ? regs_3 : _GEN_6; // @[RegisterFile.scala 22:10:@15.4]
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
  regs_0 = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      regs_0 <= 2'h0;
    end else begin
      if (io_we) begin
        if (2'h0 == io_wa) begin
          regs_0 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_1 <= 2'h0;
    end else begin
      if (io_we) begin
        if (2'h1 == io_wa) begin
          regs_1 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_2 <= 2'h0;
    end else begin
      if (io_we) begin
        if (2'h2 == io_wa) begin
          regs_2 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_3 <= 2'h0;
    end else begin
      if (io_we) begin
        if (2'h3 == io_wa) begin
          regs_3 <= io_wd;
        end
      end
    end
  end
endmodule
