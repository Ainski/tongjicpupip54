module pipe_ex(
    input           in_rst,
    input [31:0]    in_pc4,
    input [31:0]    in_immed,
    input [31:0]    in_shamt,
    input [31:0]    in_rs_data,
    input [31:0]    in_rt_data,
    input [31:0]    in_hi_data,
    input [31:0]    in_lo_data,
    input [31:0]    in_cp0_data,
    input           in_alu_a_sel,
    input [1:0]     in_alu_b_sel,
    input [3:0]     in_aluc,
    input           in_mul_ena,
    input           in_div_ena,
    input           in_clz_ena,
    input           in_mul_sign,
    input           in_div_sign,
    input           in_cutter_sign,
    input           in_cutter_addr_sel,
    input [2:0]     in_cutter_sel,
    input           in_dmem_ena,
    input           in_dmem_wena,
    input [1:0]     in_dmem_wsel,
    input [1:0]     in_dmem_rsel,
    input           in_rd_wena,
    input           in_hi_wena,
    input           in_lo_wena,
    input [1:0]     in_hi_sel,
    input [1:0]     in_lo_sel,
    input [2:0]     in_rd_sel,
    input [4:0]     in_rd_waddr,
    output [31:0]   out_pc4,
    output [31:0]   out_mul_hi,
    output [31:0]   out_mul_lo,
    output [31:0]   out_div_r,
    output [31:0]   out_div_q,
    output [31:0]   out_rs_data,
    output [31:0]   out_rt_data,
    output [31:0]   out_hi_data,
    output [31:0]   out_lo_data,
    output [31:0]   out_cp0_data,
    output [31:0]   out_clz_data,
    output [31:0]   out_alu_data,
    output          out_cutter_sign,
    output          out_cutter_addr_sel,
    output [2:0]    out_cutter_sel,
    output          out_dmem_ena,
    output          out_dmem_wena,
    output [1:0]    out_dmem_wsel,
    output [1:0]    out_dmem_rsel,
    output          out_hi_wena,
    output          out_lo_wena,
    output          out_rd_wena,
    output [1:0]    out_hi_sel,
    output [1:0]    out_lo_sel,
    output [2:0]    out_rd_sel,
    output [4:0]    out_rd_waddr
);

    wire [31:0] alu_a;
    wire [31:0] alu_b;
    wire zero, carry, negative, overdlow;

    assign out_pc4              = in_pc4;
    assign out_cutter_sign      = in_cutter_sign;
    assign out_cutter_addr_sel  = in_cutter_addr_sel;
    assign out_cutter_sel       = in_cutter_sel;
    assign out_dmem_ena         = in_dmem_ena;
    assign out_dmem_wena        = in_dmem_wena;
    assign out_dmem_rsel        = in_dmem_rsel;
    assign out_dmem_wsel        = in_dmem_wsel;
    assign out_rs_data          = in_rs_data;
    assign out_rt_data          = in_rt_data;
    assign out_hi_data          = in_hi_data;
    assign out_lo_data          = in_lo_data;
    assign out_cp0_data         = in_cp0_data;
    assign out_rd_wena          = in_rd_wena;
    assign out_hi_wena          = in_hi_wena;
    assign out_lo_wena          = in_lo_wena;
    assign out_hi_sel           = in_hi_sel;
    assign out_lo_sel           = in_lo_sel;
    assign out_rd_sel           = in_rd_sel;
    assign out_rd_waddr         = in_rd_waddr;

    mux2_32 mux_alu_a(in_shamt, in_rs_data, in_alu_a_sel, alu_a);
    mux4_32 mux_alu_b(in_rt_data, in_immed, 32'bz, 32'bz, in_alu_b_sel, alu_b);
    alu alu_inst(alu_a, alu_b, in_aluc, out_alu_data, zero, carry, negative, overdlow);

    mult mult_inst(in_rst, in_mul_ena, in_mul_sign, in_rs_data, in_rt_data, out_mul_hi, out_mul_lo);
    div div_inst(in_rst, in_div_ena, in_div_sign, in_rs_data, in_rt_data, out_div_q, out_div_r);

    clz_counter clz_counter_inst(in_rs_data, in_clz_ena, out_clz_data);

endmodule