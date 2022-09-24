module md5round(
  input  [31:0] io_a,
  input  [31:0] io_b,
  input  [31:0] io_c,
  input  [31:0] io_d,
  input  [31:0] io_m,
  input  [4:0]  io_s,
  input  [31:0] io_t,
  input  [1:0]  io_r,
  output [31:0] io_next_a
);
  wire [31:0] _res_T = io_b & io_c; // @[md5round.scala 18:8]
  wire [31:0] _res_T_1 = ~io_b; // @[md5round.scala 18:17]
  wire [31:0] _res_T_2 = _res_T_1 & io_d; // @[md5round.scala 18:28]
  wire [31:0] _res_T_3 = _res_T | _res_T_2; // @[md5round.scala 18:13]
  wire [31:0] _res_T_5 = io_a + _res_T_3; // @[md5round.scala 38:19]
  wire [31:0] _res_T_7 = _res_T_5 + io_m; // @[md5round.scala 38:41]
  wire [31:0] _res_T_9 = _res_T_7 + io_t; // @[md5round.scala 38:48]
  wire [31:0] _res_T_10 = io_b & io_d; // @[md5round.scala 21:8]
  wire [31:0] _res_T_11 = ~io_d; // @[md5round.scala 21:21]
  wire [31:0] _res_T_12 = io_c & _res_T_11; // @[md5round.scala 21:18]
  wire [31:0] _res_T_13 = _res_T_10 | _res_T_12; // @[md5round.scala 21:13]
  wire [31:0] _res_T_15 = io_a + _res_T_13; // @[md5round.scala 41:19]
  wire [31:0] _res_T_17 = _res_T_15 + io_m; // @[md5round.scala 41:41]
  wire [31:0] _res_T_19 = _res_T_17 + io_t; // @[md5round.scala 41:48]
  wire [31:0] _res_T_20 = io_b ^ io_c; // @[md5round.scala 24:7]
  wire [31:0] _res_T_21 = _res_T_20 ^ io_d; // @[md5round.scala 24:11]
  wire [31:0] _res_T_23 = io_a + _res_T_21; // @[md5round.scala 44:19]
  wire [31:0] _res_T_25 = _res_T_23 + io_m; // @[md5round.scala 44:41]
  wire [31:0] _res_T_27 = _res_T_25 + io_t; // @[md5round.scala 44:48]
  wire [31:0] _res_T_29 = io_b | _res_T_11; // @[md5round.scala 27:12]
  wire [31:0] _res_T_30 = io_c ^ _res_T_29; // @[md5round.scala 27:7]
  wire [31:0] _res_T_32 = io_a + _res_T_30; // @[md5round.scala 47:19]
  wire [31:0] _res_T_34 = _res_T_32 + io_m; // @[md5round.scala 47:41]
  wire [31:0] _res_T_36 = _res_T_34 + io_t; // @[md5round.scala 47:48]
  wire [31:0] _GEN_0 = 2'h3 == io_r ? _res_T_36 : 32'h0; // @[md5round.scala 36:16 47:11 32:7]
  wire [31:0] _GEN_1 = 2'h2 == io_r ? _res_T_27 : _GEN_0; // @[md5round.scala 36:16 44:11]
  wire [31:0] _GEN_2 = 2'h1 == io_r ? _res_T_19 : _GEN_1; // @[md5round.scala 36:16 41:11]
  wire [31:0] res = 2'h0 == io_r ? _res_T_9 : _GEN_2; // @[md5round.scala 36:16 38:11]
  wire [62:0] _GEN_3 = {{31'd0}, res}; // @[md5round.scala 51:30]
  wire [62:0] _io_next_a_T = _GEN_3 << io_s; // @[md5round.scala 51:30]
  wire [5:0] _GEN_4 = {{1'd0}, io_s}; // @[md5round.scala 51:52]
  wire [5:0] _io_next_a_T_2 = 6'h20 - _GEN_4; // @[md5round.scala 51:52]
  wire [31:0] _io_next_a_T_3 = res >> _io_next_a_T_2; // @[md5round.scala 51:43]
  wire [62:0] _GEN_5 = {{31'd0}, _io_next_a_T_3}; // @[md5round.scala 51:69]
  wire [62:0] _io_next_a_T_4 = _io_next_a_T | _GEN_5; // @[md5round.scala 51:69]
  wire [62:0] _GEN_6 = {{31'd0}, io_b}; // @[md5round.scala 51:21]
  wire [62:0] _io_next_a_T_6 = _GEN_6 + _io_next_a_T_4; // @[md5round.scala 51:21]
  assign io_next_a = _io_next_a_T_6[31:0]; // @[md5round.scala 51:13]
endmodule
module md5(
  input          clock,
  input          reset,
  input  [127:0] io_in,
  input          io_in_valid,
  output [127:0] io_out,
  output         io_out_valid,
  output         io_ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [511:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] md5Round_io_a; // @[md5.scala 38:24]
  wire [31:0] md5Round_io_b; // @[md5.scala 38:24]
  wire [31:0] md5Round_io_c; // @[md5.scala 38:24]
  wire [31:0] md5Round_io_d; // @[md5.scala 38:24]
  wire [31:0] md5Round_io_m; // @[md5.scala 38:24]
  wire [4:0] md5Round_io_s; // @[md5.scala 38:24]
  wire [31:0] md5Round_io_t; // @[md5.scala 38:24]
  wire [1:0] md5Round_io_r; // @[md5.scala 38:24]
  wire [31:0] md5Round_io_next_a; // @[md5.scala 38:24]
  reg [31:0] A; // @[md5.scala 19:18]
  reg [31:0] B; // @[md5.scala 20:18]
  reg [31:0] C; // @[md5.scala 21:18]
  reg [31:0] D; // @[md5.scala 22:18]
  reg [31:0] AA; // @[md5.scala 23:19]
  reg [31:0] BB; // @[md5.scala 24:19]
  reg [31:0] CC; // @[md5.scala 25:19]
  reg [31:0] DD; // @[md5.scala 26:19]
  reg [3:0] phase; // @[md5.scala 31:22]
  reg [7:0] state; // @[md5.scala 32:22]
  reg [511:0] msg; // @[md5.scala 34:20]
  reg  out_r; // @[md5.scala 35:22]
  wire [7:0] _out_r_T = {{5'd0}, state[7:5]}; // @[md5.scala 53:17]
  wire [95:0] _io_out_T_1 = {A,B,C}; // @[md5.scala 56:20]
  wire [7:0] _T_129 = {{6'd0}, state[7:6]}; // @[md5.scala 307:13]
  wire [7:0] _T_101 = {{4'd0}, state[7:4]}; // @[md5.scala 259:13]
  wire  _T_124 = phase == 4'hf; // @[md5.scala 290:16]
  wire [7:0] _T_77 = {{3'd0}, state[7:3]}; // @[md5.scala 224:13]
  wire [7:0] _T_53 = {{2'd0}, state[7:2]}; // @[md5.scala 188:13]
  wire [7:0] _T_29 = {{1'd0}, state[7:1]}; // @[md5.scala 153:13]
  wire [7:0] _GEN_15 = state[0] & io_in_valid ? 8'h2 : state; // @[md5.scala 119:35 120:16 51:14]
  wire [7:0] _GEN_90 = _T_124 ? 8'h4 : _GEN_15; // @[md5.scala 183:31 184:18]
  wire [7:0] _GEN_103 = _T_29[0] ? _GEN_90 : _GEN_15; // @[md5.scala 153:19]
  wire [7:0] _GEN_162 = _T_124 ? 8'h8 : _GEN_103; // @[md5.scala 219:31 220:18]
  wire [7:0] _GEN_175 = _T_53[0] ? _GEN_162 : _GEN_103; // @[md5.scala 188:19]
  wire [7:0] _GEN_234 = _T_124 ? 8'h10 : _GEN_175; // @[md5.scala 254:31 255:18]
  wire [7:0] _GEN_247 = _T_77[0] ? _GEN_234 : _GEN_175; // @[md5.scala 224:19]
  wire [7:0] _GEN_306 = phase == 4'hf ? 8'h20 : _GEN_247; // @[md5.scala 290:31 291:18]
  wire [7:0] _GEN_319 = _T_101[0] ? _GEN_306 : _GEN_247; // @[md5.scala 259:19]
  wire [7:0] _GEN_324 = _out_r_T[0] ? 8'h40 : _GEN_319; // @[md5.scala 296:25 304:16]
  wire [7:0] next_state = _T_129[0] ? 8'h1 : _GEN_324; // @[md5.scala 307:26 309:16]
  wire [7:0] _T_2 = {{1'd0}, next_state[7:1]}; // @[md5.scala 80:24]
  wire  _T_6 = _T_2[0] & state[0]; // @[md5.scala 80:29]
  wire [31:0] _Anext_T_1 = A + AA; // @[md5.scala 300:16]
  wire  _T_104 = 2'h0 == phase[1:0]; // @[md5.scala 261:25]
  wire [31:0] _GEN_38 = _T_104 ? md5Round_io_next_a : A; // @[md5.scala 155:25 157:15 47:9]
  wire [31:0] _GEN_92 = _T_29[0] ? _GEN_38 : A; // @[md5.scala 153:19 47:9]
  wire [31:0] _GEN_110 = _T_104 ? md5Round_io_next_a : _GEN_92; // @[md5.scala 190:25 192:15]
  wire [31:0] _GEN_164 = _T_53[0] ? _GEN_110 : _GEN_92; // @[md5.scala 188:19]
  wire [31:0] _GEN_182 = _T_104 ? md5Round_io_next_a : _GEN_164; // @[md5.scala 226:25 228:15]
  wire [31:0] _GEN_236 = _T_77[0] ? _GEN_182 : _GEN_164; // @[md5.scala 224:19]
  wire [31:0] _GEN_254 = 2'h0 == phase[1:0] ? md5Round_io_next_a : _GEN_236; // @[md5.scala 261:25 263:15]
  wire [31:0] _Bnext_T_1 = B + BB; // @[md5.scala 301:16]
  wire  _T_33 = 2'h1 == phase[1:0]; // @[md5.scala 155:25]
  wire  _T_34 = 2'h2 == phase[1:0]; // @[md5.scala 155:25]
  wire  _T_35 = 2'h3 == phase[1:0]; // @[md5.scala 155:25]
  wire [31:0] _GEN_32 = 2'h3 == phase[1:0] ? md5Round_io_next_a : B; // @[md5.scala 155:25 166:15 48:9]
  wire [31:0] _GEN_34 = 2'h2 == phase[1:0] ? B : _GEN_32; // @[md5.scala 155:25 48:9]
  wire [31:0] _GEN_37 = 2'h1 == phase[1:0] ? B : _GEN_34; // @[md5.scala 155:25 48:9]
  wire [31:0] _GEN_41 = _T_104 ? B : _GEN_37; // @[md5.scala 155:25 48:9]
  wire [31:0] _GEN_95 = _T_29[0] ? _GEN_41 : B; // @[md5.scala 153:19 48:9]
  wire [31:0] _GEN_104 = _T_35 ? md5Round_io_next_a : _GEN_95; // @[md5.scala 190:25 201:15]
  wire [31:0] _GEN_106 = _T_34 ? _GEN_95 : _GEN_104; // @[md5.scala 190:25]
  wire [31:0] _GEN_109 = _T_33 ? _GEN_95 : _GEN_106; // @[md5.scala 190:25]
  wire [31:0] _GEN_113 = _T_104 ? _GEN_95 : _GEN_109; // @[md5.scala 190:25]
  wire [31:0] _GEN_167 = _T_53[0] ? _GEN_113 : _GEN_95; // @[md5.scala 188:19]
  wire [31:0] _GEN_176 = _T_35 ? md5Round_io_next_a : _GEN_167; // @[md5.scala 226:25 237:15]
  wire [31:0] _GEN_178 = _T_34 ? _GEN_167 : _GEN_176; // @[md5.scala 226:25]
  wire [31:0] _GEN_181 = _T_33 ? _GEN_167 : _GEN_178; // @[md5.scala 226:25]
  wire [31:0] _GEN_185 = _T_104 ? _GEN_167 : _GEN_181; // @[md5.scala 226:25]
  wire [31:0] _GEN_239 = _T_77[0] ? _GEN_185 : _GEN_167; // @[md5.scala 224:19]
  wire [31:0] _GEN_248 = _T_35 ? md5Round_io_next_a : _GEN_239; // @[md5.scala 261:25 272:15]
  wire [31:0] _GEN_250 = _T_34 ? _GEN_239 : _GEN_248; // @[md5.scala 261:25]
  wire [31:0] _GEN_253 = _T_33 ? _GEN_239 : _GEN_250; // @[md5.scala 261:25]
  wire [31:0] _GEN_257 = 2'h0 == phase[1:0] ? _GEN_239 : _GEN_253; // @[md5.scala 261:25]
  wire [31:0] _Cnext_T_1 = C + CC; // @[md5.scala 302:16]
  wire [31:0] _GEN_33 = 2'h2 == phase[1:0] ? md5Round_io_next_a : C; // @[md5.scala 155:25 163:15 49:9]
  wire [31:0] _GEN_36 = 2'h1 == phase[1:0] ? C : _GEN_33; // @[md5.scala 155:25 49:9]
  wire [31:0] _GEN_40 = _T_104 ? C : _GEN_36; // @[md5.scala 155:25 49:9]
  wire [31:0] _GEN_94 = _T_29[0] ? _GEN_40 : C; // @[md5.scala 153:19 49:9]
  wire [31:0] _GEN_105 = _T_34 ? md5Round_io_next_a : _GEN_94; // @[md5.scala 190:25 198:15]
  wire [31:0] _GEN_108 = _T_33 ? _GEN_94 : _GEN_105; // @[md5.scala 190:25]
  wire [31:0] _GEN_112 = _T_104 ? _GEN_94 : _GEN_108; // @[md5.scala 190:25]
  wire [31:0] _GEN_166 = _T_53[0] ? _GEN_112 : _GEN_94; // @[md5.scala 188:19]
  wire [31:0] _GEN_177 = _T_34 ? md5Round_io_next_a : _GEN_166; // @[md5.scala 226:25 234:15]
  wire [31:0] _GEN_180 = _T_33 ? _GEN_166 : _GEN_177; // @[md5.scala 226:25]
  wire [31:0] _GEN_184 = _T_104 ? _GEN_166 : _GEN_180; // @[md5.scala 226:25]
  wire [31:0] _GEN_238 = _T_77[0] ? _GEN_184 : _GEN_166; // @[md5.scala 224:19]
  wire [31:0] _GEN_249 = _T_34 ? md5Round_io_next_a : _GEN_238; // @[md5.scala 261:25 269:15]
  wire [31:0] _GEN_252 = _T_33 ? _GEN_238 : _GEN_249; // @[md5.scala 261:25]
  wire [31:0] _GEN_256 = 2'h0 == phase[1:0] ? _GEN_238 : _GEN_252; // @[md5.scala 261:25]
  wire [31:0] _Dnext_T_1 = D + DD; // @[md5.scala 303:16]
  wire [31:0] _GEN_35 = 2'h1 == phase[1:0] ? md5Round_io_next_a : D; // @[md5.scala 155:25 160:15 50:9]
  wire [31:0] _GEN_39 = _T_104 ? D : _GEN_35; // @[md5.scala 155:25 50:9]
  wire [31:0] _GEN_93 = _T_29[0] ? _GEN_39 : D; // @[md5.scala 153:19 50:9]
  wire [31:0] _GEN_107 = _T_33 ? md5Round_io_next_a : _GEN_93; // @[md5.scala 190:25 195:15]
  wire [31:0] _GEN_111 = _T_104 ? _GEN_93 : _GEN_107; // @[md5.scala 190:25]
  wire [31:0] _GEN_165 = _T_53[0] ? _GEN_111 : _GEN_93; // @[md5.scala 188:19]
  wire [31:0] _GEN_179 = _T_33 ? md5Round_io_next_a : _GEN_165; // @[md5.scala 226:25 231:15]
  wire [31:0] _GEN_183 = _T_104 ? _GEN_165 : _GEN_179; // @[md5.scala 226:25]
  wire [31:0] _GEN_237 = _T_77[0] ? _GEN_183 : _GEN_165; // @[md5.scala 224:19]
  wire [31:0] _GEN_251 = _T_33 ? md5Round_io_next_a : _GEN_237; // @[md5.scala 261:25 266:15]
  wire [31:0] _GEN_255 = 2'h0 == phase[1:0] ? _GEN_237 : _GEN_251; // @[md5.scala 261:25]
  wire [3:0] _phase_T_1 = phase + 4'h1; // @[md5.scala 106:20]
  wire [511:0] _msg_T = {io_in,io_in,io_in,io_in}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_16 = _T_35 ? B : 32'h0; // @[md5.scala 124:23 144:11 67:7]
  wire [31:0] _GEN_17 = _T_35 ? C : 32'h0; // @[md5.scala 124:23 145:11 68:7]
  wire [31:0] _GEN_18 = _T_35 ? D : 32'h0; // @[md5.scala 124:23 146:11 69:7]
  wire [31:0] _GEN_19 = _T_35 ? A : 32'h0; // @[md5.scala 124:23 147:11 70:7]
  wire [31:0] _GEN_20 = _T_34 ? C : _GEN_16; // @[md5.scala 124:23 138:11]
  wire [31:0] _GEN_21 = _T_34 ? D : _GEN_17; // @[md5.scala 124:23 139:11]
  wire [31:0] _GEN_22 = _T_34 ? A : _GEN_18; // @[md5.scala 124:23 140:11]
  wire [31:0] _GEN_23 = _T_34 ? B : _GEN_19; // @[md5.scala 124:23 141:11]
  wire [31:0] _GEN_24 = _T_33 ? D : _GEN_20; // @[md5.scala 124:23 132:11]
  wire [31:0] _GEN_25 = _T_33 ? A : _GEN_21; // @[md5.scala 124:23 133:11]
  wire [31:0] _GEN_26 = _T_33 ? B : _GEN_22; // @[md5.scala 124:23 134:11]
  wire [31:0] _GEN_27 = _T_33 ? C : _GEN_23; // @[md5.scala 124:23 135:11]
  wire [31:0] cya = _T_104 ? A : _GEN_24; // @[md5.scala 124:23 126:11]
  wire [31:0] cyb = _T_104 ? B : _GEN_25; // @[md5.scala 124:23 127:11]
  wire [31:0] cyc = _T_104 ? C : _GEN_26; // @[md5.scala 124:23 128:11]
  wire [31:0] cyd = _T_104 ? D : _GEN_27; // @[md5.scala 124:23 129:11]
  wire  _T_36 = phase == 4'h0; // @[md5.scala 176:18]
  wire [31:0] _GEN_42 = phase == 4'h0 ? msg[31:0] : 32'h0; // @[md5.scala 176:27 177:23 63:17]
  wire [4:0] _GEN_43 = phase == 4'h0 ? 5'h7 : 5'h0; // @[md5.scala 176:27 178:23 64:17]
  wire [31:0] _GEN_44 = phase == 4'h0 ? 32'hd76aa478 : 32'h0; // @[md5.scala 176:27 179:23 65:17]
  wire  _T_37 = phase == 4'h1; // @[md5.scala 176:18]
  wire [31:0] _GEN_45 = phase == 4'h1 ? msg[63:32] : _GEN_42; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_46 = phase == 4'h1 ? 5'hc : _GEN_43; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_47 = phase == 4'h1 ? 32'he8c7b756 : _GEN_44; // @[md5.scala 176:27 179:23]
  wire  _T_38 = phase == 4'h2; // @[md5.scala 176:18]
  wire [31:0] _GEN_48 = phase == 4'h2 ? msg[95:64] : _GEN_45; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_49 = phase == 4'h2 ? 5'h11 : _GEN_46; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_50 = phase == 4'h2 ? 32'h242070db : _GEN_47; // @[md5.scala 176:27 179:23]
  wire  _T_39 = phase == 4'h3; // @[md5.scala 176:18]
  wire [31:0] _GEN_51 = phase == 4'h3 ? msg[127:96] : _GEN_48; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_52 = phase == 4'h3 ? 5'h16 : _GEN_49; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_53 = phase == 4'h3 ? 32'hc1bdceee : _GEN_50; // @[md5.scala 176:27 179:23]
  wire  _T_40 = phase == 4'h4; // @[md5.scala 176:18]
  wire [31:0] _GEN_54 = phase == 4'h4 ? msg[159:128] : _GEN_51; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_55 = phase == 4'h4 ? 5'h7 : _GEN_52; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_56 = phase == 4'h4 ? 32'hf57c0faf : _GEN_53; // @[md5.scala 176:27 179:23]
  wire  _T_41 = phase == 4'h5; // @[md5.scala 176:18]
  wire [31:0] _GEN_57 = phase == 4'h5 ? msg[191:160] : _GEN_54; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_58 = phase == 4'h5 ? 5'hc : _GEN_55; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_59 = phase == 4'h5 ? 32'h4787c62a : _GEN_56; // @[md5.scala 176:27 179:23]
  wire  _T_42 = phase == 4'h6; // @[md5.scala 176:18]
  wire [31:0] _GEN_60 = phase == 4'h6 ? msg[223:192] : _GEN_57; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_61 = phase == 4'h6 ? 5'h11 : _GEN_58; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_62 = phase == 4'h6 ? 32'ha8304613 : _GEN_59; // @[md5.scala 176:27 179:23]
  wire  _T_43 = phase == 4'h7; // @[md5.scala 176:18]
  wire [31:0] _GEN_63 = phase == 4'h7 ? msg[255:224] : _GEN_60; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_64 = phase == 4'h7 ? 5'h16 : _GEN_61; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_65 = phase == 4'h7 ? 32'hfd469501 : _GEN_62; // @[md5.scala 176:27 179:23]
  wire  _T_44 = phase == 4'h8; // @[md5.scala 176:18]
  wire [31:0] _GEN_66 = phase == 4'h8 ? msg[287:256] : _GEN_63; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_67 = phase == 4'h8 ? 5'h7 : _GEN_64; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_68 = phase == 4'h8 ? 32'h698098d8 : _GEN_65; // @[md5.scala 176:27 179:23]
  wire  _T_45 = phase == 4'h9; // @[md5.scala 176:18]
  wire [31:0] _GEN_69 = phase == 4'h9 ? msg[319:288] : _GEN_66; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_70 = phase == 4'h9 ? 5'hc : _GEN_67; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_71 = phase == 4'h9 ? 32'h8b44f7af : _GEN_68; // @[md5.scala 176:27 179:23]
  wire  _T_46 = phase == 4'ha; // @[md5.scala 176:18]
  wire [31:0] _GEN_72 = phase == 4'ha ? msg[351:320] : _GEN_69; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_73 = phase == 4'ha ? 5'h11 : _GEN_70; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_74 = phase == 4'ha ? 32'hffff5bb1 : _GEN_71; // @[md5.scala 176:27 179:23]
  wire  _T_47 = phase == 4'hb; // @[md5.scala 176:18]
  wire [31:0] _GEN_75 = phase == 4'hb ? msg[383:352] : _GEN_72; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_76 = phase == 4'hb ? 5'h16 : _GEN_73; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_77 = phase == 4'hb ? 32'h895cd7be : _GEN_74; // @[md5.scala 176:27 179:23]
  wire  _T_48 = phase == 4'hc; // @[md5.scala 176:18]
  wire [31:0] _GEN_78 = phase == 4'hc ? msg[415:384] : _GEN_75; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_79 = phase == 4'hc ? 5'h7 : _GEN_76; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_80 = phase == 4'hc ? 32'h6b901122 : _GEN_77; // @[md5.scala 176:27 179:23]
  wire  _T_49 = phase == 4'hd; // @[md5.scala 176:18]
  wire [31:0] _GEN_81 = phase == 4'hd ? msg[447:416] : _GEN_78; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_82 = phase == 4'hd ? 5'hc : _GEN_79; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_83 = phase == 4'hd ? 32'hfd987193 : _GEN_80; // @[md5.scala 176:27 179:23]
  wire  _T_50 = phase == 4'he; // @[md5.scala 176:18]
  wire [31:0] _GEN_84 = phase == 4'he ? msg[479:448] : _GEN_81; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_85 = phase == 4'he ? 5'h11 : _GEN_82; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_86 = phase == 4'he ? 32'ha679438e : _GEN_83; // @[md5.scala 176:27 179:23]
  wire [31:0] _GEN_87 = _T_124 ? msg[511:480] : _GEN_84; // @[md5.scala 176:27 177:23]
  wire [4:0] _GEN_88 = _T_124 ? 5'h16 : _GEN_85; // @[md5.scala 176:27 178:23]
  wire [31:0] _GEN_89 = _T_124 ? 32'h49b40821 : _GEN_86; // @[md5.scala 176:27 179:23]
  wire [31:0] _GEN_96 = _T_29[0] ? cya : 32'h0; // @[md5.scala 153:19 169:19 59:17]
  wire [31:0] _GEN_97 = _T_29[0] ? cyb : 32'h0; // @[md5.scala 153:19 170:19 60:17]
  wire [31:0] _GEN_98 = _T_29[0] ? cyc : 32'h0; // @[md5.scala 153:19 171:19 61:17]
  wire [31:0] _GEN_99 = _T_29[0] ? cyd : 32'h0; // @[md5.scala 153:19 172:19 62:17]
  wire [31:0] _GEN_100 = _T_29[0] ? _GEN_87 : 32'h0; // @[md5.scala 153:19 63:17]
  wire [4:0] _GEN_101 = _T_29[0] ? _GEN_88 : 5'h0; // @[md5.scala 153:19 64:17]
  wire [31:0] _GEN_102 = _T_29[0] ? _GEN_89 : 32'h0; // @[md5.scala 153:19 65:17]
  wire [31:0] _GEN_114 = _T_36 ? msg[31:0] : _GEN_100; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_115 = _T_36 ? 5'h5 : _GEN_101; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_116 = _T_36 ? 32'hf61e2562 : _GEN_102; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_117 = _T_37 ? msg[287:256] : _GEN_114; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_118 = _T_37 ? 5'h9 : _GEN_115; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_119 = _T_37 ? 32'hc040b340 : _GEN_116; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_120 = _T_38 ? msg[63:32] : _GEN_117; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_121 = _T_38 ? 5'he : _GEN_118; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_122 = _T_38 ? 32'h265e5a51 : _GEN_119; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_123 = _T_39 ? msg[319:288] : _GEN_120; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_124 = _T_39 ? 5'h14 : _GEN_121; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_125 = _T_39 ? 32'he9b6c7aa : _GEN_122; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_126 = _T_40 ? msg[95:64] : _GEN_123; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_127 = _T_40 ? 5'h5 : _GEN_124; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_128 = _T_40 ? 32'hd62f105d : _GEN_125; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_129 = _T_41 ? msg[351:320] : _GEN_126; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_130 = _T_41 ? 5'h9 : _GEN_127; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_131 = _T_41 ? 32'h2441453 : _GEN_128; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_132 = _T_42 ? msg[127:96] : _GEN_129; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_133 = _T_42 ? 5'he : _GEN_130; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_134 = _T_42 ? 32'hd8a1e681 : _GEN_131; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_135 = _T_43 ? msg[383:352] : _GEN_132; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_136 = _T_43 ? 5'h14 : _GEN_133; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_137 = _T_43 ? 32'he7d3fbc8 : _GEN_134; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_138 = _T_44 ? msg[159:128] : _GEN_135; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_139 = _T_44 ? 5'h5 : _GEN_136; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_140 = _T_44 ? 32'h21e1cde6 : _GEN_137; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_141 = _T_45 ? msg[415:384] : _GEN_138; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_142 = _T_45 ? 5'h9 : _GEN_139; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_143 = _T_45 ? 32'hc33707d6 : _GEN_140; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_144 = _T_46 ? msg[191:160] : _GEN_141; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_145 = _T_46 ? 5'he : _GEN_142; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_146 = _T_46 ? 32'hf4d50d87 : _GEN_143; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_147 = _T_47 ? msg[447:416] : _GEN_144; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_148 = _T_47 ? 5'h14 : _GEN_145; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_149 = _T_47 ? 32'h455a14ed : _GEN_146; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_150 = _T_48 ? msg[223:192] : _GEN_147; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_151 = _T_48 ? 5'h5 : _GEN_148; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_152 = _T_48 ? 32'ha9e3e905 : _GEN_149; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_153 = _T_49 ? msg[479:448] : _GEN_150; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_154 = _T_49 ? 5'h9 : _GEN_151; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_155 = _T_49 ? 32'hfcefa3f8 : _GEN_152; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_156 = _T_50 ? msg[255:224] : _GEN_153; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_157 = _T_50 ? 5'he : _GEN_154; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_158 = _T_50 ? 32'h676f02d9 : _GEN_155; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_159 = _T_124 ? msg[511:480] : _GEN_156; // @[md5.scala 211:27 213:23]
  wire [4:0] _GEN_160 = _T_124 ? 5'h14 : _GEN_157; // @[md5.scala 211:27 214:23]
  wire [31:0] _GEN_161 = _T_124 ? 32'h8d2a4c8a : _GEN_158; // @[md5.scala 211:27 215:23]
  wire [31:0] _GEN_168 = _T_53[0] ? cya : _GEN_96; // @[md5.scala 188:19 204:19]
  wire [31:0] _GEN_169 = _T_53[0] ? cyb : _GEN_97; // @[md5.scala 188:19 205:19]
  wire [31:0] _GEN_170 = _T_53[0] ? cyc : _GEN_98; // @[md5.scala 188:19 206:19]
  wire [31:0] _GEN_171 = _T_53[0] ? cyd : _GEN_99; // @[md5.scala 188:19 207:19]
  wire [31:0] _GEN_172 = _T_53[0] ? _GEN_159 : _GEN_100; // @[md5.scala 188:19]
  wire [4:0] _GEN_173 = _T_53[0] ? _GEN_160 : _GEN_101; // @[md5.scala 188:19]
  wire [31:0] _GEN_174 = _T_53[0] ? _GEN_161 : _GEN_102; // @[md5.scala 188:19]
  wire [31:0] _GEN_186 = _T_36 ? msg[31:0] : _GEN_172; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_187 = _T_36 ? 5'h4 : _GEN_173; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_188 = _T_36 ? 32'hfffa3942 : _GEN_174; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_189 = _T_37 ? msg[159:128] : _GEN_186; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_190 = _T_37 ? 5'hb : _GEN_187; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_191 = _T_37 ? 32'h8771f681 : _GEN_188; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_192 = _T_38 ? msg[287:256] : _GEN_189; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_193 = _T_38 ? 5'h10 : _GEN_190; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_194 = _T_38 ? 32'h6d9d6122 : _GEN_191; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_195 = _T_39 ? msg[415:384] : _GEN_192; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_196 = _T_39 ? 5'h17 : _GEN_193; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_197 = _T_39 ? 32'hfde5380c : _GEN_194; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_198 = _T_40 ? msg[63:32] : _GEN_195; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_199 = _T_40 ? 5'h4 : _GEN_196; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_200 = _T_40 ? 32'ha4beea44 : _GEN_197; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_201 = _T_41 ? msg[191:160] : _GEN_198; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_202 = _T_41 ? 5'hb : _GEN_199; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_203 = _T_41 ? 32'h4bdecfa9 : _GEN_200; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_204 = _T_42 ? msg[319:288] : _GEN_201; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_205 = _T_42 ? 5'h10 : _GEN_202; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_206 = _T_42 ? 32'hf6bb4b60 : _GEN_203; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_207 = _T_43 ? msg[447:416] : _GEN_204; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_208 = _T_43 ? 5'h17 : _GEN_205; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_209 = _T_43 ? 32'hbebfbc70 : _GEN_206; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_210 = _T_44 ? msg[95:64] : _GEN_207; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_211 = _T_44 ? 5'h4 : _GEN_208; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_212 = _T_44 ? 32'h289b7ec6 : _GEN_209; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_213 = _T_45 ? msg[223:192] : _GEN_210; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_214 = _T_45 ? 5'hb : _GEN_211; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_215 = _T_45 ? 32'heaa127fa : _GEN_212; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_216 = _T_46 ? msg[351:320] : _GEN_213; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_217 = _T_46 ? 5'h10 : _GEN_214; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_218 = _T_46 ? 32'hd4ef3085 : _GEN_215; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_219 = _T_47 ? msg[479:448] : _GEN_216; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_220 = _T_47 ? 5'h17 : _GEN_217; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_221 = _T_47 ? 32'h4881d05 : _GEN_218; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_222 = _T_48 ? msg[127:96] : _GEN_219; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_223 = _T_48 ? 5'h4 : _GEN_220; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_224 = _T_48 ? 32'hd9d4d039 : _GEN_221; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_225 = _T_49 ? msg[255:224] : _GEN_222; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_226 = _T_49 ? 5'hb : _GEN_223; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_227 = _T_49 ? 32'he6db99e5 : _GEN_224; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_228 = _T_50 ? msg[383:352] : _GEN_225; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_229 = _T_50 ? 5'h10 : _GEN_226; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_230 = _T_50 ? 32'h1fa27cf8 : _GEN_227; // @[md5.scala 247:27 251:23]
  wire [31:0] _GEN_231 = _T_124 ? msg[511:480] : _GEN_228; // @[md5.scala 247:27 249:23]
  wire [4:0] _GEN_232 = _T_124 ? 5'h17 : _GEN_229; // @[md5.scala 247:27 250:23]
  wire [31:0] _GEN_233 = _T_124 ? 32'hc4ac5665 : _GEN_230; // @[md5.scala 247:27 251:23]
  wire [1:0] _GEN_235 = _T_77[0] ? 2'h2 : {{1'd0}, _T_53[0]}; // @[md5.scala 224:19 225:19]
  wire [31:0] _GEN_240 = _T_77[0] ? cya : _GEN_168; // @[md5.scala 224:19 240:19]
  wire [31:0] _GEN_241 = _T_77[0] ? cyb : _GEN_169; // @[md5.scala 224:19 241:19]
  wire [31:0] _GEN_242 = _T_77[0] ? cyc : _GEN_170; // @[md5.scala 224:19 242:19]
  wire [31:0] _GEN_243 = _T_77[0] ? cyd : _GEN_171; // @[md5.scala 224:19 243:19]
  wire [31:0] _GEN_244 = _T_77[0] ? _GEN_231 : _GEN_172; // @[md5.scala 224:19]
  wire [4:0] _GEN_245 = _T_77[0] ? _GEN_232 : _GEN_173; // @[md5.scala 224:19]
  wire [31:0] _GEN_246 = _T_77[0] ? _GEN_233 : _GEN_174; // @[md5.scala 224:19]
  wire [31:0] _GEN_258 = _T_36 ? msg[31:0] : _GEN_244; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_259 = _T_36 ? 5'h6 : _GEN_245; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_260 = _T_36 ? 32'hf4292244 : _GEN_246; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_261 = _T_37 ? msg[95:64] : _GEN_258; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_262 = _T_37 ? 5'ha : _GEN_259; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_263 = _T_37 ? 32'h432aff97 : _GEN_260; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_264 = _T_38 ? msg[159:128] : _GEN_261; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_265 = _T_38 ? 5'hf : _GEN_262; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_266 = _T_38 ? 32'hab9423a7 : _GEN_263; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_267 = _T_39 ? msg[223:192] : _GEN_264; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_268 = _T_39 ? 5'h15 : _GEN_265; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_269 = _T_39 ? 32'hfc93a039 : _GEN_266; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_270 = _T_40 ? msg[287:256] : _GEN_267; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_271 = _T_40 ? 5'h6 : _GEN_268; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_272 = _T_40 ? 32'h655b59c3 : _GEN_269; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_273 = _T_41 ? msg[351:320] : _GEN_270; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_274 = _T_41 ? 5'ha : _GEN_271; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_275 = _T_41 ? 32'h8f0ccc92 : _GEN_272; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_276 = _T_42 ? msg[415:384] : _GEN_273; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_277 = _T_42 ? 5'hf : _GEN_274; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_278 = _T_42 ? 32'hffeff47d : _GEN_275; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_279 = _T_43 ? msg[479:448] : _GEN_276; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_280 = _T_43 ? 5'h15 : _GEN_277; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_281 = _T_43 ? 32'h85845dd1 : _GEN_278; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_282 = _T_44 ? msg[63:32] : _GEN_279; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_283 = _T_44 ? 5'h6 : _GEN_280; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_284 = _T_44 ? 32'h6fa87e4f : _GEN_281; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_285 = _T_45 ? msg[127:96] : _GEN_282; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_286 = _T_45 ? 5'ha : _GEN_283; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_287 = _T_45 ? 32'hfe2ce6e0 : _GEN_284; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_288 = _T_46 ? msg[191:160] : _GEN_285; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_289 = _T_46 ? 5'hf : _GEN_286; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_290 = _T_46 ? 32'ha3014314 : _GEN_287; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_291 = _T_47 ? msg[255:224] : _GEN_288; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_292 = _T_47 ? 5'h15 : _GEN_289; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_293 = _T_47 ? 32'h4e0811a1 : _GEN_290; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_294 = _T_48 ? msg[319:288] : _GEN_291; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_295 = _T_48 ? 5'h6 : _GEN_292; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_296 = _T_48 ? 32'hf7537e82 : _GEN_293; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_297 = _T_49 ? msg[383:352] : _GEN_294; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_298 = _T_49 ? 5'ha : _GEN_295; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_299 = _T_49 ? 32'hbd3af235 : _GEN_296; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_300 = _T_50 ? msg[447:416] : _GEN_297; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_301 = _T_50 ? 5'hf : _GEN_298; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_302 = _T_50 ? 32'h2ad7d2bb : _GEN_299; // @[md5.scala 282:27 286:23]
  wire [31:0] _GEN_303 = _T_124 ? msg[511:480] : _GEN_300; // @[md5.scala 282:27 284:23]
  wire [4:0] _GEN_304 = _T_124 ? 5'h15 : _GEN_301; // @[md5.scala 282:27 285:23]
  wire [31:0] _GEN_305 = _T_124 ? 32'heb86d391 : _GEN_302; // @[md5.scala 282:27 286:23]
  md5round md5Round ( // @[md5.scala 38:24]
    .io_a(md5Round_io_a),
    .io_b(md5Round_io_b),
    .io_c(md5Round_io_c),
    .io_d(md5Round_io_d),
    .io_m(md5Round_io_m),
    .io_s(md5Round_io_s),
    .io_t(md5Round_io_t),
    .io_r(md5Round_io_r),
    .io_next_a(md5Round_io_next_a)
  );
  assign io_out = {_io_out_T_1,D}; // @[md5.scala 56:25]
  assign io_out_valid = out_r; // @[md5.scala 54:16]
  assign io_ready = state[0]; // @[md5.scala 55:20]
  assign md5Round_io_a = _T_101[0] ? cya : _GEN_240; // @[md5.scala 259:19 275:19]
  assign md5Round_io_b = _T_101[0] ? cyb : _GEN_241; // @[md5.scala 259:19 276:19]
  assign md5Round_io_c = _T_101[0] ? cyc : _GEN_242; // @[md5.scala 259:19 277:19]
  assign md5Round_io_d = _T_101[0] ? cyd : _GEN_243; // @[md5.scala 259:19 278:19]
  assign md5Round_io_m = _T_101[0] ? _GEN_303 : _GEN_244; // @[md5.scala 259:19]
  assign md5Round_io_s = _T_101[0] ? _GEN_304 : _GEN_245; // @[md5.scala 259:19]
  assign md5Round_io_t = _T_101[0] ? _GEN_305 : _GEN_246; // @[md5.scala 259:19]
  assign md5Round_io_r = _T_101[0] ? 2'h3 : _GEN_235; // @[md5.scala 259:19 260:19]
  always @(posedge clock) begin
    if (reset) begin // @[md5.scala 19:18]
      A <= 32'h67452301; // @[md5.scala 19:18]
    end else if (next_state[0]) begin // @[md5.scala 89:26]
      A <= 32'h67452301; // @[md5.scala 90:7]
    end else if (_out_r_T[0]) begin // @[md5.scala 296:25]
      A <= _Anext_T_1; // @[md5.scala 300:11]
    end else if (_T_101[0]) begin // @[md5.scala 259:19]
      A <= _GEN_254;
    end else begin
      A <= _GEN_236;
    end
    if (reset) begin // @[md5.scala 20:18]
      B <= 32'hefcdab89; // @[md5.scala 20:18]
    end else if (next_state[0]) begin // @[md5.scala 89:26]
      B <= 32'hefcdab89; // @[md5.scala 91:7]
    end else if (_out_r_T[0]) begin // @[md5.scala 296:25]
      B <= _Bnext_T_1; // @[md5.scala 301:11]
    end else if (_T_101[0]) begin // @[md5.scala 259:19]
      B <= _GEN_257;
    end else begin
      B <= _GEN_239;
    end
    if (reset) begin // @[md5.scala 21:18]
      C <= 32'h98badcfe; // @[md5.scala 21:18]
    end else if (next_state[0]) begin // @[md5.scala 89:26]
      C <= 32'h98badcfe; // @[md5.scala 92:7]
    end else if (_out_r_T[0]) begin // @[md5.scala 296:25]
      C <= _Cnext_T_1; // @[md5.scala 302:11]
    end else if (_T_101[0]) begin // @[md5.scala 259:19]
      C <= _GEN_256;
    end else begin
      C <= _GEN_238;
    end
    if (reset) begin // @[md5.scala 22:18]
      D <= 32'h10325476; // @[md5.scala 22:18]
    end else if (next_state[0]) begin // @[md5.scala 89:26]
      D <= 32'h10325476; // @[md5.scala 93:7]
    end else if (_out_r_T[0]) begin // @[md5.scala 296:25]
      D <= _Dnext_T_1; // @[md5.scala 303:11]
    end else if (_T_101[0]) begin // @[md5.scala 259:19]
      D <= _GEN_255;
    end else begin
      D <= _GEN_237;
    end
    if (reset) begin // @[md5.scala 23:19]
      AA <= 32'h0; // @[md5.scala 23:19]
    end else if (next_state[0]) begin // @[md5.scala 75:26]
      AA <= 32'h0; // @[md5.scala 76:8]
    end else if (_T_2[0] & state[0]) begin // @[md5.scala 80:45]
      AA <= A; // @[md5.scala 81:8]
    end
    if (reset) begin // @[md5.scala 24:19]
      BB <= 32'h0; // @[md5.scala 24:19]
    end else if (next_state[0]) begin // @[md5.scala 75:26]
      BB <= 32'h0; // @[md5.scala 77:8]
    end else if (_T_2[0] & state[0]) begin // @[md5.scala 80:45]
      BB <= B; // @[md5.scala 82:8]
    end
    if (reset) begin // @[md5.scala 25:19]
      CC <= 32'h0; // @[md5.scala 25:19]
    end else if (next_state[0]) begin // @[md5.scala 75:26]
      CC <= 32'h0; // @[md5.scala 78:8]
    end else if (_T_2[0] & state[0]) begin // @[md5.scala 80:45]
      CC <= C; // @[md5.scala 83:8]
    end
    if (reset) begin // @[md5.scala 26:19]
      DD <= 32'h0; // @[md5.scala 26:19]
    end else if (next_state[0]) begin // @[md5.scala 75:26]
      DD <= 32'h0; // @[md5.scala 79:8]
    end else if (_T_2[0] & state[0]) begin // @[md5.scala 80:45]
      DD <= D; // @[md5.scala 84:8]
    end
    if (reset) begin // @[md5.scala 31:22]
      phase <= 4'h0; // @[md5.scala 31:22]
    end else if (_T_6) begin // @[md5.scala 103:39]
      phase <= 4'h0; // @[md5.scala 104:11]
    end else begin
      phase <= _phase_T_1; // @[md5.scala 106:11]
    end
    if (reset) begin // @[md5.scala 32:22]
      state <= 8'h1; // @[md5.scala 32:22]
    end else if (_T_129[0]) begin // @[md5.scala 307:26]
      state <= 8'h1; // @[md5.scala 309:16]
    end else if (_out_r_T[0]) begin // @[md5.scala 296:25]
      state <= 8'h40; // @[md5.scala 304:16]
    end else if (_T_101[0]) begin // @[md5.scala 259:19]
      state <= _GEN_306;
    end else begin
      state <= _GEN_247;
    end
    if (reset) begin // @[md5.scala 34:20]
      msg <= 512'h0; // @[md5.scala 34:20]
    end else if (next_state[0]) begin // @[md5.scala 109:26]
      msg <= 512'h0; // @[md5.scala 110:9]
    end else if (_T_6) begin // @[md5.scala 111:45]
      msg <= _msg_T; // @[md5.scala 113:9]
    end
    if (reset) begin // @[md5.scala 35:22]
      out_r <= 1'h0; // @[md5.scala 35:22]
    end else begin
      out_r <= _out_r_T[0]; // @[md5.scala 53:9]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_out_r_T[0] & ~reset) begin
          $fwrite(32'h80000002,"finished\n"); // @[md5.scala 297:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  A = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  C = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  D = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  AA = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  BB = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  CC = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  DD = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  phase = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  state = _RAND_9[7:0];
  _RAND_10 = {16{`RANDOM}};
  msg = _RAND_10[511:0];
  _RAND_11 = {1{`RANDOM}};
  out_r = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
