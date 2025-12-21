`timescale 1ns / 1ps

module pc(
    input               in_clk,
    input               in_rst,
    input               in_ena,
    input               in_stall,
    input  [31:0]       in_pc,
    input               halt,
    output reg [31:0]   out_pc
    );
    reg halting;

    always@(posedge in_clk or posedge in_rst) begin
        if(in_rst) begin
            out_pc <= 32'h00400000;
            halting <= 0;
        end else if (halt||halting)begin
            halting <= 1;
            out_pc <= out_pc;
        end else if(~in_stall&&in_ena) begin
            out_pc <= in_pc;
            halting <= halting;
        end else begin 
            out_pc <= out_pc;
            halting <=halting;
        end
    end

endmodule