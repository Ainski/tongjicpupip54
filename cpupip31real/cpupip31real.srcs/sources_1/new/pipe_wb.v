`timescale 1ns / 1ps


module pipe_wb(
    input [31:0]    in_pc4,
    input [31:0]    in_rs_data,
    input [31:0]    in_hi_data,
    input [31:0]    in_lo_data,
    input [31:0]    in_cp0_data,
    input [31:0]    in_alu_data,
    input [31:0]    in_mul_hi,
    input [31:0]    in_mul_lo,
    input [31:0]    in_div_r,
    input [31:0]    in_div_q,
    input [31:0]    in_clz_data,
    input [31:0]    in_dmem_data,
    input           in_hi_wena,
    input           in_lo_wena,
    input           in_rd_wena,
    input [1:0]     in_hi_sel,
    input [1:0]     in_lo_sel,
    input [2:0]     in_rd_sel,
    input [4:0]     in_rd_waddr,

    output          out_hi_wena,
    output          out_lo_wena,
    output          out_rd_wena,
    output [4:0]    out_rd_waddr,
    output [31:0]   out_hi_data,
    output [31:0]   out_lo_data,
    output [31:0]   out_rd_data
    );
	
    assign out_hi_wena   = in_hi_wena;
    assign out_lo_wena   = in_lo_wena;
	assign out_rd_wena   = in_rd_wena;
	assign out_rd_waddr  = in_rd_waddr;

    mux4_32 mux_hi(in_div_r, in_mul_hi, in_rs_data, 32'hz, in_hi_sel, out_hi_data);
    mux4_32 mux_lo(in_div_q, in_mul_lo, in_rs_data, 32'hz, in_lo_sel, out_lo_data);

    mux8_32 mux_rd(in_lo_data, in_pc4, in_clz_data, in_cp0_data, 
                    in_dmem_data, in_alu_data, in_hi_data, in_mul_lo, 
                    in_rd_sel, out_rd_data);

endmodule
