module RegisterFile( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [2:0] io_ra0, // @[:@6.4]
  output [3:0] io_rd0, // @[:@6.4]
  input  [2:0] io_ra1, // @[:@6.4]
  output [3:0] io_rd1, // @[:@6.4]
  input  [2:0] io_wa, // @[:@6.4]
  input  [3:0] io_wd, // @[:@6.4]
  input        io_we // @[:@6.4]
);
  reg [3:0] regs_0; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_0;
  reg [3:0] regs_1; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_1;
  reg [3:0] regs_2; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_2;
  reg [3:0] regs_3; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_3;
  reg [3:0] regs_4; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_4;
  reg [3:0] regs_5; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_5;
  reg [3:0] regs_6; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_6;
  reg [3:0] regs_7; // @[RegisterFile.scala 19:21:@17.4]
  reg [31:0] _RAND_7;
  wire [3:0] _GEN_1; // @[RegisterFile.scala 21:10:@18.4]
  wire [3:0] _GEN_2; // @[RegisterFile.scala 21:10:@18.4]
  wire [3:0] _GEN_3; // @[RegisterFile.scala 21:10:@18.4]
  wire [3:0] _GEN_4; // @[RegisterFile.scala 21:10:@18.4]
  wire [3:0] _GEN_5; // @[RegisterFile.scala 21:10:@18.4]
  wire [3:0] _GEN_6; // @[RegisterFile.scala 21:10:@18.4]
  wire [3:0] _GEN_9; // @[RegisterFile.scala 22:10:@19.4]
  wire [3:0] _GEN_10; // @[RegisterFile.scala 22:10:@19.4]
  wire [3:0] _GEN_11; // @[RegisterFile.scala 22:10:@19.4]
  wire [3:0] _GEN_12; // @[RegisterFile.scala 22:10:@19.4]
  wire [3:0] _GEN_13; // @[RegisterFile.scala 22:10:@19.4]
  wire [3:0] _GEN_14; // @[RegisterFile.scala 22:10:@19.4]
  wire [3:0] _GEN_16; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_17; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_18; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_19; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_20; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_21; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_22; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_23; // @[RegisterFile.scala 25:17:@21.6]
  wire [3:0] _GEN_24; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_25; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_26; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_27; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_28; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_29; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_30; // @[RegisterFile.scala 24:16:@20.4]
  wire [3:0] _GEN_31; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_1 = 3'h1 == io_ra0 ? regs_1 : regs_0; // @[RegisterFile.scala 21:10:@18.4]
  assign _GEN_2 = 3'h2 == io_ra0 ? regs_2 : _GEN_1; // @[RegisterFile.scala 21:10:@18.4]
  assign _GEN_3 = 3'h3 == io_ra0 ? regs_3 : _GEN_2; // @[RegisterFile.scala 21:10:@18.4]
  assign _GEN_4 = 3'h4 == io_ra0 ? regs_4 : _GEN_3; // @[RegisterFile.scala 21:10:@18.4]
  assign _GEN_5 = 3'h5 == io_ra0 ? regs_5 : _GEN_4; // @[RegisterFile.scala 21:10:@18.4]
  assign _GEN_6 = 3'h6 == io_ra0 ? regs_6 : _GEN_5; // @[RegisterFile.scala 21:10:@18.4]
  assign _GEN_9 = 3'h1 == io_ra1 ? regs_1 : regs_0; // @[RegisterFile.scala 22:10:@19.4]
  assign _GEN_10 = 3'h2 == io_ra1 ? regs_2 : _GEN_9; // @[RegisterFile.scala 22:10:@19.4]
  assign _GEN_11 = 3'h3 == io_ra1 ? regs_3 : _GEN_10; // @[RegisterFile.scala 22:10:@19.4]
  assign _GEN_12 = 3'h4 == io_ra1 ? regs_4 : _GEN_11; // @[RegisterFile.scala 22:10:@19.4]
  assign _GEN_13 = 3'h5 == io_ra1 ? regs_5 : _GEN_12; // @[RegisterFile.scala 22:10:@19.4]
  assign _GEN_14 = 3'h6 == io_ra1 ? regs_6 : _GEN_13; // @[RegisterFile.scala 22:10:@19.4]
  assign _GEN_16 = 3'h0 == io_wa ? io_wd : regs_0; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_17 = 3'h1 == io_wa ? io_wd : regs_1; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_18 = 3'h2 == io_wa ? io_wd : regs_2; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_19 = 3'h3 == io_wa ? io_wd : regs_3; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_20 = 3'h4 == io_wa ? io_wd : regs_4; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_21 = 3'h5 == io_wa ? io_wd : regs_5; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_22 = 3'h6 == io_wa ? io_wd : regs_6; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_23 = 3'h7 == io_wa ? io_wd : regs_7; // @[RegisterFile.scala 25:17:@21.6]
  assign _GEN_24 = io_we ? _GEN_16 : regs_0; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_25 = io_we ? _GEN_17 : regs_1; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_26 = io_we ? _GEN_18 : regs_2; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_27 = io_we ? _GEN_19 : regs_3; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_28 = io_we ? _GEN_20 : regs_4; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_29 = io_we ? _GEN_21 : regs_5; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_30 = io_we ? _GEN_22 : regs_6; // @[RegisterFile.scala 24:16:@20.4]
  assign _GEN_31 = io_we ? _GEN_23 : regs_7; // @[RegisterFile.scala 24:16:@20.4]
  assign io_rd0 = 3'h7 == io_ra0 ? regs_7 : _GEN_6; // @[RegisterFile.scala 21:10:@18.4]
  assign io_rd1 = 3'h7 == io_ra1 ? regs_7 : _GEN_14; // @[RegisterFile.scala 22:10:@19.4]
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
  regs_0 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      regs_0 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h0 == io_wa) begin
          regs_0 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_1 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h1 == io_wa) begin
          regs_1 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_2 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h2 == io_wa) begin
          regs_2 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_3 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h3 == io_wa) begin
          regs_3 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_4 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h4 == io_wa) begin
          regs_4 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_5 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h5 == io_wa) begin
          regs_5 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_6 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h6 == io_wa) begin
          regs_6 <= io_wd;
        end
      end
    end
    if (reset) begin
      regs_7 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h7 == io_wa) begin
          regs_7 <= io_wd;
        end
      end
    end
  end
endmodule
module Pow2ClockDivider( // @[:@143.2]
  input   clock, // @[:@144.4]
  output  io_clock_out // @[:@146.4]
);
  wire  ClockDivider2_clk_in; // @[ClockDivider.scala 46:43:@151.4]
  wire  ClockDivider2_clk_out; // @[ClockDivider.scala 46:43:@151.4]
  wire  ClockDivider2_1_clk_in; // @[ClockDivider.scala 46:43:@154.4]
  wire  ClockDivider2_1_clk_out; // @[ClockDivider.scala 46:43:@154.4]
  wire  ClockDivider2_2_clk_in; // @[ClockDivider.scala 46:43:@157.4]
  wire  ClockDivider2_2_clk_out; // @[ClockDivider.scala 46:43:@157.4]
  wire  ClockDivider2_3_clk_in; // @[ClockDivider.scala 46:43:@160.4]
  wire  ClockDivider2_3_clk_out; // @[ClockDivider.scala 46:43:@160.4]
  wire  ClockDivider2_4_clk_in; // @[ClockDivider.scala 46:43:@163.4]
  wire  ClockDivider2_4_clk_out; // @[ClockDivider.scala 46:43:@163.4]
  wire  ClockDivider2_5_clk_in; // @[ClockDivider.scala 46:43:@166.4]
  wire  ClockDivider2_5_clk_out; // @[ClockDivider.scala 46:43:@166.4]
  wire  ClockDivider2_6_clk_in; // @[ClockDivider.scala 46:43:@169.4]
  wire  ClockDivider2_6_clk_out; // @[ClockDivider.scala 46:43:@169.4]
  wire  ClockDivider2_7_clk_in; // @[ClockDivider.scala 46:43:@172.4]
  wire  ClockDivider2_7_clk_out; // @[ClockDivider.scala 46:43:@172.4]
  wire  ClockDivider2_8_clk_in; // @[ClockDivider.scala 46:43:@175.4]
  wire  ClockDivider2_8_clk_out; // @[ClockDivider.scala 46:43:@175.4]
  wire  ClockDivider2_9_clk_in; // @[ClockDivider.scala 46:43:@178.4]
  wire  ClockDivider2_9_clk_out; // @[ClockDivider.scala 46:43:@178.4]
  wire  ClockDivider2_10_clk_in; // @[ClockDivider.scala 46:43:@181.4]
  wire  ClockDivider2_10_clk_out; // @[ClockDivider.scala 46:43:@181.4]
  wire  ClockDivider2_11_clk_in; // @[ClockDivider.scala 46:43:@184.4]
  wire  ClockDivider2_11_clk_out; // @[ClockDivider.scala 46:43:@184.4]
  wire  ClockDivider2_12_clk_in; // @[ClockDivider.scala 46:43:@187.4]
  wire  ClockDivider2_12_clk_out; // @[ClockDivider.scala 46:43:@187.4]
  wire  ClockDivider2_13_clk_in; // @[ClockDivider.scala 46:43:@190.4]
  wire  ClockDivider2_13_clk_out; // @[ClockDivider.scala 46:43:@190.4]
  wire  ClockDivider2_14_clk_in; // @[ClockDivider.scala 46:43:@193.4]
  wire  ClockDivider2_14_clk_out; // @[ClockDivider.scala 46:43:@193.4]
  wire  ClockDivider2_15_clk_in; // @[ClockDivider.scala 46:43:@196.4]
  wire  ClockDivider2_15_clk_out; // @[ClockDivider.scala 46:43:@196.4]
  wire  ClockDivider2_16_clk_in; // @[ClockDivider.scala 46:43:@199.4]
  wire  ClockDivider2_16_clk_out; // @[ClockDivider.scala 46:43:@199.4]
  ClockDivider2 ClockDivider2 ( // @[ClockDivider.scala 46:43:@151.4]
    .clk_in(ClockDivider2_clk_in),
    .clk_out(ClockDivider2_clk_out)
  );
  ClockDivider2 ClockDivider2_1 ( // @[ClockDivider.scala 46:43:@154.4]
    .clk_in(ClockDivider2_1_clk_in),
    .clk_out(ClockDivider2_1_clk_out)
  );
  ClockDivider2 ClockDivider2_2 ( // @[ClockDivider.scala 46:43:@157.4]
    .clk_in(ClockDivider2_2_clk_in),
    .clk_out(ClockDivider2_2_clk_out)
  );
  ClockDivider2 ClockDivider2_3 ( // @[ClockDivider.scala 46:43:@160.4]
    .clk_in(ClockDivider2_3_clk_in),
    .clk_out(ClockDivider2_3_clk_out)
  );
  ClockDivider2 ClockDivider2_4 ( // @[ClockDivider.scala 46:43:@163.4]
    .clk_in(ClockDivider2_4_clk_in),
    .clk_out(ClockDivider2_4_clk_out)
  );
  ClockDivider2 ClockDivider2_5 ( // @[ClockDivider.scala 46:43:@166.4]
    .clk_in(ClockDivider2_5_clk_in),
    .clk_out(ClockDivider2_5_clk_out)
  );
  ClockDivider2 ClockDivider2_6 ( // @[ClockDivider.scala 46:43:@169.4]
    .clk_in(ClockDivider2_6_clk_in),
    .clk_out(ClockDivider2_6_clk_out)
  );
  ClockDivider2 ClockDivider2_7 ( // @[ClockDivider.scala 46:43:@172.4]
    .clk_in(ClockDivider2_7_clk_in),
    .clk_out(ClockDivider2_7_clk_out)
  );
  ClockDivider2 ClockDivider2_8 ( // @[ClockDivider.scala 46:43:@175.4]
    .clk_in(ClockDivider2_8_clk_in),
    .clk_out(ClockDivider2_8_clk_out)
  );
  ClockDivider2 ClockDivider2_9 ( // @[ClockDivider.scala 46:43:@178.4]
    .clk_in(ClockDivider2_9_clk_in),
    .clk_out(ClockDivider2_9_clk_out)
  );
  ClockDivider2 ClockDivider2_10 ( // @[ClockDivider.scala 46:43:@181.4]
    .clk_in(ClockDivider2_10_clk_in),
    .clk_out(ClockDivider2_10_clk_out)
  );
  ClockDivider2 ClockDivider2_11 ( // @[ClockDivider.scala 46:43:@184.4]
    .clk_in(ClockDivider2_11_clk_in),
    .clk_out(ClockDivider2_11_clk_out)
  );
  ClockDivider2 ClockDivider2_12 ( // @[ClockDivider.scala 46:43:@187.4]
    .clk_in(ClockDivider2_12_clk_in),
    .clk_out(ClockDivider2_12_clk_out)
  );
  ClockDivider2 ClockDivider2_13 ( // @[ClockDivider.scala 46:43:@190.4]
    .clk_in(ClockDivider2_13_clk_in),
    .clk_out(ClockDivider2_13_clk_out)
  );
  ClockDivider2 ClockDivider2_14 ( // @[ClockDivider.scala 46:43:@193.4]
    .clk_in(ClockDivider2_14_clk_in),
    .clk_out(ClockDivider2_14_clk_out)
  );
  ClockDivider2 ClockDivider2_15 ( // @[ClockDivider.scala 46:43:@196.4]
    .clk_in(ClockDivider2_15_clk_in),
    .clk_out(ClockDivider2_15_clk_out)
  );
  ClockDivider2 ClockDivider2_16 ( // @[ClockDivider.scala 46:43:@199.4]
    .clk_in(ClockDivider2_16_clk_in),
    .clk_out(ClockDivider2_16_clk_out)
  );
  assign io_clock_out = ClockDivider2_16_clk_out; // @[ClockDivider.scala 53:18:@219.4]
  assign ClockDivider2_clk_in = clock; // @[ClockDivider.scala 52:29:@218.4]
  assign ClockDivider2_1_clk_in = ClockDivider2_clk_out; // @[ClockDivider.scala 49:22:@202.4]
  assign ClockDivider2_2_clk_in = ClockDivider2_1_clk_out; // @[ClockDivider.scala 49:22:@203.4]
  assign ClockDivider2_3_clk_in = ClockDivider2_2_clk_out; // @[ClockDivider.scala 49:22:@204.4]
  assign ClockDivider2_4_clk_in = ClockDivider2_3_clk_out; // @[ClockDivider.scala 49:22:@205.4]
  assign ClockDivider2_5_clk_in = ClockDivider2_4_clk_out; // @[ClockDivider.scala 49:22:@206.4]
  assign ClockDivider2_6_clk_in = ClockDivider2_5_clk_out; // @[ClockDivider.scala 49:22:@207.4]
  assign ClockDivider2_7_clk_in = ClockDivider2_6_clk_out; // @[ClockDivider.scala 49:22:@208.4]
  assign ClockDivider2_8_clk_in = ClockDivider2_7_clk_out; // @[ClockDivider.scala 49:22:@209.4]
  assign ClockDivider2_9_clk_in = ClockDivider2_8_clk_out; // @[ClockDivider.scala 49:22:@210.4]
  assign ClockDivider2_10_clk_in = ClockDivider2_9_clk_out; // @[ClockDivider.scala 49:22:@211.4]
  assign ClockDivider2_11_clk_in = ClockDivider2_10_clk_out; // @[ClockDivider.scala 49:22:@212.4]
  assign ClockDivider2_12_clk_in = ClockDivider2_11_clk_out; // @[ClockDivider.scala 49:22:@213.4]
  assign ClockDivider2_13_clk_in = ClockDivider2_12_clk_out; // @[ClockDivider.scala 49:22:@214.4]
  assign ClockDivider2_14_clk_in = ClockDivider2_13_clk_out; // @[ClockDivider.scala 49:22:@215.4]
  assign ClockDivider2_15_clk_in = ClockDivider2_14_clk_out; // @[ClockDivider.scala 49:22:@216.4]
  assign ClockDivider2_16_clk_in = ClockDivider2_15_clk_out; // @[ClockDivider.scala 49:22:@217.4]
endmodule
module SegmentDisplay( // @[:@221.2]
  input  [3:0] io_number, // @[:@224.4]
  output [6:0] io_segment // @[:@224.4]
);
  wire  _T_11; // @[Conditional.scala 37:30:@227.4]
  wire  _T_14; // @[Conditional.scala 37:30:@232.6]
  wire  _T_17; // @[Conditional.scala 37:30:@237.8]
  wire  _T_20; // @[Conditional.scala 37:30:@242.10]
  wire  _T_23; // @[Conditional.scala 37:30:@247.12]
  wire  _T_26; // @[Conditional.scala 37:30:@252.14]
  wire  _T_29; // @[Conditional.scala 37:30:@257.16]
  wire  _T_32; // @[Conditional.scala 37:30:@262.18]
  wire  _T_35; // @[Conditional.scala 37:30:@267.20]
  wire  _T_38; // @[Conditional.scala 37:30:@272.22]
  wire  _T_41; // @[Conditional.scala 37:30:@277.24]
  wire  _T_44; // @[Conditional.scala 37:30:@282.26]
  wire  _T_47; // @[Conditional.scala 37:30:@287.28]
  wire  _T_50; // @[Conditional.scala 37:30:@292.30]
  wire  _T_53; // @[Conditional.scala 37:30:@297.32]
  wire  _T_56; // @[Conditional.scala 37:30:@302.34]
  wire [6:0] _GEN_0; // @[Conditional.scala 39:67:@303.34]
  wire [6:0] _GEN_1; // @[Conditional.scala 39:67:@298.32]
  wire [6:0] _GEN_2; // @[Conditional.scala 39:67:@293.30]
  wire [6:0] _GEN_3; // @[Conditional.scala 39:67:@288.28]
  wire [6:0] _GEN_4; // @[Conditional.scala 39:67:@283.26]
  wire [6:0] _GEN_5; // @[Conditional.scala 39:67:@278.24]
  wire [6:0] _GEN_6; // @[Conditional.scala 39:67:@273.22]
  wire [6:0] _GEN_7; // @[Conditional.scala 39:67:@268.20]
  wire [6:0] _GEN_8; // @[Conditional.scala 39:67:@263.18]
  wire [6:0] _GEN_9; // @[Conditional.scala 39:67:@258.16]
  wire [6:0] _GEN_10; // @[Conditional.scala 39:67:@253.14]
  wire [6:0] _GEN_11; // @[Conditional.scala 39:67:@248.12]
  wire [6:0] _GEN_12; // @[Conditional.scala 39:67:@243.10]
  wire [6:0] _GEN_13; // @[Conditional.scala 39:67:@238.8]
  wire [6:0] _GEN_14; // @[Conditional.scala 39:67:@233.6]
  assign _T_11 = 4'h0 == io_number; // @[Conditional.scala 37:30:@227.4]
  assign _T_14 = 4'h1 == io_number; // @[Conditional.scala 37:30:@232.6]
  assign _T_17 = 4'h2 == io_number; // @[Conditional.scala 37:30:@237.8]
  assign _T_20 = 4'h3 == io_number; // @[Conditional.scala 37:30:@242.10]
  assign _T_23 = 4'h4 == io_number; // @[Conditional.scala 37:30:@247.12]
  assign _T_26 = 4'h5 == io_number; // @[Conditional.scala 37:30:@252.14]
  assign _T_29 = 4'h6 == io_number; // @[Conditional.scala 37:30:@257.16]
  assign _T_32 = 4'h7 == io_number; // @[Conditional.scala 37:30:@262.18]
  assign _T_35 = 4'h8 == io_number; // @[Conditional.scala 37:30:@267.20]
  assign _T_38 = 4'h9 == io_number; // @[Conditional.scala 37:30:@272.22]
  assign _T_41 = 4'ha == io_number; // @[Conditional.scala 37:30:@277.24]
  assign _T_44 = 4'hb == io_number; // @[Conditional.scala 37:30:@282.26]
  assign _T_47 = 4'hc == io_number; // @[Conditional.scala 37:30:@287.28]
  assign _T_50 = 4'hd == io_number; // @[Conditional.scala 37:30:@292.30]
  assign _T_53 = 4'he == io_number; // @[Conditional.scala 37:30:@297.32]
  assign _T_56 = 4'hf == io_number; // @[Conditional.scala 37:30:@302.34]
  assign _GEN_0 = _T_56 ? 7'h38 : 7'h7f; // @[Conditional.scala 39:67:@303.34]
  assign _GEN_1 = _T_53 ? 7'h30 : _GEN_0; // @[Conditional.scala 39:67:@298.32]
  assign _GEN_2 = _T_50 ? 7'h42 : _GEN_1; // @[Conditional.scala 39:67:@293.30]
  assign _GEN_3 = _T_47 ? 7'h31 : _GEN_2; // @[Conditional.scala 39:67:@288.28]
  assign _GEN_4 = _T_44 ? 7'h60 : _GEN_3; // @[Conditional.scala 39:67:@283.26]
  assign _GEN_5 = _T_41 ? 7'h8 : _GEN_4; // @[Conditional.scala 39:67:@278.24]
  assign _GEN_6 = _T_38 ? 7'h4 : _GEN_5; // @[Conditional.scala 39:67:@273.22]
  assign _GEN_7 = _T_35 ? 7'h0 : _GEN_6; // @[Conditional.scala 39:67:@268.20]
  assign _GEN_8 = _T_32 ? 7'hf : _GEN_7; // @[Conditional.scala 39:67:@263.18]
  assign _GEN_9 = _T_29 ? 7'h20 : _GEN_8; // @[Conditional.scala 39:67:@258.16]
  assign _GEN_10 = _T_26 ? 7'h24 : _GEN_9; // @[Conditional.scala 39:67:@253.14]
  assign _GEN_11 = _T_23 ? 7'h4c : _GEN_10; // @[Conditional.scala 39:67:@248.12]
  assign _GEN_12 = _T_20 ? 7'h6 : _GEN_11; // @[Conditional.scala 39:67:@243.10]
  assign _GEN_13 = _T_17 ? 7'h12 : _GEN_12; // @[Conditional.scala 39:67:@238.8]
  assign _GEN_14 = _T_14 ? 7'h4f : _GEN_13; // @[Conditional.scala 39:67:@233.6]
  assign io_segment = _T_11 ? 7'h1 : _GEN_14; // @[FIFODisplay.scala 72:14:@226.4 FIFODisplay.scala 74:27:@229.6 FIFODisplay.scala 75:27:@234.8 FIFODisplay.scala 76:27:@239.10 FIFODisplay.scala 77:27:@244.12 FIFODisplay.scala 78:27:@249.14 FIFODisplay.scala 79:27:@254.16 FIFODisplay.scala 80:27:@259.18 FIFODisplay.scala 81:27:@264.20 FIFODisplay.scala 82:27:@269.22 FIFODisplay.scala 83:27:@274.24 FIFODisplay.scala 84:28:@279.26 FIFODisplay.scala 85:28:@284.28 FIFODisplay.scala 86:28:@289.30 FIFODisplay.scala 87:28:@294.32 FIFODisplay.scala 88:28:@299.34 FIFODisplay.scala 89:28:@304.36]
endmodule
module FIFODisplay( // @[:@307.2]
  input         clock, // @[:@308.4]
  input         reset, // @[:@309.4]
  output [2:0]  io_ra0, // @[:@310.4]
  input  [3:0]  io_rd0, // @[:@310.4]
  input  [2:0]  io_queue_head, // @[:@310.4]
  input  [2:0]  io_queue_tail, // @[:@310.4]
  input         io_queue_empty, // @[:@310.4]
  output [15:0] io_display // @[:@310.4]
);
  wire  divide_clock; // @[FIFODisplay.scala 18:22:@312.4]
  wire  divide_io_clock_out; // @[FIFODisplay.scala 18:22:@312.4]
  wire [3:0] SegmentDisplay_io_number; // @[FIFODisplay.scala 22:20:@316.4]
  wire [6:0] SegmentDisplay_io_segment; // @[FIFODisplay.scala 22:20:@316.4]
  reg [2:0] _T_19; // @[FIFODisplay.scala 21:20:@315.4]
  reg [31:0] _RAND_0;
  wire  _T_26; // @[FIFODisplay.scala 32:25:@324.4]
  wire  _T_27; // @[FIFODisplay.scala 33:15:@326.6]
  wire  _T_28; // @[FIFODisplay.scala 33:36:@327.6]
  wire  _T_29; // @[FIFODisplay.scala 33:32:@328.6]
  wire [3:0] _GEN_0; // @[FIFODisplay.scala 33:53:@329.6]
  wire  _T_31; // @[FIFODisplay.scala 38:31:@337.6]
  wire  _T_32; // @[FIFODisplay.scala 39:13:@339.8]
  wire [3:0] _GEN_2; // @[FIFODisplay.scala 39:30:@340.8]
  wire  _T_36; // @[FIFODisplay.scala 45:32:@350.8]
  wire [3:0] _GEN_4; // @[FIFODisplay.scala 45:53:@351.8]
  wire [3:0] _GEN_6; // @[FIFODisplay.scala 38:50:@338.6]
  wire  _GEN_7; // @[FIFODisplay.scala 38:50:@338.6]
  wire  _GEN_9; // @[FIFODisplay.scala 32:42:@325.4]
  wire [6:0] _GEN_10; // @[FIFODisplay.scala 52:24:@358.4]
  wire [3:0] _T_40; // @[FIFODisplay.scala 59:12:@364.4]
  wire [2:0] _T_41; // @[FIFODisplay.scala 59:12:@365.4]
  wire [7:0] _T_44; // @[OneHot.scala 52:12:@368.4]
  wire [7:0] _T_46; // @[FIFODisplay.scala 61:23:@370.4]
  wire  _T_47; // @[FIFODisplay.scala 61:50:@371.4]
  wire [8:0] _T_48; // @[Cat.scala 30:58:@372.4]
  Pow2ClockDivider divide ( // @[FIFODisplay.scala 18:22:@312.4]
    .clock(divide_clock),
    .io_clock_out(divide_io_clock_out)
  );
  SegmentDisplay SegmentDisplay ( // @[FIFODisplay.scala 22:20:@316.4]
    .io_number(SegmentDisplay_io_number),
    .io_segment(SegmentDisplay_io_segment)
  );
  assign _T_26 = io_queue_tail < io_queue_head; // @[FIFODisplay.scala 32:25:@324.4]
  assign _T_27 = _T_19 >= io_queue_tail; // @[FIFODisplay.scala 33:15:@326.6]
  assign _T_28 = _T_19 < io_queue_head; // @[FIFODisplay.scala 33:36:@327.6]
  assign _T_29 = _T_27 & _T_28; // @[FIFODisplay.scala 33:32:@328.6]
  assign _GEN_0 = _T_29 ? io_rd0 : 4'ha; // @[FIFODisplay.scala 33:53:@329.6]
  assign _T_31 = io_queue_tail == io_queue_head; // @[FIFODisplay.scala 38:31:@337.6]
  assign _T_32 = ~ io_queue_empty; // @[FIFODisplay.scala 39:13:@339.8]
  assign _GEN_2 = _T_32 ? io_rd0 : 4'ha; // @[FIFODisplay.scala 39:30:@340.8]
  assign _T_36 = _T_27 | _T_28; // @[FIFODisplay.scala 45:32:@350.8]
  assign _GEN_4 = _T_36 ? io_rd0 : 4'ha; // @[FIFODisplay.scala 45:53:@351.8]
  assign _GEN_6 = _T_31 ? _GEN_2 : _GEN_4; // @[FIFODisplay.scala 38:50:@338.6]
  assign _GEN_7 = _T_31 ? _T_32 : _T_36; // @[FIFODisplay.scala 38:50:@338.6]
  assign _GEN_9 = _T_26 ? _T_29 : _GEN_7; // @[FIFODisplay.scala 32:42:@325.4]
  assign _GEN_10 = _GEN_9 ? SegmentDisplay_io_segment : 7'h7f; // @[FIFODisplay.scala 52:24:@358.4]
  assign _T_40 = _T_19 + 3'h1; // @[FIFODisplay.scala 59:12:@364.4]
  assign _T_41 = _T_19 + 3'h1; // @[FIFODisplay.scala 59:12:@365.4]
  assign _T_44 = 8'h1 << _T_19; // @[OneHot.scala 52:12:@368.4]
  assign _T_46 = ~ _T_44; // @[FIFODisplay.scala 61:23:@370.4]
  assign _T_47 = _T_19 != io_queue_tail; // @[FIFODisplay.scala 61:50:@371.4]
  assign _T_48 = {_T_46,_T_47}; // @[Cat.scala 30:58:@372.4]
  assign io_ra0 = _T_19; // @[FIFODisplay.scala 27:12:@322.4]
  assign io_display = {_T_48,_GEN_10}; // @[FIFODisplay.scala 61:16:@374.4]
  assign divide_clock = clock; // @[:@313.4]
  assign SegmentDisplay_io_number = _T_26 ? _GEN_0 : _GEN_6; // @[FIFODisplay.scala 28:18:@323.4 FIFODisplay.scala 34:22:@330.8 FIFODisplay.scala 40:22:@341.10 FIFODisplay.scala 46:22:@352.10]
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
  _T_19 = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge divide_io_clock_out) begin
    if (reset) begin
      _T_19 <= 3'h0;
    end else begin
      _T_19 <= _T_41;
    end
  end
endmodule
module FIFOQueue( // @[:@376.2]
  input         clock, // @[:@377.4]
  input         reset, // @[:@378.4]
  input  [3:0]  io_in, // @[:@379.4]
  input         io_en_in, // @[:@379.4]
  input         io_en_out, // @[:@379.4]
  output [3:0]  io_out, // @[:@379.4]
  output [15:0] io_display, // @[:@379.4]
  output        io_empty, // @[:@379.4]
  output        io_full // @[:@379.4]
);
  wire  regfile_clock; // @[FIFOQueue.scala 18:23:@381.4]
  wire  regfile_reset; // @[FIFOQueue.scala 18:23:@381.4]
  wire [2:0] regfile_io_ra0; // @[FIFOQueue.scala 18:23:@381.4]
  wire [3:0] regfile_io_rd0; // @[FIFOQueue.scala 18:23:@381.4]
  wire [2:0] regfile_io_ra1; // @[FIFOQueue.scala 18:23:@381.4]
  wire [3:0] regfile_io_rd1; // @[FIFOQueue.scala 18:23:@381.4]
  wire [2:0] regfile_io_wa; // @[FIFOQueue.scala 18:23:@381.4]
  wire [3:0] regfile_io_wd; // @[FIFOQueue.scala 18:23:@381.4]
  wire  regfile_io_we; // @[FIFOQueue.scala 18:23:@381.4]
  wire  FIFODisplay_clock; // @[FIFOQueue.scala 32:25:@392.4]
  wire  FIFODisplay_reset; // @[FIFOQueue.scala 32:25:@392.4]
  wire [2:0] FIFODisplay_io_ra0; // @[FIFOQueue.scala 32:25:@392.4]
  wire [3:0] FIFODisplay_io_rd0; // @[FIFOQueue.scala 32:25:@392.4]
  wire [2:0] FIFODisplay_io_queue_head; // @[FIFOQueue.scala 32:25:@392.4]
  wire [2:0] FIFODisplay_io_queue_tail; // @[FIFOQueue.scala 32:25:@392.4]
  wire  FIFODisplay_io_queue_empty; // @[FIFOQueue.scala 32:25:@392.4]
  wire [15:0] FIFODisplay_io_display; // @[FIFOQueue.scala 32:25:@392.4]
  reg [2:0] head; // @[FIFOQueue.scala 21:21:@384.4]
  reg [31:0] _RAND_0;
  reg [2:0] tail; // @[FIFOQueue.scala 22:21:@385.4]
  reg [31:0] _RAND_1;
  reg  empty; // @[FIFOQueue.scala 23:22:@386.4]
  reg [31:0] _RAND_2;
  reg  full; // @[FIFOQueue.scala 24:21:@387.4]
  reg [31:0] _RAND_3;
  reg  in_before; // @[FIFOQueue.scala 26:26:@388.4]
  reg [31:0] _RAND_4;
  reg  out_before; // @[FIFOQueue.scala 27:27:@389.4]
  reg [31:0] _RAND_5;
  reg [3:0] out_reg; // @[FIFOQueue.scala 28:24:@390.4]
  reg [31:0] _RAND_6;
  wire  _T_34; // @[FIFOQueue.scala 52:20:@408.4]
  wire  _T_35; // @[FIFOQueue.scala 52:18:@409.4]
  wire  _T_36; // @[FIFOQueue.scala 52:28:@410.4]
  wire  _T_37; // @[FIFOQueue.scala 52:26:@411.4]
  wire [3:0] _T_40; // @[FIFOQueue.scala 56:18:@416.6]
  wire [2:0] _T_41; // @[FIFOQueue.scala 56:18:@417.6]
  wire  _T_47; // @[FIFOQueue.scala 60:22:@423.6]
  wire  _GEN_0; // @[FIFOQueue.scala 60:32:@424.6]
  wire [2:0] _GEN_4; // @[FIFOQueue.scala 52:40:@412.4]
  wire  _GEN_5; // @[FIFOQueue.scala 52:40:@412.4]
  wire  _GEN_6; // @[FIFOQueue.scala 52:40:@412.4]
  wire  _GEN_7; // @[FIFOQueue.scala 52:40:@412.4]
  wire  _T_49; // @[FIFOQueue.scala 66:9:@428.4]
  wire  _GEN_8; // @[FIFOQueue.scala 66:20:@429.4]
  wire  _T_51; // @[FIFOQueue.scala 70:21:@432.4]
  wire  _T_52; // @[FIFOQueue.scala 70:19:@433.4]
  wire  _T_53; // @[FIFOQueue.scala 70:30:@434.4]
  wire  _T_54; // @[FIFOQueue.scala 70:28:@435.4]
  wire [3:0] _T_56; // @[FIFOQueue.scala 73:18:@439.6]
  wire [2:0] _T_57; // @[FIFOQueue.scala 73:18:@440.6]
  wire  _T_63; // @[FIFOQueue.scala 77:16:@446.6]
  wire  _GEN_9; // @[FIFOQueue.scala 77:32:@447.6]
  wire [3:0] _GEN_11; // @[FIFOQueue.scala 70:43:@436.4]
  wire [2:0] _GEN_12; // @[FIFOQueue.scala 70:43:@436.4]
  wire  _GEN_13; // @[FIFOQueue.scala 70:43:@436.4]
  wire  _GEN_14; // @[FIFOQueue.scala 70:43:@436.4]
  wire  _GEN_15; // @[FIFOQueue.scala 70:43:@436.4]
  wire  _T_65; // @[FIFOQueue.scala 82:9:@451.4]
  wire  _GEN_16; // @[FIFOQueue.scala 82:21:@452.4]
  RegisterFile regfile ( // @[FIFOQueue.scala 18:23:@381.4]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_ra0(regfile_io_ra0),
    .io_rd0(regfile_io_rd0),
    .io_ra1(regfile_io_ra1),
    .io_rd1(regfile_io_rd1),
    .io_wa(regfile_io_wa),
    .io_wd(regfile_io_wd),
    .io_we(regfile_io_we)
  );
  FIFODisplay FIFODisplay ( // @[FIFOQueue.scala 32:25:@392.4]
    .clock(FIFODisplay_clock),
    .reset(FIFODisplay_reset),
    .io_ra0(FIFODisplay_io_ra0),
    .io_rd0(FIFODisplay_io_rd0),
    .io_queue_head(FIFODisplay_io_queue_head),
    .io_queue_tail(FIFODisplay_io_queue_tail),
    .io_queue_empty(FIFODisplay_io_queue_empty),
    .io_display(FIFODisplay_io_display)
  );
  assign _T_34 = ~ full; // @[FIFOQueue.scala 52:20:@408.4]
  assign _T_35 = io_en_in & _T_34; // @[FIFOQueue.scala 52:18:@409.4]
  assign _T_36 = ~ in_before; // @[FIFOQueue.scala 52:28:@410.4]
  assign _T_37 = _T_35 & _T_36; // @[FIFOQueue.scala 52:26:@411.4]
  assign _T_40 = head + 3'h1; // @[FIFOQueue.scala 56:18:@416.6]
  assign _T_41 = head + 3'h1; // @[FIFOQueue.scala 56:18:@417.6]
  assign _T_47 = _T_41 == tail; // @[FIFOQueue.scala 60:22:@423.6]
  assign _GEN_0 = _T_47 ? 1'h1 : full; // @[FIFOQueue.scala 60:32:@424.6]
  assign _GEN_4 = _T_37 ? _T_41 : head; // @[FIFOQueue.scala 52:40:@412.4]
  assign _GEN_5 = _T_37 ? 1'h1 : in_before; // @[FIFOQueue.scala 52:40:@412.4]
  assign _GEN_6 = _T_37 ? 1'h0 : empty; // @[FIFOQueue.scala 52:40:@412.4]
  assign _GEN_7 = _T_37 ? _GEN_0 : full; // @[FIFOQueue.scala 52:40:@412.4]
  assign _T_49 = ~ io_en_in; // @[FIFOQueue.scala 66:9:@428.4]
  assign _GEN_8 = _T_49 ? 1'h0 : _GEN_5; // @[FIFOQueue.scala 66:20:@429.4]
  assign _T_51 = ~ empty; // @[FIFOQueue.scala 70:21:@432.4]
  assign _T_52 = io_en_out & _T_51; // @[FIFOQueue.scala 70:19:@433.4]
  assign _T_53 = ~ out_before; // @[FIFOQueue.scala 70:30:@434.4]
  assign _T_54 = _T_52 & _T_53; // @[FIFOQueue.scala 70:28:@435.4]
  assign _T_56 = tail + 3'h1; // @[FIFOQueue.scala 73:18:@439.6]
  assign _T_57 = tail + 3'h1; // @[FIFOQueue.scala 73:18:@440.6]
  assign _T_63 = head == _T_57; // @[FIFOQueue.scala 77:16:@446.6]
  assign _GEN_9 = _T_63 ? 1'h1 : _GEN_6; // @[FIFOQueue.scala 77:32:@447.6]
  assign _GEN_11 = _T_54 ? regfile_io_rd1 : out_reg; // @[FIFOQueue.scala 70:43:@436.4]
  assign _GEN_12 = _T_54 ? _T_57 : tail; // @[FIFOQueue.scala 70:43:@436.4]
  assign _GEN_13 = _T_54 ? 1'h1 : out_before; // @[FIFOQueue.scala 70:43:@436.4]
  assign _GEN_14 = _T_54 ? 1'h0 : _GEN_7; // @[FIFOQueue.scala 70:43:@436.4]
  assign _GEN_15 = _T_54 ? _GEN_9 : _GEN_6; // @[FIFOQueue.scala 70:43:@436.4]
  assign _T_65 = ~ io_en_out; // @[FIFOQueue.scala 82:9:@451.4]
  assign _GEN_16 = _T_65 ? 1'h0 : _GEN_13; // @[FIFOQueue.scala 82:21:@452.4]
  assign io_out = out_reg; // @[FIFOQueue.scala 48:10:@407.4]
  assign io_display = FIFODisplay_io_display; // @[FIFOQueue.scala 38:20:@400.4]
  assign io_empty = empty; // @[FIFOQueue.scala 41:12:@401.4]
  assign io_full = full; // @[FIFOQueue.scala 42:11:@402.4]
  assign regfile_clock = clock; // @[:@382.4]
  assign regfile_reset = reset; // @[:@383.4]
  assign regfile_io_ra0 = FIFODisplay_io_ra0; // @[FIFOQueue.scala 33:20:@395.4]
  assign regfile_io_ra1 = tail; // @[FIFOQueue.scala 71:20:@437.6]
  assign regfile_io_wa = head; // @[FIFOQueue.scala 54:19:@414.6]
  assign regfile_io_wd = io_in; // @[FIFOQueue.scala 55:19:@415.6]
  assign regfile_io_we = _T_35 & _T_36; // @[FIFOQueue.scala 44:17:@403.4 FIFOQueue.scala 53:19:@413.6]
  assign FIFODisplay_clock = clock; // @[:@393.4]
  assign FIFODisplay_reset = reset; // @[:@394.4]
  assign FIFODisplay_io_rd0 = regfile_io_rd0; // @[FIFOQueue.scala 34:20:@396.4]
  assign FIFODisplay_io_queue_head = head; // @[FIFOQueue.scala 35:27:@397.4]
  assign FIFODisplay_io_queue_tail = tail; // @[FIFOQueue.scala 36:27:@398.4]
  assign FIFODisplay_io_queue_empty = empty; // @[FIFOQueue.scala 37:28:@399.4]
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
  head = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tail = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  empty = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  full = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  in_before = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_before = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_reg = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      head <= 3'h0;
    end else begin
      if (_T_37) begin
        head <= _T_41;
      end
    end
    if (reset) begin
      tail <= 3'h0;
    end else begin
      if (_T_54) begin
        tail <= _T_57;
      end
    end
    if (reset) begin
      empty <= 1'h1;
    end else begin
      if (_T_54) begin
        if (_T_63) begin
          empty <= 1'h1;
        end else begin
          if (_T_37) begin
            empty <= 1'h0;
          end
        end
      end else begin
        if (_T_37) begin
          empty <= 1'h0;
        end
      end
    end
    if (reset) begin
      full <= 1'h0;
    end else begin
      if (_T_54) begin
        full <= 1'h0;
      end else begin
        if (_T_37) begin
          if (_T_47) begin
            full <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      in_before <= 1'h0;
    end else begin
      if (_T_49) begin
        in_before <= 1'h0;
      end else begin
        if (_T_37) begin
          in_before <= 1'h1;
        end
      end
    end
    if (reset) begin
      out_before <= 1'h0;
    end else begin
      if (_T_65) begin
        out_before <= 1'h0;
      end else begin
        if (_T_54) begin
          out_before <= 1'h1;
        end
      end
    end
    if (reset) begin
      out_reg <= 4'h0;
    end else begin
      if (_T_54) begin
        out_reg <= regfile_io_rd1;
      end
    end
  end
endmodule
