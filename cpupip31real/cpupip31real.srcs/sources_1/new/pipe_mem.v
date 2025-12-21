`timescale 1ns / 1ps

module pipe_mem(
    input           in_clk,
    input [31:0]    in_pc4,
    input [31:0]    in_rs_data,
    input [31:0]    in_rt_data,
    input [31:0]    in_hi_data,
    input [31:0]    in_lo_data,
    input [31:0]    in_cp0_data,
    input [31:0]    in_alu_data,
    input [31:0]    in_mul_hi,
    input [31:0]    in_mul_lo,
    input [31:0]    in_div_r,
    input [31:0]    in_div_q,
    input [31:0]    in_clz_data,
    input           in_cutter_sign,
    input           in_cutter_addr_sel,
    input [2:0]     in_cutter_sel,
    input [1:0]     in_dmem_wsel,
    input [1:0]     in_dmem_rsel,
    input           in_dmem_ena,
    input           in_dmem_wena,
    input           in_hi_wena,
    input           in_lo_wena,
    input           in_rd_wena,
    input [1:0]     in_hi_sel,
    input [1:0]     in_lo_sel,
    input [2:0]     in_rd_sel,
    input [4:0]     in_rd_waddr,

    output [31:0]   our_pc4,
    output [31:0]   out_rs_data,
    output [31:0]   out_hi_data,
    output [31:0]   out_lo_data,
    output [31:0]   out_cp0_data,
    output [31:0]   out_alu_data,
    output [31:0]   out_mul_hi,
    output [31:0]   out_mul_lo,
    output [31:0]   out_div_r,
    output [31:0]   out_div_q,
    output [31:0]   out_clz_data,
    output [31:0]   out_dmem_data,
    output          out_hi_wena,
    output          out_lo_wena,
    output          out_rd_wena,
    output [1:0]    out_hi_sel,
    output [1:0]    out_lo_sel,
    output [2:0]    out_rd_sel,
    output [4:0]    out_rd_waddr
    );

    wire [31:0] in_cutter;
	wire [31:0] dmem_data_temp;

    assign our_pc4      = in_pc4;
	assign out_mul_hi   = in_mul_hi;
    assign out_mul_lo   = in_mul_lo;
    assign out_div_q    = in_div_q;
    assign out_div_r    = in_div_r;
    assign out_clz_data = in_clz_data;
    assign out_alu_data = in_alu_data;
    assign out_rs_data  = in_rs_data;
    assign out_hi_data  = in_hi_data;
    assign out_lo_data  = in_lo_data;
    assign out_cp0_data = in_cp0_data;
    assign out_hi_wena  = in_hi_wena;
    assign out_lo_wena  = in_lo_wena;
    assign out_rd_wena  = in_rd_wena;
    assign out_hi_sel   = in_hi_sel;
    assign out_lo_sel   = in_lo_sel;
    assign out_rd_sel   = in_rd_sel;
    assign out_rd_waddr = in_rd_waddr;

    mux2_32 mux_cutter(in_rt_data, dmem_data_temp, in_cutter_addr_sel, in_cutter);
    cutter cutter_inst(in_cutter, in_cutter_sel, in_cutter_sign, out_dmem_data);

    dmem dmem_inst(in_clk, in_dmem_ena, in_dmem_wena, in_dmem_wsel, in_dmem_rsel, 
                    out_dmem_data, in_alu_data, dmem_data_temp);

endmodule