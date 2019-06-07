module ALU( // @[:@3.2]
  input  [3:0] io_a, // @[:@6.4]
  input  [3:0] io_b, // @[:@6.4]
  output [3:0] io_y, // @[:@6.4]
  output [2:0] io_f // @[:@6.4]
);
  wire [3:0] _T_24; // @[ALU.scala 27:25:@19.6]
  wire [3:0] _T_25; // @[ALU.scala 27:40:@20.6]
  wire [4:0] _T_28; // @[ALU.scala 30:26:@28.8]
  wire [4:0] arith_result; // @[ALU.scala 30:26:@29.8]
  wire [4:0] sext_result; // @[ALU.scala 31:32:@33.8]
  wire  flag_zero; // @[ALU.scala 47:21:@64.4]
  wire [1:0] _T_44; // @[ALU.scala 50:32:@66.4]
  wire  _T_46; // @[ALU.scala 50:43:@67.4]
  wire  _T_49; // @[ALU.scala 50:81:@69.4]
  wire  flag_overflow; // @[ALU.scala 50:56:@70.4]
  wire  flag_carry; // @[ALU.scala 51:29:@72.4]
  wire [1:0] _T_52; // @[Cat.scala 30:58:@74.4]
  assign _T_24 = $signed(io_a); // @[ALU.scala 27:25:@19.6]
  assign _T_25 = $signed(io_b); // @[ALU.scala 27:40:@20.6]
  assign _T_28 = io_a - io_b; // @[ALU.scala 30:26:@28.8]
  assign arith_result = $unsigned(_T_28); // @[ALU.scala 30:26:@29.8]
  assign sext_result = $signed(_T_24) - $signed(_T_25); // @[ALU.scala 31:32:@33.8]
  assign flag_zero = io_y == 4'h0; // @[ALU.scala 47:21:@64.4]
  assign _T_44 = sext_result[4:3]; // @[ALU.scala 50:32:@66.4]
  assign _T_46 = _T_44 == 2'h1; // @[ALU.scala 50:43:@67.4]
  assign _T_49 = _T_44 == 2'h2; // @[ALU.scala 50:81:@69.4]
  assign flag_overflow = _T_46 | _T_49; // @[ALU.scala 50:56:@70.4]
  assign flag_carry = arith_result[4]; // @[ALU.scala 51:29:@72.4]
  assign _T_52 = {flag_carry,flag_overflow}; // @[Cat.scala 30:58:@74.4]
  assign io_y = arith_result[3:0]; // @[ALU.scala 28:10:@23.6 ALU.scala 32:10:@35.8 ALU.scala 34:10:@41.10 ALU.scala 36:10:@47.12 ALU.scala 38:10:@53.14 ALU.scala 40:10:@59.16 ALU.scala 42:10:@62.16]
  assign io_f = {_T_52,flag_zero}; // @[ALU.scala 53:8:@76.4]
endmodule
module Compare( // @[:@78.2]
  input  [3:0] io_x, // @[:@81.4]
  input  [3:0] io_y, // @[:@81.4]
  output       io_ul, // @[:@81.4]
  output       io_eq // @[:@81.4]
);
  wire [3:0] alu_io_a; // @[Compare.scala 20:19:@83.4]
  wire [3:0] alu_io_b; // @[Compare.scala 20:19:@83.4]
  wire [3:0] alu_io_y; // @[Compare.scala 20:19:@83.4]
  wire [2:0] alu_io_f; // @[Compare.scala 20:19:@83.4]
  wire  _T_21; // @[Compare.scala 25:12:@91.4]
  wire  _T_22; // @[Compare.scala 25:30:@92.4]
  ALU alu ( // @[Compare.scala 20:19:@83.4]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_y(alu_io_y),
    .io_f(alu_io_f)
  );
  assign _T_21 = ~ io_eq; // @[Compare.scala 25:12:@91.4]
  assign _T_22 = alu_io_f[2]; // @[Compare.scala 25:30:@92.4]
  assign io_ul = _T_21 & _T_22; // @[Compare.scala 26:9:@99.4]
  assign io_eq = alu_io_f[0]; // @[Compare.scala 24:9:@90.4]
  assign alu_io_a = io_x; // @[Compare.scala 21:12:@86.4]
  assign alu_io_b = io_y; // @[Compare.scala 22:12:@87.4]
endmodule
module CompareSwap( // @[:@114.2]
  input  [3:0] io_x, // @[:@117.4]
  input  [3:0] io_y, // @[:@117.4]
  output [3:0] io_new_x, // @[:@117.4]
  output [3:0] io_new_y // @[:@117.4]
);
  wire [3:0] cmp_io_x; // @[Sort.scala 15:19:@119.4]
  wire [3:0] cmp_io_y; // @[Sort.scala 15:19:@119.4]
  wire  cmp_io_ul; // @[Sort.scala 15:19:@119.4]
  wire  cmp_io_eq; // @[Sort.scala 15:19:@119.4]
  Compare cmp ( // @[Sort.scala 15:19:@119.4]
    .io_x(cmp_io_x),
    .io_y(cmp_io_y),
    .io_ul(cmp_io_ul),
    .io_eq(cmp_io_eq)
  );
  assign io_new_x = cmp_io_ul ? io_y : io_x; // @[Sort.scala 18:12:@124.4 Sort.scala 22:14:@127.6]
  assign io_new_y = cmp_io_ul ? io_x : io_y; // @[Sort.scala 19:12:@125.4 Sort.scala 23:14:@128.6]
  assign cmp_io_x = io_x; // @[Sort.scala 16:12:@122.4]
  assign cmp_io_y = io_y; // @[Sort.scala 17:12:@123.4]
endmodule
module Sort( // @[:@259.2]
  input        clock, // @[:@260.4]
  input        reset, // @[:@261.4]
  input  [3:0] io_x0, // @[:@262.4]
  input  [3:0] io_x1, // @[:@262.4]
  input  [3:0] io_x2, // @[:@262.4]
  input  [3:0] io_x3, // @[:@262.4]
  output [3:0] io_s0, // @[:@262.4]
  output [3:0] io_s1, // @[:@262.4]
  output [3:0] io_s2, // @[:@262.4]
  output [3:0] io_s3, // @[:@262.4]
  output       io_done // @[:@262.4]
);
  wire [3:0] cmp1_io_x; // @[Sort.scala 41:20:@264.4]
  wire [3:0] cmp1_io_y; // @[Sort.scala 41:20:@264.4]
  wire [3:0] cmp1_io_new_x; // @[Sort.scala 41:20:@264.4]
  wire [3:0] cmp1_io_new_y; // @[Sort.scala 41:20:@264.4]
  wire [3:0] cmp2_io_x; // @[Sort.scala 42:20:@267.4]
  wire [3:0] cmp2_io_y; // @[Sort.scala 42:20:@267.4]
  wire [3:0] cmp2_io_new_x; // @[Sort.scala 42:20:@267.4]
  wire [3:0] cmp2_io_new_y; // @[Sort.scala 42:20:@267.4]
  reg [3:0] new_x_0; // @[Sort.scala 44:22:@275.4]
  reg [31:0] _RAND_0;
  reg [3:0] new_x_1; // @[Sort.scala 44:22:@275.4]
  reg [31:0] _RAND_1;
  reg [3:0] new_x_2; // @[Sort.scala 44:22:@275.4]
  reg [31:0] _RAND_2;
  reg [3:0] new_x_3; // @[Sort.scala 44:22:@275.4]
  reg [31:0] _RAND_3;
  reg [1:0] state; // @[Sort.scala 45:22:@276.4]
  reg [31:0] _RAND_4;
  wire  _T_63; // @[Conditional.scala 37:30:@287.4]
  wire  _T_74; // @[Conditional.scala 37:30:@305.6]
  wire  _T_85; // @[Conditional.scala 37:30:@323.8]
  wire [3:0] _GEN_0; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _GEN_1; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _GEN_2; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _GEN_3; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _T_89_0; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@330.10]
  wire [3:0] _GEN_4; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _T_89_1; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@331.10]
  wire [3:0] _GEN_5; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _T_89_2; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@332.10]
  wire [3:0] _GEN_6; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _T_89_3; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@333.10]
  wire [3:0] _GEN_7; // @[Conditional.scala 39:67:@324.8]
  wire [1:0] _GEN_8; // @[Conditional.scala 39:67:@324.8]
  wire [3:0] _GEN_9; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_10; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_11; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_12; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_13; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_14; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_15; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_16; // @[Conditional.scala 39:67:@306.6]
  wire [1:0] _GEN_17; // @[Conditional.scala 39:67:@306.6]
  wire [3:0] _GEN_22; // @[Conditional.scala 40:58:@288.4]
  wire [3:0] _GEN_23; // @[Conditional.scala 40:58:@288.4]
  wire [3:0] _GEN_24; // @[Conditional.scala 40:58:@288.4]
  wire [3:0] _GEN_25; // @[Conditional.scala 40:58:@288.4]
  wire [1:0] _GEN_26; // @[Conditional.scala 40:58:@288.4]
  CompareSwap cmp1 ( // @[Sort.scala 41:20:@264.4]
    .io_x(cmp1_io_x),
    .io_y(cmp1_io_y),
    .io_new_x(cmp1_io_new_x),
    .io_new_y(cmp1_io_new_y)
  );
  CompareSwap cmp2 ( // @[Sort.scala 42:20:@267.4]
    .io_x(cmp2_io_x),
    .io_y(cmp2_io_y),
    .io_new_x(cmp2_io_new_x),
    .io_new_y(cmp2_io_new_y)
  );
  assign _T_63 = 2'h0 == state; // @[Conditional.scala 37:30:@287.4]
  assign _T_74 = 2'h1 == state; // @[Conditional.scala 37:30:@305.6]
  assign _T_85 = 2'h2 == state; // @[Conditional.scala 37:30:@323.8]
  assign _GEN_0 = _T_85 ? new_x_0 : io_s0; // @[Conditional.scala 39:67:@324.8]
  assign _GEN_1 = _T_85 ? new_x_1 : io_s1; // @[Conditional.scala 39:67:@324.8]
  assign _GEN_2 = _T_85 ? new_x_2 : io_s2; // @[Conditional.scala 39:67:@324.8]
  assign _GEN_3 = _T_85 ? new_x_3 : io_s3; // @[Conditional.scala 39:67:@324.8]
  assign _T_89_0 = cmp1_io_new_x; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@330.10]
  assign _GEN_4 = _T_85 ? _T_89_0 : new_x_0; // @[Conditional.scala 39:67:@324.8]
  assign _T_89_1 = cmp1_io_new_y; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@331.10]
  assign _GEN_5 = _T_85 ? _T_89_1 : new_x_1; // @[Conditional.scala 39:67:@324.8]
  assign _T_89_2 = cmp2_io_new_x; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@332.10]
  assign _GEN_6 = _T_85 ? _T_89_2 : new_x_2; // @[Conditional.scala 39:67:@324.8]
  assign _T_89_3 = cmp2_io_new_y; // @[Sort.scala 83:23:@329.10 Sort.scala 83:23:@333.10]
  assign _GEN_7 = _T_85 ? _T_89_3 : new_x_3; // @[Conditional.scala 39:67:@324.8]
  assign _GEN_8 = _T_85 ? 2'h3 : state; // @[Conditional.scala 39:67:@324.8]
  assign _GEN_9 = _T_74 ? new_x_1 : _GEN_0; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_10 = _T_74 ? new_x_2 : _GEN_1; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_11 = _T_74 ? new_x_0 : _GEN_2; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_12 = _T_74 ? new_x_3 : _GEN_3; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_13 = _T_74 ? _T_89_2 : _GEN_4; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_14 = _T_74 ? _T_89_0 : _GEN_5; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_15 = _T_74 ? _T_89_1 : _GEN_6; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_16 = _T_74 ? _T_89_3 : _GEN_7; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_17 = _T_74 ? 2'h2 : _GEN_8; // @[Conditional.scala 39:67:@306.6]
  assign _GEN_22 = _T_63 ? _T_89_0 : _GEN_13; // @[Conditional.scala 40:58:@288.4]
  assign _GEN_23 = _T_63 ? _T_89_1 : _GEN_14; // @[Conditional.scala 40:58:@288.4]
  assign _GEN_24 = _T_63 ? _T_89_2 : _GEN_15; // @[Conditional.scala 40:58:@288.4]
  assign _GEN_25 = _T_63 ? _T_89_3 : _GEN_16; // @[Conditional.scala 40:58:@288.4]
  assign _GEN_26 = _T_63 ? 2'h1 : _GEN_17; // @[Conditional.scala 40:58:@288.4]
  assign io_s0 = new_x_0; // @[Sort.scala 48:9:@279.4]
  assign io_s1 = new_x_1; // @[Sort.scala 49:9:@280.4]
  assign io_s2 = new_x_2; // @[Sort.scala 50:9:@281.4]
  assign io_s3 = new_x_3; // @[Sort.scala 51:9:@282.4]
  assign io_done = state == 2'h3; // @[Sort.scala 47:11:@278.4]
  assign cmp1_io_x = _T_63 ? new_x_0 : _GEN_9; // @[Sort.scala 53:13:@283.4 Sort.scala 61:17:@289.6 Sort.scala 70:17:@307.8 Sort.scala 79:17:@325.10]
  assign cmp1_io_y = _T_63 ? new_x_1 : _GEN_10; // @[Sort.scala 54:13:@284.4 Sort.scala 62:17:@290.6 Sort.scala 71:17:@308.8 Sort.scala 80:17:@326.10]
  assign cmp2_io_x = _T_63 ? new_x_2 : _GEN_11; // @[Sort.scala 55:13:@285.4 Sort.scala 63:17:@291.6 Sort.scala 72:17:@309.8 Sort.scala 81:17:@327.10]
  assign cmp2_io_y = _T_63 ? new_x_3 : _GEN_12; // @[Sort.scala 56:13:@286.4 Sort.scala 64:17:@292.6 Sort.scala 73:17:@310.8 Sort.scala 82:17:@328.10]
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
  new_x_0 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  new_x_1 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  new_x_2 = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  new_x_3 = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  state = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      new_x_0 <= io_x0;
    end else begin
      if (_T_63) begin
        new_x_0 <= _T_89_0;
      end else begin
        if (_T_74) begin
          new_x_0 <= _T_89_2;
        end else begin
          if (_T_85) begin
            new_x_0 <= _T_89_0;
          end
        end
      end
    end
    if (reset) begin
      new_x_1 <= io_x1;
    end else begin
      if (_T_63) begin
        new_x_1 <= _T_89_1;
      end else begin
        if (_T_74) begin
          new_x_1 <= _T_89_0;
        end else begin
          if (_T_85) begin
            new_x_1 <= _T_89_1;
          end
        end
      end
    end
    if (reset) begin
      new_x_2 <= io_x2;
    end else begin
      if (_T_63) begin
        new_x_2 <= _T_89_2;
      end else begin
        if (_T_74) begin
          new_x_2 <= _T_89_1;
        end else begin
          if (_T_85) begin
            new_x_2 <= _T_89_2;
          end
        end
      end
    end
    if (reset) begin
      new_x_3 <= io_x3;
    end else begin
      if (_T_63) begin
        new_x_3 <= _T_89_3;
      end else begin
        if (_T_74) begin
          new_x_3 <= _T_89_3;
        end else begin
          if (_T_85) begin
            new_x_3 <= _T_89_3;
          end
        end
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_63) begin
        state <= 2'h1;
      end else begin
        if (_T_74) begin
          state <= 2'h2;
        end else begin
          if (_T_85) begin
            state <= 2'h3;
          end
        end
      end
    end
  end
endmodule
