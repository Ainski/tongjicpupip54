`timescale 1ns/1ps
module pipe_ex_mem(
    input               in_clk,
    input               in_rst,
    input               in_wena,
    input [31:0]        in_pc4,
    input [31:0]        in_rs_data,
    input [31:0]        in_rt_data,
    input [31:0]        in_hi_data,
    input [31:0]        in_lo_data,
    input [31:0]        in_cp0_data,
    input [31:0]        in_alu_data,
    input [31:0]        in_mul_hi,
    input [31:0]        in_mul_lo,
    input [31:0]        in_div_r,
    input [31:0]        in_div_q,
    input [31:0]        in_clz_data,
    input               in_cutter_sign,
    input [2:0]         in_cutter_sel,
    input               in_cutter_addr_sel,
    input               in_dmem_ena,
    input               in_dmem_wena,
    input [1:0]         in_dmem_wsel,
    input [1:0]         in_dmem_rsel,
    input               in_hi_wena,
    input               in_lo_wena,
    input               in_rd_wena,
    input [1:0]         in_hi_sel,
    input [1:0]         in_lo_sel,
    input [2:0]         in_rd_sel,
    input [4:0]         in_rd_waddr,

    output reg [31:0]   out_pc4,
    output reg [31:0]   out_rs_data,
    output reg [31:0]   out_rt_data,
    output reg [31:0]   out_hi_data,
    output reg [31:0]   out_lo_data,
    output reg [31:0]   out_cp0_data,
    output reg [31:0]   out_alu_data,
    output reg [31:0]   out_mul_hi,
    output reg [31:0]   out_mul_lo,
    output reg [31:0]   out_div_r,
    output reg [31:0]   out_div_q,
    output reg [31:0]   out_clz_data,
    output reg          out_cutter_sign,
    output reg          out_cutter_addr_sel,
    output reg [2:0]    out_cutter_sel,
    output reg          out_dmem_ena,
    output reg          out_dmem_wena,
    output reg [1:0]    out_dmem_wsel,
    output reg [1:0]    out_dmem_rsel,
    output reg          out_rd_wena,
    output reg          out_hi_wena,
    output reg          out_lo_wena,
    output reg [1:0]    out_hi_sel,
    output reg [1:0]    out_lo_sel,
    output reg [2:0]    out_rd_sel,
    output reg [4:0]    out_rd_waddr
);

always @(posedge in_clk or posedge in_rst) 
begin
    if(in_rst) 
    begin
        out_pc4             <= 32'b0;
        out_rs_data         <= 32'b0;
        out_rt_data         <= 32'b0;
        out_alu_data        <= 32'b0;
        out_mul_hi          <= 32'b0;
        out_mul_lo          <= 32'b0;
        out_div_r           <= 32'b0;
        out_div_q           <= 32'b0;
        out_clz_data        <= 32'b0;
        out_hi_data         <= 32'b0;
        out_lo_data         <= 32'b0;
        out_cp0_data        <= 32'b0;
        out_rd_waddr        <= 5'b0;
        out_cutter_sign     <= 1'b0;
        out_cutter_addr_sel <= 1'b0;
        out_cutter_sel      <= 3'b0;
        out_dmem_ena        <= 1'b0;
        out_dmem_wena       <= 1'b0;
        out_dmem_wsel       <= 1'b0;
        out_dmem_rsel       <= 1'b0;
        out_hi_wena         <= 1'b0;
        out_lo_wena         <= 1'b0;
        out_rd_wena         <= 1'b0;
        out_hi_sel          <= 2'b0;
        out_lo_sel          <= 2'b0;
        out_rd_sel          <= 3'b0;
    end 
    else if(in_wena) 
    begin
        out_mul_hi          <= in_mul_hi;
        out_mul_lo          <= in_mul_lo;
        out_div_r           <= in_div_r;
        out_div_q           <= in_div_q;
        out_clz_data        <= in_clz_data;
        out_alu_data        <= in_alu_data;
        out_pc4             <= in_pc4;
        out_rs_data         <= in_rs_data;
        out_rt_data         <= in_rt_data;
        out_hi_data         <= in_hi_data;
        out_lo_data         <= in_lo_data;
        out_cp0_data        <= in_cp0_data;
        out_cutter_sign     <= in_cutter_sign;
        out_cutter_addr_sel <= in_cutter_addr_sel;
        out_cutter_sel      <= in_cutter_sel;
        out_dmem_ena        <= in_dmem_ena;
        out_dmem_wena       <= in_dmem_wena;
        out_dmem_wsel       <= in_dmem_wsel;
        out_dmem_rsel       <= in_dmem_rsel;
        out_hi_wena         <= in_hi_wena;
        out_lo_wena         <= in_lo_wena;
        out_rd_wena         <= in_rd_wena;
        out_hi_sel          <= in_hi_sel;
        out_lo_sel          <= in_lo_sel;
        out_rd_sel          <= in_rd_sel;
        out_rd_waddr        <= in_rd_waddr;
    end
end

endmodule