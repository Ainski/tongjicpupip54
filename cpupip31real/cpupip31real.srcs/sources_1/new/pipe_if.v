`timescale 1ns / 1ps

module pipe_if(
    input   [31:0]  in_pc,
    input   [2:0]   in_pc_sel,
    input   [31:0]  in_pc_eaddr,
    input   [31:0]  in_pc_baddr,
    input   [31:0]  in_pc_raddr,
    input   [31:0]  in_pc_jaddr,
    output  [31:0]  out_npc,
    output  [31:0]  out_pc4,
    output  [31:0]  out_instr 
    );

    assign out_pc4 = in_pc + 32'd4;

	IMEM_ip imem_inst(in_pc[12:2], out_instr);
    mux8_32 mux_npc(in_pc_jaddr, in_pc_raddr, out_pc4, 32'h00400004, 
                    in_pc_baddr, in_pc_eaddr, 32'bz, 32'bz, in_pc_sel, out_npc);

endmodule