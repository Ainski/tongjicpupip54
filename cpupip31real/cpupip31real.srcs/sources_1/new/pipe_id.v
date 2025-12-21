`timescale 1ns / 1ps

module pipe_id(
	input           in_clk,
    input           in_rst,
    input [31:0]    in_pc4,
    input [31:0]    in_instr,
    input           in_hi_wena,
    input           in_lo_wena,
    input           in_rd_wena,
    input [4:0]     in_rd_waddr,
    input [31:0]    in_hi_data,
    input [31:0]    in_lo_data,
    input [31:0]    in_rd_data,

    input [5:0]     in_ex_op,
    input [5:0]     in_ex_func,
    input [31:0]    in_ex_pc4,
    input [31:0]    in_ex_alu_data,
    input [31:0]    in_ex_mul_hi,
    input [31:0]    in_ex_mul_lo,
    input [31:0]    in_ex_div_r,
    input [31:0]    in_ex_div_q,
    input [31:0]    in_ex_clz_data,
    input [31:0]    in_ex_hi_data,
    input [31:0]    in_ex_lo_data,
    input [31:0]    in_ex_rs_data,
    input           in_ex_hi_wena,
    input           in_ex_lo_wena,
    input           in_ex_rd_wena,
    input [1:0]     in_ex_hi_sel,
    input [1:0]     in_ex_lo_sel,
    input [2:0]     in_ex_rd_sel,
    input [4:0]     in_ex_rd_waddr,

    input [31:0]    in_mem_pc4,
    input [31:0]    in_mem_alu_data,
    input [31:0]    in_mem_mul_hi,
    input [31:0]    in_mem_mul_lo,
    input [31:0]    in_mem_div_q,
    input [31:0]    in_mem_div_r,
    input [31:0]    in_mem_clz_data,
    input [31:0]    in_mem_lo_data,
    input [31:0]    in_mem_hi_data,
    input [31:0]    in_mem_rs_data,
    input [31:0]    in_mem_dmem_data,
    input           in_mem_hi_wena,
    input           in_mem_lo_wena,
    input           in_mem_rd_wena,
    input [1:0]     in_mem_hi_sel,
    input [1:0]     in_mem_lo_sel,
    input [2:0]     in_mem_rd_sel,
    input [4:0]     in_mem_rd_waddr,


    output          out_stall,
    output          out_branch,
    output [5:0]    out_op,
    output [5:0]    out_func,
    output [2:0]    out_pc_sel,
    output [31:0]   our_pc4,
    output [31:0]   out_immed,
    output [31:0]   out_shamt,
    output [31:0]   out_pc_eaddr,
    output [31:0]   out_pc_baddr,
    output [31:0]   out_pc_jaddr,
    output [31:0]   out_pc_raddr,
    output [31:0]   out_rs_data,
    output [31:0]   out_rt_data,
    output [31:0]   out_hi_data,
    output [31:0]   out_lo_data,
    output [31:0]   out_cp0_data,
    output          out_alu_a_sel,
    output [1:0]    out_alu_b_sel,
    output [3:0]    out_aluc,
    output          out_mul_ena,
    output          out_div_ena,
    output          out_clz_ena,
    output          out_mul_sign,
    output          out_div_sign,
    output          out_hi_wena,
    output          out_lo_wena,
    output          out_rd_wena,
    output          out_cutter_sign,
    output          out_cutter_addr_sel,
    output [2:0]    out_cutter_sel,
    output          out_dmem_ena,
    output          out_dmem_wena,
    output [1:0]    out_dmem_wsel,
    output [1:0]    out_dmem_rsel,
    output [1:0]    out_hi_sel,
    output [1:0]    out_lo_sel,
    output [2:0]    out_rd_sel,
    output [4:0]    out_rd_waddr,
    output [31:0]   out_reg6,
    output [31:0]   out_reg7,
    output [31:0]   out_reg15,
    output [31:0]   out_reg16
    );

    wire [5:0] op   = in_instr[31:26];
    wire [5:0] func = in_instr[5:0];
    wire [4:0] rsc  = in_instr[25:21];
    wire [4:0] rtc  = in_instr[20:16];
    wire rs_rena;
    wire rt_rena;

    wire immed_sign;
    wire mfc0;
    wire mtc0;
    wire eret;
    
    wire [31:0] ex_df_hi_data;
    wire [31:0] ex_df_lo_data;
    wire [31:0] ex_df_rd_data;
    wire [31:0] mem_df_hi_data;
    wire [31:0] mem_df_lo_data;
    wire [31:0] mem_df_rd_data;
    
    wire        ext5_sel;
    wire [4:0]  ext5_data;
    
    wire forward;
    wire is_rs, is_rt;
    wire [31:0] hi_df_data;
    wire [31:0] lo_df_data;
    wire [31:0] rs_df_data;
    wire [31:0] rt_df_data;
    wire [31:0] hi_data;
    wire [31:0] lo_data;
    wire [31:0] rs_data;
    wire [31:0] rt_data;

    wire        cp0_exec;
    wire [4:0]  cp0_addr;
    wire [4:0]  cp0_cause;
    wire [31:0] cp0_status;

    assign out_immed    = { { 16{ immed_sign & in_instr[15] } }, in_instr[15:0] };
    assign out_shamt    = { 27'b0, ext5_data };

    assign out_pc_baddr = in_pc4 + { { { 14{ in_instr[15] } }, in_instr[15:0], 2'b00 } };
    assign out_pc_jaddr = { in_pc4[31:28], in_instr[25:0], 2'b00 };
    assign out_pc_raddr = out_rs_data;

    assign out_rs_data  = (forward && is_rs) ? rs_df_data : rs_data;
    assign out_rt_data  = (forward && is_rt) ? rt_df_data : rt_data;
    assign out_hi_data  = forward ? hi_df_data : hi_data;
    assign out_lo_data  = forward ? lo_df_data : lo_data;

    assign our_pc4      = in_pc4;
    assign out_op       = op;
    assign out_func     = func;

    mux2_5 mux_extend5(in_instr[10:6], out_rs_data[4:0], ext5_sel, ext5_data);

    mux4_32 mux_ex_df_hi(in_ex_div_r, in_ex_mul_hi, in_ex_rs_data, 32'hz, in_ex_hi_sel, ex_df_hi_data);
    mux4_32 mux_ex_df_lo(in_ex_div_q, in_ex_mul_lo, in_ex_rs_data, 32'hz, in_ex_lo_sel, ex_df_lo_data);
    mux8_32 mux_ex_df_rd(in_ex_lo_data, in_ex_pc4, in_ex_clz_data, 32'hz, 32'hz, in_ex_alu_data, in_ex_hi_data, in_ex_mul_lo, in_ex_rd_sel, ex_df_rd_data);

    mux4_32 mux_mem_df_hi(in_mem_div_q, in_mem_mul_hi, in_mem_rs_data, 32'hz, in_mem_hi_sel, mem_df_hi_data);
    mux4_32 mux_mem_df_lo(in_mem_div_r, in_mem_mul_lo, in_mem_rs_data, 32'hz, in_mem_lo_sel, mem_df_lo_data);
    mux8_32 mux_mem_df_rd(in_mem_lo_data, in_mem_pc4, in_mem_clz_data, 32'hz, in_mem_dmem_data, in_mem_alu_data, in_mem_hi_data, in_mem_mul_lo, in_mem_rd_sel, mem_df_rd_data);

    regfile regfile_inst(in_clk, in_rst, in_rd_wena, rsc, rtc, rs_rena, rt_rena, in_rd_waddr, in_rd_data, rs_data, rt_data, out_reg6,out_reg7,out_reg15,out_reg16);
    cp0 cp0_inst(in_clk, in_rst, mfc0, mtc0, in_pc4 - 32'd4, cp0_addr, out_rt_data, cp0_exec, eret, cp0_cause, out_cp0_data, cp0_status, out_pc_eaddr);

    register hi_inst(in_clk, in_rst, in_hi_wena, in_hi_data, hi_data);
    register lo_inst(in_clk, in_rst, in_lo_wena, in_lo_data, lo_data);

    forwarding forwarding_inst(
        .in_clk(in_clk),
        .in_rst(in_rst),
        .in_op(op),
        .in_func(func),
        .in_rs_rena(rs_rena),
        .in_rt_rena(rt_rena),
        .in_rsc(rsc),
        .in_rtc(rtc),
        .in_exe_op(in_ex_op),
        .in_exe_func(in_ex_func),
        .in_exe_hi_data(ex_df_hi_data),
        .in_exe_lo_data(ex_df_lo_data),
        .in_exe_rd_data(ex_df_rd_data),
        .in_exe_hi_wena(in_ex_hi_wena),
        .in_exe_lo_wena(in_ex_lo_wena),
        .in_exe_rd_wena(in_ex_rd_wena),
        .in_exe_rdc(in_ex_rd_waddr),
        .in_mem_hi_data(mem_df_hi_data),
        .in_mem_lo_data(mem_df_lo_data),
        .in_mem_rd_data(mem_df_rd_data),
        .in_mem_hi_wena(in_mem_hi_wena),
        .in_mem_lo_wena(in_mem_lo_wena),
        .in_mem_rd_wena(in_mem_rd_wena),
        .in_mem_rdc(in_mem_rd_waddr),

        .in_wb_hi_data(in_hi_data),
        .in_wb_lo_data(in_lo_data),
        .in_wb_rd_data(in_rd_data),
        .in_wb_hi_wena(in_hi_wena),
        .in_wb_lo_wena(in_lo_wena),
        .in_wb_rd_wena(in_rd_wena),
        .in_wb_rdc(in_rd_waddr),
        .out_stall(out_stall),
        .out_forwarding(forward),
        .out_is_rs(is_rs),
        .out_is_rt(is_rt),
        .out_rs_data(rs_df_data),
        .out_rt_data(rt_df_data),
        .out_hi_data(hi_df_data),
        .out_lo_data(lo_df_data)
        );
	
    compare compare_inst(in_clk, in_rst, out_rs_data, out_rt_data, op, func, cp0_exec, out_branch);

    controller controller_inst(
        .in_branch(out_branch),
        .in_status(cp0_status),
        .in_instr(in_instr),
        .out_pc_sel(out_pc_sel),
        .out_immed_sign(immed_sign),
        .out_ext5_sel(ext5_sel),
        .out_rs_rena(rs_rena),
        .out_rt_rena(rt_rena),
        .out_alu_a_sel(out_alu_a_sel),
        .out_alu_b_sel(out_alu_b_sel),
        .out_aluc(out_aluc),
        .out_mul_ena(out_mul_ena),
        .out_div_ena(out_div_ena),
        .out_clz_ena(out_clz_ena),
        .out_mul_sign(out_mul_sign),
        .out_div_sign(out_div_sign),
        .out_cutter_sign(out_cutter_sign),
        .out_cutter_addr_sel(out_cutter_addr_sel),
        .out_cutter_sel(out_cutter_sel),
        .out_dmem_ena(out_dmem_ena),
        .out_dmem_wena(out_dmem_wena),
        .out_dmem_wsel(out_dmem_wsel),
        .out_dmem_rsel(out_dmem_rsel),
        .out_eret(eret),
        .out_cause(cp0_cause),
        .out_exception(cp0_exec),
        .out_cp0_addr(cp0_addr),
        .out_mfc0(mfc0),
        .out_mtc0(mtc0),
        .out_hi_wena(out_hi_wena),
        .out_lo_wena(out_lo_wena),
        .out_rd_wena(out_rd_wena),
        .out_hi_sel(out_hi_sel),
        .out_lo_sel(out_lo_sel),
        .out_rd_sel(out_rd_sel),
        .out_rdc(out_rd_waddr)
        );

endmodule