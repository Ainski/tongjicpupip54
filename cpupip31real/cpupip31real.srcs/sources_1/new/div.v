`timescale 1ns / 1ps

module div(
    input           in_rst,
    input           div,
    input           sign,
    input [31:0]    a,
    input [31:0]    b,
    output [31:0]   quotient,
    output [31:0]   remainder
    );

        // Internal signals for handling signed/unsigned
    wire [31:0] temp_a;
    wire [31:0] temp_b;
    wire [32:0] temp_a_divu;
    wire [32:0] temp_b_divu;
    wire [32:0] quotient_o_divu;
    wire [32:0] remainder_o_divu;
    wire sign_a;
    wire sign_b;
    wire result_sign;

    assign sign_a = a[31];
    assign sign_b = b[31];
    assign result_sign = sign && (sign_a ^ sign_b);

    // For signed operations, convert to positive if negative
    assign temp_a = (sign && a[31]) ? -a : a;
    assign temp_b = (sign && b[31]) ? -b : b;

    assign temp_a_divu = {1'b0, temp_a};
    assign temp_b_divu = {1'b0, temp_b};

    // Divider implementation for unsigned division
    wire [32:0] numwire [32:0];
    wire [33:0] numtemp [32:0];
    wire [32:0] subwire [32:0];
    wire [32:0] ge;
    genvar i;

    assign numwire[32] = {{32{1'b0}}, temp_a_divu[32]};
    assign numtemp[32] = numwire[32] - temp_b_divu;
    assign ge[32] = ~numtemp[32][33];
    assign subwire[32] = ge[32] ? numtemp[32] : numtemp[32] + temp_b_divu;

    generate
        for (i = 31; i >= 0; i = i - 1) begin: shift_and_calculate_result
            assign numwire[i] = {subwire[i+1][31:0], temp_a_divu[i]};
            assign numtemp[i] = numwire[i] - temp_b_divu;
            assign ge[i] = ~numtemp[i][33];
            assign subwire[i] = ge[i] ? numtemp[i] : numtemp[i] + temp_b_divu;
        end
    endgenerate

    assign quotient_o_divu = (|temp_b_divu) ? ge : 0;
    assign remainder_o_divu = (|temp_b_divu) ? subwire[0] : 0;

    // Only perform division when div flag is set, otherwise pass through
    assign quotient = div ? 
                     (sign ? (result_sign ? -quotient_o_divu[31:0] : quotient_o_divu[31:0]) :
                            quotient_o_divu[31:0]) : 32'b0;
    assign remainder = div ? 
                      (sign ? (sign_a ? -remainder_o_divu[31:0] : remainder_o_divu[31:0]) :
                             remainder_o_divu[31:0]) : 32'b0;

endmodule
