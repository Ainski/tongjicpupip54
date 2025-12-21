// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Sun Dec 21 23:32:24 2025
// Host        : Nicolas-ainski running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/Homeworks/cpu31real/cpupip31real/cpupip31real.srcs/sources_1/ip/imem/imem_sim_netlist.v
// Design      : imem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "imem,dist_mem_gen_v8_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_10,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module imem
   (a,
    spo);
  input [10:0]a;
  output [31:0]spo;

  wire [10:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* c_addr_width = "11" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "2048" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "imem.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  imem_dist_mem_gen_v8_0_10 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule

(* C_ADDR_WIDTH = "11" *) (* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "2048" *) 
(* C_ELABORATION_DIR = "./" *) (* C_FAMILY = "artix7" *) (* C_HAS_CLK = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "0" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "0" *) 
(* C_MEM_INIT_FILE = "imem.mif" *) (* C_MEM_TYPE = "0" *) (* C_PARSER_TYPE = "1" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "1" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "32" *) (* ORIG_REF_NAME = "dist_mem_gen_v8_0_10" *) 
module imem_dist_mem_gen_v8_0_10
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [10:0]a;
  input [31:0]d;
  input [10:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [31:0]spo;
  output [31:0]dpo;
  output [31:0]qspo;
  output [31:0]qdpo;

  wire \<const0> ;
  wire [10:0]a;
  wire [31:0]spo;

  assign dpo[31] = \<const0> ;
  assign dpo[30] = \<const0> ;
  assign dpo[29] = \<const0> ;
  assign dpo[28] = \<const0> ;
  assign dpo[27] = \<const0> ;
  assign dpo[26] = \<const0> ;
  assign dpo[25] = \<const0> ;
  assign dpo[24] = \<const0> ;
  assign dpo[23] = \<const0> ;
  assign dpo[22] = \<const0> ;
  assign dpo[21] = \<const0> ;
  assign dpo[20] = \<const0> ;
  assign dpo[19] = \<const0> ;
  assign dpo[18] = \<const0> ;
  assign dpo[17] = \<const0> ;
  assign dpo[16] = \<const0> ;
  assign dpo[15] = \<const0> ;
  assign dpo[14] = \<const0> ;
  assign dpo[13] = \<const0> ;
  assign dpo[12] = \<const0> ;
  assign dpo[11] = \<const0> ;
  assign dpo[10] = \<const0> ;
  assign dpo[9] = \<const0> ;
  assign dpo[8] = \<const0> ;
  assign dpo[7] = \<const0> ;
  assign dpo[6] = \<const0> ;
  assign dpo[5] = \<const0> ;
  assign dpo[4] = \<const0> ;
  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qdpo[31] = \<const0> ;
  assign qdpo[30] = \<const0> ;
  assign qdpo[29] = \<const0> ;
  assign qdpo[28] = \<const0> ;
  assign qdpo[27] = \<const0> ;
  assign qdpo[26] = \<const0> ;
  assign qdpo[25] = \<const0> ;
  assign qdpo[24] = \<const0> ;
  assign qdpo[23] = \<const0> ;
  assign qdpo[22] = \<const0> ;
  assign qdpo[21] = \<const0> ;
  assign qdpo[20] = \<const0> ;
  assign qdpo[19] = \<const0> ;
  assign qdpo[18] = \<const0> ;
  assign qdpo[17] = \<const0> ;
  assign qdpo[16] = \<const0> ;
  assign qdpo[15] = \<const0> ;
  assign qdpo[14] = \<const0> ;
  assign qdpo[13] = \<const0> ;
  assign qdpo[12] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[31] = \<const0> ;
  assign qspo[30] = \<const0> ;
  assign qspo[29] = \<const0> ;
  assign qspo[28] = \<const0> ;
  assign qspo[27] = \<const0> ;
  assign qspo[26] = \<const0> ;
  assign qspo[25] = \<const0> ;
  assign qspo[24] = \<const0> ;
  assign qspo[23] = \<const0> ;
  assign qspo[22] = \<const0> ;
  assign qspo[21] = \<const0> ;
  assign qspo[20] = \<const0> ;
  assign qspo[19] = \<const0> ;
  assign qspo[18] = \<const0> ;
  assign qspo[17] = \<const0> ;
  assign qspo[16] = \<const0> ;
  assign qspo[15] = \<const0> ;
  assign qspo[14] = \<const0> ;
  assign qspo[13] = \<const0> ;
  assign qspo[12] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  imem_dist_mem_gen_v8_0_10_synth \synth_options.dist_mem_inst 
       (.a(a),
        .spo(spo));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_10_synth" *) 
module imem_dist_mem_gen_v8_0_10_synth
   (spo,
    a);
  output [31:0]spo;
  input [10:0]a;

  wire [10:0]a;
  wire [31:0]spo;

  imem_rom \gen_rom.rom_inst 
       (.a(a),
        .spo(spo));
endmodule

(* ORIG_REF_NAME = "rom" *) 
module imem_rom
   (spo,
    a);
  output [31:0]spo;
  input [10:0]a;

  wire [10:0]a;
  wire [31:0]spo;
  wire \spo[0]_INST_0_i_1_n_0 ;
  wire \spo[0]_INST_0_i_2_n_0 ;
  wire \spo[0]_INST_0_i_3_n_0 ;
  wire \spo[0]_INST_0_i_4_n_0 ;
  wire \spo[0]_INST_0_i_5_n_0 ;
  wire \spo[0]_INST_0_i_6_n_0 ;
  wire \spo[10]_INST_0_i_1_n_0 ;
  wire \spo[11]_INST_0_i_1_n_0 ;
  wire \spo[11]_INST_0_i_2_n_0 ;
  wire \spo[11]_INST_0_i_3_n_0 ;
  wire \spo[12]_INST_0_i_1_n_0 ;
  wire \spo[12]_INST_0_i_2_n_0 ;
  wire \spo[12]_INST_0_i_3_n_0 ;
  wire \spo[12]_INST_0_i_4_n_0 ;
  wire \spo[12]_INST_0_i_5_n_0 ;
  wire \spo[12]_INST_0_i_6_n_0 ;
  wire \spo[13]_INST_0_i_1_n_0 ;
  wire \spo[13]_INST_0_i_2_n_0 ;
  wire \spo[13]_INST_0_i_3_n_0 ;
  wire \spo[14]_INST_0_i_1_n_0 ;
  wire \spo[14]_INST_0_i_2_n_0 ;
  wire \spo[14]_INST_0_i_3_n_0 ;
  wire \spo[15]_INST_0_i_1_n_0 ;
  wire \spo[16]_INST_0_i_1_n_0 ;
  wire \spo[16]_INST_0_i_2_n_0 ;
  wire \spo[16]_INST_0_i_3_n_0 ;
  wire \spo[16]_INST_0_i_4_n_0 ;
  wire \spo[16]_INST_0_i_5_n_0 ;
  wire \spo[16]_INST_0_i_6_n_0 ;
  wire \spo[17]_INST_0_i_1_n_0 ;
  wire \spo[17]_INST_0_i_2_n_0 ;
  wire \spo[17]_INST_0_i_3_n_0 ;
  wire \spo[17]_INST_0_i_4_n_0 ;
  wire \spo[17]_INST_0_i_5_n_0 ;
  wire \spo[17]_INST_0_i_6_n_0 ;
  wire \spo[18]_INST_0_i_1_n_0 ;
  wire \spo[18]_INST_0_i_2_n_0 ;
  wire \spo[18]_INST_0_i_3_n_0 ;
  wire \spo[18]_INST_0_i_4_n_0 ;
  wire \spo[18]_INST_0_i_5_n_0 ;
  wire \spo[18]_INST_0_i_6_n_0 ;
  wire \spo[19]_INST_0_i_1_n_0 ;
  wire \spo[19]_INST_0_i_2_n_0 ;
  wire \spo[19]_INST_0_i_3_n_0 ;
  wire \spo[19]_INST_0_i_4_n_0 ;
  wire \spo[19]_INST_0_i_5_n_0 ;
  wire \spo[19]_INST_0_i_6_n_0 ;
  wire \spo[1]_INST_0_i_1_n_0 ;
  wire \spo[1]_INST_0_i_2_n_0 ;
  wire \spo[1]_INST_0_i_3_n_0 ;
  wire \spo[1]_INST_0_i_4_n_0 ;
  wire \spo[20]_INST_0_i_1_n_0 ;
  wire \spo[20]_INST_0_i_2_n_0 ;
  wire \spo[20]_INST_0_i_3_n_0 ;
  wire \spo[20]_INST_0_i_4_n_0 ;
  wire \spo[20]_INST_0_i_5_n_0 ;
  wire \spo[20]_INST_0_i_6_n_0 ;
  wire \spo[21]_INST_0_i_1_n_0 ;
  wire \spo[21]_INST_0_i_2_n_0 ;
  wire \spo[21]_INST_0_i_3_n_0 ;
  wire \spo[21]_INST_0_i_4_n_0 ;
  wire \spo[21]_INST_0_i_5_n_0 ;
  wire \spo[21]_INST_0_i_6_n_0 ;
  wire \spo[22]_INST_0_i_1_n_0 ;
  wire \spo[22]_INST_0_i_2_n_0 ;
  wire \spo[23]_INST_0_i_1_n_0 ;
  wire \spo[23]_INST_0_i_2_n_0 ;
  wire \spo[24]_INST_0_i_1_n_0 ;
  wire \spo[24]_INST_0_i_2_n_0 ;
  wire \spo[24]_INST_0_i_3_n_0 ;
  wire \spo[25]_INST_0_i_1_n_0 ;
  wire \spo[25]_INST_0_i_2_n_0 ;
  wire \spo[25]_INST_0_i_3_n_0 ;
  wire \spo[26]_INST_0_i_1_n_0 ;
  wire \spo[26]_INST_0_i_2_n_0 ;
  wire \spo[27]_INST_0_i_1_n_0 ;
  wire \spo[27]_INST_0_i_2_n_0 ;
  wire \spo[27]_INST_0_i_3_n_0 ;
  wire \spo[28]_INST_0_i_1_n_0 ;
  wire \spo[28]_INST_0_i_2_n_0 ;
  wire \spo[28]_INST_0_i_3_n_0 ;
  wire \spo[28]_INST_0_i_4_n_0 ;
  wire \spo[29]_INST_0_i_1_n_0 ;
  wire \spo[29]_INST_0_i_2_n_0 ;
  wire \spo[29]_INST_0_i_3_n_0 ;
  wire \spo[29]_INST_0_i_4_n_0 ;
  wire \spo[29]_INST_0_i_5_n_0 ;
  wire \spo[29]_INST_0_i_6_n_0 ;
  wire \spo[2]_INST_0_i_1_n_0 ;
  wire \spo[2]_INST_0_i_2_n_0 ;
  wire \spo[2]_INST_0_i_3_n_0 ;
  wire \spo[2]_INST_0_i_4_n_0 ;
  wire \spo[30]_INST_0_i_1_n_0 ;
  wire \spo[30]_INST_0_i_2_n_0 ;
  wire \spo[30]_INST_0_i_3_n_0 ;
  wire \spo[30]_INST_0_i_4_n_0 ;
  wire \spo[30]_INST_0_i_5_n_0 ;
  wire \spo[31]_INST_0_i_1_n_0 ;
  wire \spo[31]_INST_0_i_2_n_0 ;
  wire \spo[31]_INST_0_i_3_n_0 ;
  wire \spo[31]_INST_0_i_4_n_0 ;
  wire \spo[3]_INST_0_i_1_n_0 ;
  wire \spo[3]_INST_0_i_2_n_0 ;
  wire \spo[4]_INST_0_i_1_n_0 ;
  wire \spo[4]_INST_0_i_2_n_0 ;
  wire \spo[5]_INST_0_i_1_n_0 ;
  wire \spo[5]_INST_0_i_2_n_0 ;
  wire \spo[5]_INST_0_i_3_n_0 ;
  wire \spo[5]_INST_0_i_4_n_0 ;
  wire \spo[5]_INST_0_i_5_n_0 ;
  wire \spo[5]_INST_0_i_6_n_0 ;
  wire \spo[6]_INST_0_i_1_n_0 ;
  wire \spo[6]_INST_0_i_2_n_0 ;
  wire \spo[7]_INST_0_i_1_n_0 ;
  wire \spo[7]_INST_0_i_2_n_0 ;
  wire \spo[7]_INST_0_i_3_n_0 ;
  wire \spo[9]_INST_0_i_1_n_0 ;
  wire \spo[9]_INST_0_i_2_n_0 ;

  MUXF8 \spo[0]_INST_0 
       (.I0(\spo[0]_INST_0_i_1_n_0 ),
        .I1(\spo[0]_INST_0_i_2_n_0 ),
        .O(spo[0]),
        .S(a[5]));
  MUXF7 \spo[0]_INST_0_i_1 
       (.I0(\spo[0]_INST_0_i_3_n_0 ),
        .I1(\spo[0]_INST_0_i_4_n_0 ),
        .O(\spo[0]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[0]_INST_0_i_2 
       (.I0(\spo[0]_INST_0_i_5_n_0 ),
        .I1(\spo[0]_INST_0_i_6_n_0 ),
        .O(\spo[0]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h5762000096A90000)) 
    \spo[0]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[6]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h74004F0048008800)) 
    \spo[0]_INST_0_i_4 
       (.I0(a[3]),
        .I1(a[4]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[1]),
        .O(\spo[0]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0700040008000000)) 
    \spo[0]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[0]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0040000000BF0000)) 
    \spo[0]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(a[6]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[0]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020008000)) 
    \spo[10]_INST_0 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(\spo[10]_INST_0_i_1_n_0 ),
        .I3(a[3]),
        .I4(a[2]),
        .I5(a[5]),
        .O(spo[10]));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \spo[10]_INST_0_i_1 
       (.I0(a[0]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[10]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[11]_INST_0 
       (.I0(\spo[11]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[11]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[11]_INST_0_i_3_n_0 ),
        .O(spo[11]));
  LUT6 #(
    .INIT(64'h9877100030AA3000)) 
    \spo[11]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[4]),
        .I2(\spo[28]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(\spo[30]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[11]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h70000A0060008800)) 
    \spo[11]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[11]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h178000000A200000)) 
    \spo[11]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[11]_INST_0_i_3_n_0 ));
  MUXF8 \spo[12]_INST_0 
       (.I0(\spo[12]_INST_0_i_1_n_0 ),
        .I1(\spo[12]_INST_0_i_2_n_0 ),
        .O(spo[12]),
        .S(a[5]));
  MUXF7 \spo[12]_INST_0_i_1 
       (.I0(\spo[12]_INST_0_i_3_n_0 ),
        .I1(\spo[12]_INST_0_i_4_n_0 ),
        .O(\spo[12]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[12]_INST_0_i_2 
       (.I0(\spo[12]_INST_0_i_5_n_0 ),
        .I1(\spo[12]_INST_0_i_6_n_0 ),
        .O(\spo[12]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h0196000002200000)) 
    \spo[12]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[12]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5200220068008800)) 
    \spo[12]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[12]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000004D500000)) 
    \spo[12]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[12]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2000000010000030)) 
    \spo[12]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[6]),
        .I2(\spo[31]_INST_0_i_4_n_0 ),
        .I3(a[0]),
        .I4(a[1]),
        .I5(a[3]),
        .O(\spo[12]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \spo[13]_INST_0 
       (.I0(\spo[13]_INST_0_i_1_n_0 ),
        .I1(a[2]),
        .I2(\spo[13]_INST_0_i_2_n_0 ),
        .I3(a[5]),
        .I4(\spo[13]_INST_0_i_3_n_0 ),
        .O(spo[13]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8040)) 
    \spo[13]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(\spo[30]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .O(\spo[13]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000040404)) 
    \spo[13]_INST_0_i_2 
       (.I0(a[1]),
        .I1(\spo[31]_INST_0_i_4_n_0 ),
        .I2(a[6]),
        .I3(a[3]),
        .I4(a[0]),
        .I5(a[4]),
        .O(\spo[13]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3000C00000008080)) 
    \spo[13]_INST_0_i_3 
       (.I0(\spo[30]_INST_0_i_5_n_0 ),
        .I1(a[2]),
        .I2(a[3]),
        .I3(\spo[10]_INST_0_i_1_n_0 ),
        .I4(a[1]),
        .I5(a[4]),
        .O(\spo[13]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[14]_INST_0 
       (.I0(\spo[14]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[14]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[14]_INST_0_i_3_n_0 ),
        .O(spo[14]));
  LUT6 #(
    .INIT(64'h9710010187000000)) 
    \spo[14]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[4]),
        .I2(a[3]),
        .I3(\spo[30]_INST_0_i_4_n_0 ),
        .I4(a[1]),
        .I5(\spo[28]_INST_0_i_4_n_0 ),
        .O(\spo[14]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5000020060008800)) 
    \spo[14]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[14]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0800000010002000)) 
    \spo[14]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[14]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \spo[15]_INST_0 
       (.I0(\spo[25]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[24]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[15]_INST_0_i_1_n_0 ),
        .O(spo[15]));
  LUT6 #(
    .INIT(64'h0800000090002000)) 
    \spo[15]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[15]_INST_0_i_1_n_0 ));
  MUXF8 \spo[16]_INST_0 
       (.I0(\spo[16]_INST_0_i_1_n_0 ),
        .I1(\spo[16]_INST_0_i_2_n_0 ),
        .O(spo[16]),
        .S(a[5]));
  MUXF7 \spo[16]_INST_0_i_1 
       (.I0(\spo[16]_INST_0_i_3_n_0 ),
        .I1(\spo[16]_INST_0_i_4_n_0 ),
        .O(\spo[16]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[16]_INST_0_i_2 
       (.I0(\spo[16]_INST_0_i_5_n_0 ),
        .I1(\spo[16]_INST_0_i_6_n_0 ),
        .O(\spo[16]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h2DFF0000E7A20000)) 
    \spo[16]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[0]),
        .I2(a[1]),
        .I3(a[3]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[16]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h767B0000AE900000)) 
    \spo[16]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[16]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000074750000)) 
    \spo[16]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[16]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00CA000000FF0000)) 
    \spo[16]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(a[6]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[16]_INST_0_i_6_n_0 ));
  MUXF8 \spo[17]_INST_0 
       (.I0(\spo[17]_INST_0_i_1_n_0 ),
        .I1(\spo[17]_INST_0_i_2_n_0 ),
        .O(spo[17]),
        .S(a[5]));
  MUXF7 \spo[17]_INST_0_i_1 
       (.I0(\spo[17]_INST_0_i_3_n_0 ),
        .I1(\spo[17]_INST_0_i_4_n_0 ),
        .O(\spo[17]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[17]_INST_0_i_2 
       (.I0(\spo[17]_INST_0_i_5_n_0 ),
        .I1(\spo[17]_INST_0_i_6_n_0 ),
        .O(\spo[17]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h36A10000E8CA0000)) 
    \spo[17]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[17]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h25C700005BD60000)) 
    \spo[17]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[6]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[17]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0800030004000600)) 
    \spo[17]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[17]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AF7C0000)) 
    \spo[17]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[17]_INST_0_i_6_n_0 ));
  MUXF8 \spo[18]_INST_0 
       (.I0(\spo[18]_INST_0_i_1_n_0 ),
        .I1(\spo[18]_INST_0_i_2_n_0 ),
        .O(spo[18]),
        .S(a[5]));
  MUXF7 \spo[18]_INST_0_i_1 
       (.I0(\spo[18]_INST_0_i_3_n_0 ),
        .I1(\spo[18]_INST_0_i_4_n_0 ),
        .O(\spo[18]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[18]_INST_0_i_2 
       (.I0(\spo[18]_INST_0_i_5_n_0 ),
        .I1(\spo[18]_INST_0_i_6_n_0 ),
        .O(\spo[18]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h24002C0094000400)) 
    \spo[18]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[18]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5079000054000000)) 
    \spo[18]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[18]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000034150000)) 
    \spo[18]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[18]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h008F000000400000)) 
    \spo[18]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[0]),
        .I2(a[3]),
        .I3(a[6]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[18]_INST_0_i_6_n_0 ));
  MUXF8 \spo[19]_INST_0 
       (.I0(\spo[19]_INST_0_i_1_n_0 ),
        .I1(\spo[19]_INST_0_i_2_n_0 ),
        .O(spo[19]),
        .S(a[5]));
  MUXF7 \spo[19]_INST_0_i_1 
       (.I0(\spo[19]_INST_0_i_3_n_0 ),
        .I1(\spo[19]_INST_0_i_4_n_0 ),
        .O(\spo[19]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[19]_INST_0_i_2 
       (.I0(\spo[19]_INST_0_i_5_n_0 ),
        .I1(\spo[19]_INST_0_i_6_n_0 ),
        .O(\spo[19]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h16A10000A08E0000)) 
    \spo[19]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[19]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0867000052D00000)) 
    \spo[19]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[19]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000085360000)) 
    \spo[19]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[19]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000004F700000)) 
    \spo[19]_INST_0_i_6 
       (.I0(a[1]),
        .I1(a[4]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[19]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[1]_INST_0 
       (.I0(\spo[24]_INST_0_i_1_n_0 ),
        .I1(\spo[1]_INST_0_i_1_n_0 ),
        .I2(a[5]),
        .I3(\spo[1]_INST_0_i_2_n_0 ),
        .I4(a[2]),
        .I5(\spo[1]_INST_0_i_3_n_0 ),
        .O(spo[1]));
  LUT3 #(
    .INIT(8'h04)) 
    \spo[1]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[28]_INST_0_i_4_n_0 ),
        .I2(a[3]),
        .O(\spo[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000040050008000)) 
    \spo[1]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[1]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00008040)) 
    \spo[1]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(\spo[1]_INST_0_i_4_n_0 ),
        .I3(a[6]),
        .I4(a[3]),
        .O(\spo[1]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \spo[1]_INST_0_i_4 
       (.I0(a[10]),
        .I1(a[8]),
        .I2(a[9]),
        .I3(a[7]),
        .I4(a[0]),
        .O(\spo[1]_INST_0_i_4_n_0 ));
  MUXF8 \spo[20]_INST_0 
       (.I0(\spo[20]_INST_0_i_1_n_0 ),
        .I1(\spo[20]_INST_0_i_2_n_0 ),
        .O(spo[20]),
        .S(a[5]));
  MUXF7 \spo[20]_INST_0_i_1 
       (.I0(\spo[20]_INST_0_i_3_n_0 ),
        .I1(\spo[20]_INST_0_i_4_n_0 ),
        .O(\spo[20]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[20]_INST_0_i_2 
       (.I0(\spo[20]_INST_0_i_5_n_0 ),
        .I1(\spo[20]_INST_0_i_6_n_0 ),
        .O(\spo[20]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h6748000060A70000)) 
    \spo[20]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[6]),
        .I2(a[3]),
        .I3(a[1]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[20]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h240058000200A000)) 
    \spo[20]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[20]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000003000C000800)) 
    \spo[20]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[20]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000000B000C00)) 
    \spo[20]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[20]_INST_0_i_6_n_0 ));
  MUXF8 \spo[21]_INST_0 
       (.I0(\spo[21]_INST_0_i_1_n_0 ),
        .I1(\spo[21]_INST_0_i_2_n_0 ),
        .O(spo[21]),
        .S(a[5]));
  MUXF7 \spo[21]_INST_0_i_1 
       (.I0(\spo[21]_INST_0_i_3_n_0 ),
        .I1(\spo[21]_INST_0_i_4_n_0 ),
        .O(\spo[21]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[21]_INST_0_i_2 
       (.I0(\spo[21]_INST_0_i_5_n_0 ),
        .I1(\spo[21]_INST_0_i_6_n_0 ),
        .O(\spo[21]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h3FE800002AA00000)) 
    \spo[21]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[21]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h703900008A0A0000)) 
    \spo[21]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[0]),
        .I3(a[1]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[21]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0B00040000000E00)) 
    \spo[21]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[21]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000007740000)) 
    \spo[21]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[21]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[22]_INST_0 
       (.I0(\spo[22]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[22]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[24]_INST_0_i_3_n_0 ),
        .O(spo[22]));
  LUT6 #(
    .INIT(64'hB5A0CDCD15000000)) 
    \spo[22]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(a[4]),
        .I3(\spo[28]_INST_0_i_4_n_0 ),
        .I4(a[3]),
        .I5(\spo[30]_INST_0_i_4_n_0 ),
        .O(\spo[22]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1F20000000600000)) 
    \spo[22]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[1]),
        .I2(a[4]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[22]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[23]_INST_0 
       (.I0(\spo[23]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[30]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[23]_INST_0_i_2_n_0 ),
        .O(spo[23]));
  LUT6 #(
    .INIT(64'hECAA200050115000)) 
    \spo[23]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[4]),
        .I2(\spo[28]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(\spo[30]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[23]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6020800000000000)) 
    \spo[23]_INST_0_i_2 
       (.I0(a[1]),
        .I1(a[0]),
        .I2(\spo[31]_INST_0_i_4_n_0 ),
        .I3(a[6]),
        .I4(a[3]),
        .I5(a[4]),
        .O(\spo[23]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \spo[24]_INST_0 
       (.I0(\spo[24]_INST_0_i_1_n_0 ),
        .I1(\spo[25]_INST_0_i_1_n_0 ),
        .I2(a[5]),
        .I3(\spo[24]_INST_0_i_2_n_0 ),
        .I4(a[2]),
        .I5(\spo[24]_INST_0_i_3_n_0 ),
        .O(spo[24]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2040)) 
    \spo[24]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(\spo[30]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .O(\spo[24]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4720000000280000)) 
    \spo[24]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[24]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000080090002000)) 
    \spo[24]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[24]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \spo[25]_INST_0 
       (.I0(\spo[25]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[25]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[25]_INST_0_i_3_n_0 ),
        .O(spo[25]));
  LUT6 #(
    .INIT(64'h0300040000000000)) 
    \spo[25]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[25]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000040040008800)) 
    \spo[25]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[4]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[25]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000080010002000)) 
    \spo[25]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[25]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[26]_INST_0 
       (.I0(\spo[26]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[27]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[26]_INST_0_i_2_n_0 ),
        .O(spo[26]));
  LUT6 #(
    .INIT(64'h10FF1000B0EEB000)) 
    \spo[26]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[4]),
        .I2(\spo[30]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(\spo[28]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[26]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h40FF0000C0300000)) 
    \spo[26]_INST_0_i_2 
       (.I0(a[1]),
        .I1(a[3]),
        .I2(a[4]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[26]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[27]_INST_0 
       (.I0(\spo[27]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[27]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[27]_INST_0_i_3_n_0 ),
        .O(spo[27]));
  LUT6 #(
    .INIT(64'h74FF300070CC7000)) 
    \spo[27]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[2]),
        .I2(\spo[30]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(\spo[28]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[27]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h006F0000AA020000)) 
    \spo[27]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[27]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4908000072F30000)) 
    \spo[27]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(a[1]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[27]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[28]_INST_0 
       (.I0(\spo[28]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[28]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[28]_INST_0_i_3_n_0 ),
        .O(spo[28]));
  LUT6 #(
    .INIT(64'h1075102090EE9000)) 
    \spo[28]_INST_0_i_1 
       (.I0(a[2]),
        .I1(a[4]),
        .I2(\spo[30]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(\spo[28]_INST_0_i_4_n_0 ),
        .I5(a[1]),
        .O(\spo[28]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h037C00004C000000)) 
    \spo[28]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[4]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[28]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h08970000800A0000)) 
    \spo[28]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[28]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \spo[28]_INST_0_i_4 
       (.I0(a[0]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[28]_INST_0_i_4_n_0 ));
  MUXF8 \spo[29]_INST_0 
       (.I0(\spo[29]_INST_0_i_1_n_0 ),
        .I1(\spo[29]_INST_0_i_2_n_0 ),
        .O(spo[29]),
        .S(a[5]));
  MUXF7 \spo[29]_INST_0_i_1 
       (.I0(\spo[29]_INST_0_i_3_n_0 ),
        .I1(\spo[29]_INST_0_i_4_n_0 ),
        .O(\spo[29]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[29]_INST_0_i_2 
       (.I0(\spo[29]_INST_0_i_5_n_0 ),
        .I1(\spo[29]_INST_0_i_6_n_0 ),
        .O(\spo[29]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h487F0000F0BC0000)) 
    \spo[29]_INST_0_i_3 
       (.I0(a[1]),
        .I1(a[4]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[29]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h05FF00007B560000)) 
    \spo[29]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[6]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[0]),
        .O(\spo[29]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0C00030004000800)) 
    \spo[29]_INST_0_i_5 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[29]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000747B0000)) 
    \spo[29]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[29]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hB8003333B8000000)) 
    \spo[2]_INST_0 
       (.I0(\spo[2]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[2]_INST_0_i_2_n_0 ),
        .I3(a[4]),
        .I4(a[2]),
        .I5(\spo[2]_INST_0_i_3_n_0 ),
        .O(spo[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \spo[2]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[30]_INST_0_i_4_n_0 ),
        .I2(a[3]),
        .O(\spo[2]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \spo[2]_INST_0_i_2 
       (.I0(a[1]),
        .I1(\spo[2]_INST_0_i_4_n_0 ),
        .I2(a[6]),
        .I3(a[3]),
        .O(\spo[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000800084000100)) 
    \spo[2]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[2]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \spo[2]_INST_0_i_4 
       (.I0(a[10]),
        .I1(a[8]),
        .I2(a[9]),
        .I3(a[7]),
        .I4(a[0]),
        .O(\spo[2]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h30333000B800B800)) 
    \spo[30]_INST_0 
       (.I0(\spo[30]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[30]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[30]_INST_0_i_3_n_0 ),
        .I5(a[4]),
        .O(spo[30]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \spo[30]_INST_0_i_1 
       (.I0(a[1]),
        .I1(\spo[30]_INST_0_i_4_n_0 ),
        .I2(a[3]),
        .O(\spo[30]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030008000)) 
    \spo[30]_INST_0_i_2 
       (.I0(a[3]),
        .I1(a[4]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[30]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \spo[30]_INST_0_i_3 
       (.I0(a[1]),
        .I1(\spo[30]_INST_0_i_5_n_0 ),
        .I2(a[3]),
        .O(\spo[30]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \spo[30]_INST_0_i_4 
       (.I0(a[0]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[30]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \spo[30]_INST_0_i_5 
       (.I0(a[0]),
        .I1(a[7]),
        .I2(a[9]),
        .I3(a[8]),
        .I4(a[10]),
        .I5(a[6]),
        .O(\spo[30]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \spo[31]_INST_0 
       (.I0(\spo[31]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[31]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[31]_INST_0_i_3_n_0 ),
        .O(spo[31]));
  LUT6 #(
    .INIT(64'h0000030004000000)) 
    \spo[31]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[31]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0200800001000200)) 
    \spo[31]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[31]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0600200008000000)) 
    \spo[31]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[31]_INST_0_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \spo[31]_INST_0_i_4 
       (.I0(a[7]),
        .I1(a[9]),
        .I2(a[8]),
        .I3(a[10]),
        .O(\spo[31]_INST_0_i_4_n_0 ));
  MUXF7 \spo[3]_INST_0 
       (.I0(\spo[3]_INST_0_i_1_n_0 ),
        .I1(\spo[3]_INST_0_i_2_n_0 ),
        .O(spo[3]),
        .S(a[5]));
  LUT6 #(
    .INIT(64'h0000808030000000)) 
    \spo[3]_INST_0_i_1 
       (.I0(\spo[10]_INST_0_i_1_n_0 ),
        .I1(a[2]),
        .I2(a[3]),
        .I3(\spo[30]_INST_0_i_5_n_0 ),
        .I4(a[1]),
        .I5(a[4]),
        .O(\spo[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3310001000000000)) 
    \spo[3]_INST_0_i_2 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(\spo[28]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(\spo[30]_INST_0_i_4_n_0 ),
        .I5(a[4]),
        .O(\spo[3]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[4]_INST_0 
       (.I0(\spo[6]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[4]_INST_0_i_1_n_0 ),
        .I3(a[2]),
        .I4(\spo[4]_INST_0_i_2_n_0 ),
        .O(spo[4]));
  LUT6 #(
    .INIT(64'h0200900000000000)) 
    \spo[4]_INST_0_i_1 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3400080000000000)) 
    \spo[4]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[4]),
        .I2(a[1]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[4]_INST_0_i_2_n_0 ));
  MUXF8 \spo[5]_INST_0 
       (.I0(\spo[5]_INST_0_i_1_n_0 ),
        .I1(\spo[5]_INST_0_i_2_n_0 ),
        .O(spo[5]),
        .S(a[5]));
  MUXF7 \spo[5]_INST_0_i_1 
       (.I0(\spo[5]_INST_0_i_3_n_0 ),
        .I1(\spo[5]_INST_0_i_4_n_0 ),
        .O(\spo[5]_INST_0_i_1_n_0 ),
        .S(a[2]));
  MUXF7 \spo[5]_INST_0_i_2 
       (.I0(\spo[5]_INST_0_i_5_n_0 ),
        .I1(\spo[5]_INST_0_i_6_n_0 ),
        .O(\spo[5]_INST_0_i_2_n_0 ),
        .S(a[2]));
  LUT6 #(
    .INIT(64'h170800002A200000)) 
    \spo[5]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[5]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7209000004A80000)) 
    \spo[5]_INST_0_i_4 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[5]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000008B300000)) 
    \spo[5]_INST_0_i_5 
       (.I0(a[1]),
        .I1(a[4]),
        .I2(a[3]),
        .I3(a[0]),
        .I4(\spo[31]_INST_0_i_4_n_0 ),
        .I5(a[6]),
        .O(\spo[5]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0800000007000400)) 
    \spo[5]_INST_0_i_6 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[5]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[6]_INST_0 
       (.I0(\spo[6]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[7]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[6]_INST_0_i_2_n_0 ),
        .O(spo[6]));
  LUT6 #(
    .INIT(64'h080830008080C000)) 
    \spo[6]_INST_0_i_1 
       (.I0(\spo[28]_INST_0_i_4_n_0 ),
        .I1(a[2]),
        .I2(a[3]),
        .I3(\spo[30]_INST_0_i_4_n_0 ),
        .I4(a[1]),
        .I5(a[4]),
        .O(\spo[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7400080040000000)) 
    \spo[6]_INST_0_i_2 
       (.I0(a[0]),
        .I1(a[4]),
        .I2(a[1]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[6]_INST_0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \spo[7]_INST_0 
       (.I0(\spo[7]_INST_0_i_1_n_0 ),
        .I1(a[5]),
        .I2(\spo[7]_INST_0_i_2_n_0 ),
        .I3(a[2]),
        .I4(\spo[7]_INST_0_i_3_n_0 ),
        .O(spo[7]));
  LUT6 #(
    .INIT(64'h40084008A0050000)) 
    \spo[7]_INST_0_i_1 
       (.I0(a[2]),
        .I1(\spo[30]_INST_0_i_4_n_0 ),
        .I2(a[4]),
        .I3(a[1]),
        .I4(\spo[28]_INST_0_i_4_n_0 ),
        .I5(a[3]),
        .O(\spo[7]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800000004009000)) 
    \spo[7]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[3]),
        .I2(a[6]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[0]),
        .I5(a[1]),
        .O(\spo[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0E00200008000000)) 
    \spo[7]_INST_0_i_3 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(\spo[31]_INST_0_i_4_n_0 ),
        .I4(a[6]),
        .I5(a[3]),
        .O(\spo[7]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008800480)) 
    \spo[8]_INST_0 
       (.I0(a[4]),
        .I1(\spo[10]_INST_0_i_1_n_0 ),
        .I2(a[1]),
        .I3(a[2]),
        .I4(a[3]),
        .I5(a[5]),
        .O(spo[8]));
  MUXF7 \spo[9]_INST_0 
       (.I0(\spo[9]_INST_0_i_1_n_0 ),
        .I1(\spo[9]_INST_0_i_2_n_0 ),
        .O(spo[9]),
        .S(a[5]));
  LUT6 #(
    .INIT(64'hB3F0800000000000)) 
    \spo[9]_INST_0_i_1 
       (.I0(\spo[30]_INST_0_i_4_n_0 ),
        .I1(a[2]),
        .I2(a[4]),
        .I3(a[1]),
        .I4(\spo[10]_INST_0_i_1_n_0 ),
        .I5(a[3]),
        .O(\spo[9]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \spo[9]_INST_0_i_2 
       (.I0(a[4]),
        .I1(a[1]),
        .I2(\spo[28]_INST_0_i_4_n_0 ),
        .I3(a[3]),
        .I4(a[2]),
        .O(\spo[9]_INST_0_i_2_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
