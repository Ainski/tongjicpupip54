`timescale 1ns / 1ps
module pipe_if_id(
    input               in_clk,
    input               in_rst,
    input               in_stall,
    input               in_branch,
    input [31:0]        in_pc4,
    input [31:0]        in_instr,
    output reg [31:0]   out_pc4,
    output reg [31:0]   out_instr 
    );

    always @(posedge in_clk or posedge in_rst)
    begin
		if(in_rst) 
        begin
		    out_pc4   <= 32'b0;
		    out_instr <= 32'b0;       
		end 
        else if(in_branch)
        begin
            out_pc4   <= 32'b0;
            out_instr <= 32'b0;
        end 
        else if(~in_stall) 
        begin
		    out_pc4   <= in_pc4;
		    out_instr <= in_instr;
		end
	end
	
endmodule