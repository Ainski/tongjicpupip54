`timescale 1ns / 1ps

module pipe_id_ex(
    input               in_clk,
    input               in_rst,
    input               in_wena,
    input               in_stall,
    input [5:0]         in_op,
    input [5:0]         in_func,
    input [31:0]        in_pc4,
    input [31:0]        in_immed,
    input [31:0]        in_shamt,
    input [31:0]        in_rs_data,
    input [31:0]        in_rt_data,
    input [31:0]        in_hi_data,
    input [31:0]        in_lo_data,
    input [31:0]        in_cp0_data,
    input               in_alu_a_sel,
    input [1:0]         in_alu_b_sel,
    input [3:0]         in_aluc,
    input               in_mul_ena,
    input               in_clz_ena,
    input               in_div_ena,
    input               in_mul_sign,
    input               in_div_sign,
    input               in_cutter_sign,
    input               in_cutter_addr_sel,
    input [2:0]         in_cutter_sel,
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

    output reg [5:0]    out_op,
    output reg [5:0]    out_func,
    output reg [31:0]   out_pc4,
    output reg [31:0]   out_immed,
    output reg [31:0]   out_shamt,
    output reg [31:0]   out_rs_data,
    output reg [31:0]   out_rt_data,
    output reg [31:0]   out_hi_data,
    output reg [31:0]   out_lo_data,
    output reg [31:0]   out_cp0_data,
    output reg          out_alu_a_sel,
    output reg [1:0]    out_alu_b_sel,
    output reg [3:0]    out_aluc,
    output reg          out_clz_ena,
    output reg          out_mul_ena,
    output reg          out_div_ena,
    output reg          out_mul_sign,
    output reg          out_div_sign,
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
        if(in_rst || in_stall) 
        begin
            out_cutter_sign     <= 1'b0;
            out_cutter_addr_sel <= 1'b0;
            out_cutter_sel      <= 3'b0;
            out_dmem_ena        <= 1'b0;
            out_dmem_wena       <= 1'b0;
            out_dmem_wsel       <= 2'b0;
            out_dmem_rsel       <= 2'b0;
            out_op              <= 6'b0;
            out_func            <= 6'b0;
            out_immed           <= 32'b0;
            out_shamt           <= 32'b0;
            out_pc4             <= 32'b0;
            out_rs_data         <= 32'b0;
            out_rt_data         <= 32'b0;
            out_hi_data         <= 32'b0;
            out_lo_data         <= 32'b0;
            out_cp0_data        <= 32'b0;
            out_alu_a_sel       <= 1'b0;
            out_alu_b_sel       <= 1'b0;
            out_aluc            <= 4'b0;
            out_mul_ena         <= 1'b0;
            out_div_ena         <= 1'b0;
            out_clz_ena         <= 1'b0;
            out_mul_sign        <= 1'b0;
            out_div_sign        <= 1'b0;
            out_hi_wena         <= 1'b0;
            out_lo_wena         <= 1'b0;
            out_rd_wena         <= 1'b0;
            out_hi_sel          <= 2'b0;
            out_lo_sel          <= 2'b0;
            out_rd_sel          <= 3'b0;
            out_rd_waddr        <= 5'b0;
        end
        else if(in_wena) 
        begin
            out_op              <= in_op;
            out_func            <= in_func;
            out_immed           <= in_immed;
            out_shamt           <= in_shamt;
            out_pc4             <= in_pc4;
            out_dmem_ena        <= in_dmem_ena;
            out_dmem_wena       <= in_dmem_wena;
            out_dmem_wsel       <= in_dmem_wsel;
            out_dmem_rsel       <= in_dmem_rsel;
            out_alu_a_sel       <= in_alu_a_sel;
            out_alu_b_sel       <= in_alu_b_sel;
            out_aluc            <= in_aluc;
            out_rs_data         <= in_rs_data;
            out_rt_data         <= in_rt_data;
            out_hi_data         <= in_hi_data;
            out_lo_data         <= in_lo_data;
            out_cp0_data        <= in_cp0_data;
            out_cutter_sign     <= in_cutter_sign;
            out_cutter_addr_sel <= in_cutter_addr_sel;
            out_cutter_sel      <= in_cutter_sel;
            out_mul_ena         <= in_mul_ena;
            out_div_ena         <= in_div_ena;
            out_clz_ena         <= in_clz_ena;
            out_mul_sign        <= in_mul_sign;
            out_div_sign        <= in_div_sign;
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