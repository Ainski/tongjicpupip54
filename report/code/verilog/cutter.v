`timescale 1ns/1ps
module cutter(
    input [31:0] 		in,
    input [2:0] 		in_sel,
    input 				in_sign,
    output reg [31:0] 	out
    );
	
    always@(*) 
	begin
        case(in_sel)
            3'b010: 	out <= { { 24{ in_sign & in[7] } }, in[7:0] };
            3'b011: 	out <= { 24'b0, in[7:0] };
			3'b001: 	out <= { { 16{ in_sign & in[15] } }, in[15:0] };
            3'b100: 	out <= { 16'b0, in[15:0] };
            default: 	out <= in;
        endcase
    end

endmodule
