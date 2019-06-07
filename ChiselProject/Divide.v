module ALU2( // @[:@3.2]
  input  [7:0] io_a, // @[:@6.4]
  input  [7:0] io_b, // @[:@6.4]
  input  [2:0] io_s, // @[:@6.4]
  output [7:0] io_y, // @[:@6.4]
  output [2:0] io_f // @[:@6.4]
);
  wire  _T_22; // @[ALU2.scala 25:14:@15.4]
  wire [8:0] _T_23; // @[ALU2.scala 26:26:@17.6]
  wire [7:0] _T_24; // @[ALU2.scala 27:25:@19.6]
  wire [7:0] _T_25; // @[ALU2.scala 27:40:@20.6]
  wire [8:0] _T_26; // @[ALU2.scala 27:32:@21.6]
  wire  _T_27; // @[ALU2.scala 29:20:@26.6]
  wire [8:0] _T_28; // @[ALU2.scala 30:26:@28.8]
  wire [8:0] _T_29; // @[ALU2.scala 30:26:@29.8]
  wire [8:0] _T_32; // @[ALU2.scala 31:32:@33.8]
  wire  _T_33; // @[ALU2.scala 33:20:@38.8]
  wire [7:0] _T_34; // @[ALU2.scala 34:18:@40.10]
  wire  _T_35; // @[ALU2.scala 35:20:@44.10]
  wire [7:0] _T_36; // @[ALU2.scala 36:18:@46.12]
  wire  _T_37; // @[ALU2.scala 37:20:@50.12]
  wire [7:0] _T_38; // @[ALU2.scala 38:13:@52.14]
  wire  _T_39; // @[ALU2.scala 39:20:@56.14]
  wire [7:0] _T_40; // @[ALU2.scala 40:18:@58.16]
  wire  _T_41; // @[ALU2.scala 41:20:@62.16]
  wire [262:0] _GEN_12; // @[ALU2.scala 42:18:@64.18]
  wire [262:0] _T_42; // @[ALU2.scala 42:18:@64.18]
  wire  _T_43; // @[ALU2.scala 43:20:@68.18]
  wire [7:0] _T_44; // @[ALU2.scala 44:18:@70.20]
  wire [7:0] _GEN_0; // @[ALU2.scala 43:29:@69.18]
  wire [262:0] _GEN_1; // @[ALU2.scala 41:29:@63.16]
  wire [262:0] _GEN_2; // @[ALU2.scala 39:30:@57.14]
  wire [262:0] _GEN_3; // @[ALU2.scala 37:30:@51.12]
  wire [262:0] _GEN_4; // @[ALU2.scala 35:29:@45.10]
  wire [262:0] _GEN_5; // @[ALU2.scala 33:30:@39.8]
  wire [8:0] _GEN_6; // @[ALU2.scala 29:32:@27.6]
  wire [8:0] _GEN_7; // @[ALU2.scala 29:32:@27.6]
  wire [8:0] arith_result; // @[ALU2.scala 25:24:@16.4]
  wire [262:0] _GEN_8; // @[ALU2.scala 29:32:@27.6]
  wire [8:0] sext_result; // @[ALU2.scala 25:24:@16.4]
  wire [262:0] _GEN_11; // @[ALU2.scala 25:24:@16.4]
  wire  flag_zero; // @[ALU2.scala 49:21:@76.4]
  wire [1:0] _T_48; // @[ALU2.scala 50:32:@78.4]
  wire  _T_50; // @[ALU2.scala 50:43:@79.4]
  wire  _T_53; // @[ALU2.scala 50:81:@81.4]
  wire  flag_overflow; // @[ALU2.scala 50:56:@82.4]
  wire  flag_carry; // @[ALU2.scala 51:29:@84.4]
  wire [1:0] _T_56; // @[Cat.scala 30:58:@86.4]
  assign _T_22 = io_s == 3'h0; // @[ALU2.scala 25:14:@15.4]
  assign _T_23 = io_a + io_b; // @[ALU2.scala 26:26:@17.6]
  assign _T_24 = $signed(io_a); // @[ALU2.scala 27:25:@19.6]
  assign _T_25 = $signed(io_b); // @[ALU2.scala 27:40:@20.6]
  assign _T_26 = $signed(_T_24) + $signed(_T_25); // @[ALU2.scala 27:32:@21.6]
  assign _T_27 = io_s == 3'h1; // @[ALU2.scala 29:20:@26.6]
  assign _T_28 = io_a - io_b; // @[ALU2.scala 30:26:@28.8]
  assign _T_29 = $unsigned(_T_28); // @[ALU2.scala 30:26:@29.8]
  assign _T_32 = $signed(_T_24) - $signed(_T_25); // @[ALU2.scala 31:32:@33.8]
  assign _T_33 = io_s == 3'h2; // @[ALU2.scala 33:20:@38.8]
  assign _T_34 = io_a & io_b; // @[ALU2.scala 34:18:@40.10]
  assign _T_35 = io_s == 3'h3; // @[ALU2.scala 35:20:@44.10]
  assign _T_36 = io_a | io_b; // @[ALU2.scala 36:18:@46.12]
  assign _T_37 = io_s == 3'h4; // @[ALU2.scala 37:20:@50.12]
  assign _T_38 = ~ io_a; // @[ALU2.scala 38:13:@52.14]
  assign _T_39 = io_s == 3'h5; // @[ALU2.scala 39:20:@56.14]
  assign _T_40 = io_a ^ io_b; // @[ALU2.scala 40:18:@58.16]
  assign _T_41 = io_s == 3'h6; // @[ALU2.scala 41:20:@62.16]
  assign _GEN_12 = {{255'd0}, io_a}; // @[ALU2.scala 42:18:@64.18]
  assign _T_42 = _GEN_12 << io_b; // @[ALU2.scala 42:18:@64.18]
  assign _T_43 = io_s == 3'h7; // @[ALU2.scala 43:20:@68.18]
  assign _T_44 = io_a >> io_b; // @[ALU2.scala 44:18:@70.20]
  assign _GEN_0 = _T_43 ? _T_44 : 8'h0; // @[ALU2.scala 43:29:@69.18]
  assign _GEN_1 = _T_41 ? _T_42 : {{255'd0}, _GEN_0}; // @[ALU2.scala 41:29:@63.16]
  assign _GEN_2 = _T_39 ? {{255'd0}, _T_40} : _GEN_1; // @[ALU2.scala 39:30:@57.14]
  assign _GEN_3 = _T_37 ? {{255'd0}, _T_38} : _GEN_2; // @[ALU2.scala 37:30:@51.12]
  assign _GEN_4 = _T_35 ? {{255'd0}, _T_36} : _GEN_3; // @[ALU2.scala 35:29:@45.10]
  assign _GEN_5 = _T_33 ? {{255'd0}, _T_34} : _GEN_4; // @[ALU2.scala 33:30:@39.8]
  assign _GEN_6 = _T_27 ? _T_29 : 9'h0; // @[ALU2.scala 29:32:@27.6]
  assign _GEN_7 = _T_27 ? $signed(_T_32) : $signed(9'sh0); // @[ALU2.scala 29:32:@27.6]
  assign arith_result = _T_22 ? _T_23 : _GEN_6; // @[ALU2.scala 25:24:@16.4]
  assign _GEN_8 = _T_27 ? {{254'd0}, arith_result} : _GEN_5; // @[ALU2.scala 29:32:@27.6]
  assign sext_result = _T_22 ? $signed(_T_26) : $signed(_GEN_7); // @[ALU2.scala 25:24:@16.4]
  assign _GEN_11 = _T_22 ? {{254'd0}, arith_result} : _GEN_8; // @[ALU2.scala 25:24:@16.4]
  assign flag_zero = io_y == 8'h0; // @[ALU2.scala 49:21:@76.4]
  assign _T_48 = sext_result[8:7]; // @[ALU2.scala 50:32:@78.4]
  assign _T_50 = _T_48 == 2'h1; // @[ALU2.scala 50:43:@79.4]
  assign _T_53 = _T_48 == 2'h2; // @[ALU2.scala 50:81:@81.4]
  assign flag_overflow = _T_50 | _T_53; // @[ALU2.scala 50:56:@82.4]
  assign flag_carry = arith_result[8]; // @[ALU2.scala 51:29:@84.4]
  assign _T_56 = {flag_carry,flag_overflow}; // @[Cat.scala 30:58:@86.4]
  assign io_y = _GEN_11[7:0]; // @[ALU2.scala 28:10:@23.6 ALU2.scala 32:10:@35.8 ALU2.scala 34:10:@41.10 ALU2.scala 36:10:@47.12 ALU2.scala 38:10:@53.14 ALU2.scala 40:10:@59.16 ALU2.scala 42:10:@65.18 ALU2.scala 44:10:@71.20 ALU2.scala 46:10:@74.20]
  assign io_f = {_T_56,flag_zero}; // @[ALU2.scala 53:8:@88.4]
endmodule
module ALU2_2( // @[:@177.2]
  input  [3:0] io_a, // @[:@180.4]
  input  [3:0] io_b, // @[:@180.4]
  output [3:0] io_y // @[:@180.4]
);
  wire [3:0] _T_36; // @[ALU2.scala 36:18:@220.12]
  wire [18:0] _GEN_4; // @[ALU2.scala 35:29:@219.10]
  assign _T_36 = io_a | io_b; // @[ALU2.scala 36:18:@220.12]
  assign _GEN_4 = {{15'd0}, _T_36}; // @[ALU2.scala 35:29:@219.10]
  assign io_y = _GEN_4[3:0]; // @[ALU2.scala 28:10:@197.6 ALU2.scala 32:10:@209.8 ALU2.scala 34:10:@215.10 ALU2.scala 36:10:@221.12 ALU2.scala 38:10:@227.14 ALU2.scala 40:10:@233.16 ALU2.scala 42:10:@239.18 ALU2.scala 44:10:@245.20 ALU2.scala 46:10:@248.20]
endmodule
module Compare2( // @[:@351.2]
  input  [7:0] io_x, // @[:@354.4]
  input  [7:0] io_y, // @[:@354.4]
  output       io_ug, // @[:@354.4]
  output       io_eq // @[:@354.4]
);
  wire [7:0] alu_io_a; // @[Compare2.scala 20:19:@356.4]
  wire [7:0] alu_io_b; // @[Compare2.scala 20:19:@356.4]
  wire [2:0] alu_io_s; // @[Compare2.scala 20:19:@356.4]
  wire [7:0] alu_io_y; // @[Compare2.scala 20:19:@356.4]
  wire [2:0] alu_io_f; // @[Compare2.scala 20:19:@356.4]
  wire  _T_21; // @[Compare2.scala 25:12:@364.4]
  wire  _T_22; // @[Compare2.scala 25:30:@365.4]
  wire  _T_23; // @[Compare2.scala 25:21:@366.4]
  ALU2 alu ( // @[Compare2.scala 20:19:@356.4]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_s(alu_io_s),
    .io_y(alu_io_y),
    .io_f(alu_io_f)
  );
  assign _T_21 = ~ io_eq; // @[Compare2.scala 25:12:@364.4]
  assign _T_22 = alu_io_f[2]; // @[Compare2.scala 25:30:@365.4]
  assign _T_23 = ~ _T_22; // @[Compare2.scala 25:21:@366.4]
  assign io_ug = _T_21 & _T_23; // @[Compare2.scala 25:9:@368.4]
  assign io_eq = alu_io_f[0]; // @[Compare2.scala 24:9:@363.4]
  assign alu_io_a = io_x; // @[Compare2.scala 21:12:@359.4]
  assign alu_io_b = io_y; // @[Compare2.scala 22:12:@360.4]
  assign alu_io_s = 3'h1; // @[Compare2.scala 23:12:@361.4]
endmodule
module Divide( // @[:@387.2]
  input        clock, // @[:@388.4]
  input        reset, // @[:@389.4]
  input  [3:0] io_x, // @[:@390.4]
  input  [3:0] io_y, // @[:@390.4]
  output [3:0] io_q, // @[:@390.4]
  output [3:0] io_r, // @[:@390.4]
  output       io_error, // @[:@390.4]
  output       io_done // @[:@390.4]
);
  wire [7:0] alu_shift_io_a; // @[Divide.scala 20:25:@393.4]
  wire [7:0] alu_shift_io_b; // @[Divide.scala 20:25:@393.4]
  wire [2:0] alu_shift_io_s; // @[Divide.scala 20:25:@393.4]
  wire [7:0] alu_shift_io_y; // @[Divide.scala 20:25:@393.4]
  wire [2:0] alu_shift_io_f; // @[Divide.scala 20:25:@393.4]
  wire [7:0] alu_minus_io_a; // @[Divide.scala 22:25:@397.4]
  wire [7:0] alu_minus_io_b; // @[Divide.scala 22:25:@397.4]
  wire [2:0] alu_minus_io_s; // @[Divide.scala 22:25:@397.4]
  wire [7:0] alu_minus_io_y; // @[Divide.scala 22:25:@397.4]
  wire [2:0] alu_minus_io_f; // @[Divide.scala 22:25:@397.4]
  wire [3:0] alu_q_io_a; // @[Divide.scala 24:21:@401.4]
  wire [3:0] alu_q_io_b; // @[Divide.scala 24:21:@401.4]
  wire [3:0] alu_q_io_y; // @[Divide.scala 24:21:@401.4]
  wire [7:0] cmp_io_x; // @[Divide.scala 26:19:@405.4]
  wire [7:0] cmp_io_y; // @[Divide.scala 26:19:@405.4]
  wire  cmp_io_ug; // @[Divide.scala 26:19:@405.4]
  wire  cmp_io_eq; // @[Divide.scala 26:19:@405.4]
  reg [2:0] state; // @[Divide.scala 18:22:@392.4]
  reg [31:0] _RAND_0;
  reg [7:0] next_x; // @[Divide.scala 28:23:@408.4]
  reg [31:0] _RAND_1;
  reg [3:0] q_now; // @[Divide.scala 35:22:@413.4]
  reg [31:0] _RAND_2;
  wire  _T_27; // @[Divide.scala 41:19:@418.4]
  wire [7:0] _GEN_1; // @[Divide.scala 41:32:@419.4]
  wire [3:0] _GEN_2; // @[Divide.scala 41:32:@419.4]
  wire  _T_30; // @[Conditional.scala 37:30:@428.4]
  wire  _T_32; // @[Divide.scala 59:18:@430.6]
  wire [3:0] _GEN_4; // @[Divide.scala 59:27:@431.6]
  wire [7:0] _GEN_5; // @[Divide.scala 59:27:@431.6]
  wire [1:0] _GEN_6; // @[Divide.scala 59:27:@431.6]
  wire [3:0] _GEN_7; // @[Divide.scala 59:27:@431.6]
  wire [2:0] _GEN_8; // @[Divide.scala 59:27:@431.6]
  wire  _T_39; // @[Conditional.scala 37:30:@444.6]
  wire  _T_42; // @[Conditional.scala 37:30:@451.8]
  wire  _T_45; // @[Conditional.scala 37:30:@458.10]
  wire  _T_48; // @[Conditional.scala 37:30:@465.12]
  wire [2:0] _GEN_12; // @[Conditional.scala 39:67:@459.10]
  wire  _GEN_13; // @[Conditional.scala 39:67:@459.10]
  wire [1:0] _GEN_15; // @[Conditional.scala 39:67:@452.8]
  wire [2:0] _GEN_16; // @[Conditional.scala 39:67:@452.8]
  wire  _GEN_17; // @[Conditional.scala 39:67:@452.8]
  wire [1:0] _GEN_18; // @[Conditional.scala 39:67:@445.6]
  wire [2:0] _GEN_19; // @[Conditional.scala 39:67:@445.6]
  wire [2:0] _GEN_20; // @[Conditional.scala 39:67:@445.6]
  wire  _GEN_21; // @[Conditional.scala 39:67:@445.6]
  wire [7:0] _GEN_25; // @[Conditional.scala 40:58:@429.4]
  wire [1:0] _GEN_26; // @[Conditional.scala 40:58:@429.4]
  wire [2:0] _GEN_28; // @[Conditional.scala 40:58:@429.4]
  ALU2 alu_shift ( // @[Divide.scala 20:25:@393.4]
    .io_a(alu_shift_io_a),
    .io_b(alu_shift_io_b),
    .io_s(alu_shift_io_s),
    .io_y(alu_shift_io_y),
    .io_f(alu_shift_io_f)
  );
  ALU2 alu_minus ( // @[Divide.scala 22:25:@397.4]
    .io_a(alu_minus_io_a),
    .io_b(alu_minus_io_b),
    .io_s(alu_minus_io_s),
    .io_y(alu_minus_io_y),
    .io_f(alu_minus_io_f)
  );
  ALU2_2 alu_q ( // @[Divide.scala 24:21:@401.4]
    .io_a(alu_q_io_a),
    .io_b(alu_q_io_b),
    .io_y(alu_q_io_y)
  );
  Compare2 cmp ( // @[Divide.scala 26:19:@405.4]
    .io_x(cmp_io_x),
    .io_y(cmp_io_y),
    .io_ug(cmp_io_ug),
    .io_eq(cmp_io_eq)
  );
  assign _T_27 = cmp_io_ug | cmp_io_eq; // @[Divide.scala 41:19:@418.4]
  assign _GEN_1 = _T_27 ? alu_minus_io_y : next_x; // @[Divide.scala 41:32:@419.4]
  assign _GEN_2 = _T_27 ? alu_q_io_y : q_now; // @[Divide.scala 41:32:@419.4]
  assign _T_30 = 3'h0 == state; // @[Conditional.scala 37:30:@428.4]
  assign _T_32 = io_y == 4'h0; // @[Divide.scala 59:18:@430.6]
  assign _GEN_4 = _T_32 ? 4'h0 : q_now; // @[Divide.scala 59:27:@431.6]
  assign _GEN_5 = _T_32 ? 8'h0 : next_x; // @[Divide.scala 59:27:@431.6]
  assign _GEN_6 = _T_32 ? 2'h0 : 2'h3; // @[Divide.scala 59:27:@431.6]
  assign _GEN_7 = _T_32 ? 4'h0 : 4'h8; // @[Divide.scala 59:27:@431.6]
  assign _GEN_8 = _T_32 ? state : 3'h1; // @[Divide.scala 59:27:@431.6]
  assign _T_39 = 3'h1 == state; // @[Conditional.scala 37:30:@444.6]
  assign _T_42 = 3'h2 == state; // @[Conditional.scala 37:30:@451.8]
  assign _T_45 = 3'h3 == state; // @[Conditional.scala 37:30:@458.10]
  assign _T_48 = 3'h4 == state; // @[Conditional.scala 37:30:@465.12]
  assign _GEN_12 = _T_45 ? 3'h4 : state; // @[Conditional.scala 39:67:@459.10]
  assign _GEN_13 = _T_45 ? 1'h0 : _T_48; // @[Conditional.scala 39:67:@459.10]
  assign _GEN_15 = _T_42 ? 2'h2 : {{1'd0}, _T_45}; // @[Conditional.scala 39:67:@452.8]
  assign _GEN_16 = _T_42 ? 3'h3 : _GEN_12; // @[Conditional.scala 39:67:@452.8]
  assign _GEN_17 = _T_42 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67:@452.8]
  assign _GEN_18 = _T_39 ? 2'h2 : {{1'd0}, _T_42}; // @[Conditional.scala 39:67:@445.6]
  assign _GEN_19 = _T_39 ? 3'h4 : {{1'd0}, _GEN_15}; // @[Conditional.scala 39:67:@445.6]
  assign _GEN_20 = _T_39 ? 3'h2 : _GEN_16; // @[Conditional.scala 39:67:@445.6]
  assign _GEN_21 = _T_39 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67:@445.6]
  assign _GEN_25 = _T_30 ? _GEN_5 : next_x; // @[Conditional.scala 40:58:@429.4]
  assign _GEN_26 = _T_30 ? _GEN_6 : _GEN_18; // @[Conditional.scala 40:58:@429.4]
  assign _GEN_28 = _T_30 ? _GEN_8 : _GEN_20; // @[Conditional.scala 40:58:@429.4]
  assign io_q = _T_30 ? _GEN_4 : q_now; // @[Divide.scala 49:8:@426.4 Divide.scala 62:14:@434.8]
  assign io_r = _GEN_25[3:0]; // @[Divide.scala 50:8:@427.4 Divide.scala 63:14:@435.8]
  assign io_error = _T_30 ? _T_32 : 1'h0; // @[Divide.scala 47:12:@424.4 Divide.scala 60:18:@432.8]
  assign io_done = _T_30 ? _T_32 : _GEN_21; // @[Divide.scala 48:11:@425.4 Divide.scala 61:17:@433.8 Divide.scala 86:15:@467.14]
  assign alu_shift_io_a = {{4'd0}, io_y}; // @[Divide.scala 30:18:@409.4]
  assign alu_shift_io_b = {{6'd0}, _GEN_26}; // @[Divide.scala 31:18:@410.4 Divide.scala 65:24:@438.8 Divide.scala 71:22:@446.8 Divide.scala 76:22:@453.10 Divide.scala 81:22:@460.12]
  assign alu_shift_io_s = 3'h6; // @[Divide.scala 21:18:@396.4]
  assign alu_minus_io_a = next_x; // @[Divide.scala 32:18:@411.4]
  assign alu_minus_io_b = _T_27 ? alu_shift_io_y : 8'h0; // @[Divide.scala 33:18:@412.4 Divide.scala 42:20:@420.6]
  assign alu_minus_io_s = 3'h1; // @[Divide.scala 23:18:@400.4]
  assign alu_q_io_a = q_now; // @[Divide.scala 36:14:@414.4]
  assign alu_q_io_b = _T_30 ? _GEN_7 : {{1'd0}, _GEN_19}; // @[Divide.scala 37:14:@415.4 Divide.scala 66:20:@439.8 Divide.scala 72:18:@447.8 Divide.scala 77:18:@454.10 Divide.scala 82:18:@461.12]
  assign cmp_io_x = next_x; // @[Divide.scala 39:12:@416.4]
  assign cmp_io_y = alu_shift_io_y; // @[Divide.scala 40:12:@417.4]
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
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  next_x = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  q_now = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_30) begin
        if (!(_T_32)) begin
          state <= 3'h1;
        end
      end else begin
        if (_T_39) begin
          state <= 3'h2;
        end else begin
          if (_T_42) begin
            state <= 3'h3;
          end else begin
            if (_T_45) begin
              state <= 3'h4;
            end
          end
        end
      end
    end
    if (reset) begin
      next_x <= {{4'd0}, io_x};
    end else begin
      if (_T_27) begin
        next_x <= alu_minus_io_y;
      end
    end
    if (reset) begin
      q_now <= 4'h0;
    end else begin
      if (_T_27) begin
        q_now <= alu_q_io_y;
      end
    end
  end
endmodule
