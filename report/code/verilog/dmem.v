`timescale 1ns / 1ps

module dmem(
    input               in_clk,
    input               in_ena,
    input               in_wena,
    input [1:0]         in_wsel,
    input [1:0]         in_rsel, 
    input [31:0]        in_data,
    input [31:0]        in_addr,
    output reg [31:0]   out_data
);

    // 地址计算 - 与原始模块完全一致
    wire [31:0] offset_addr = in_addr - 32'h10010000;
    wire [9:0]  word_addr = offset_addr[11:2];     // 10位字地址，2048个字
    wire [1:0]  byte_offset = offset_addr[1:0];    // 字节偏移
    
    // 四个存储体的输出
    wire [7:0] mem0_out, mem1_out, mem2_out, mem3_out;
    
    // 四个存储体的写数据
    wire [7:0] mem0_in, mem1_in, mem2_in, mem3_in;
    assign mem0_in = in_data[7:0];
    assign mem1_in = in_data[15:8];
    assign mem2_in = in_data[23:16];
    assign mem3_in = in_data[31:24];
    
    // 写使能生成 - 与原始模块逻辑完全一致
    wire we0, we1, we2, we3;
    
    // 根据in_wsel和byte_offset生成写使能
    assign we0 = in_ena && in_wena && (
        (in_wsel == 2'b01 && byte_offset == 2'b00) ||           // 字写，对齐地址
        (in_wsel == 2'b10 && byte_offset == 2'b00) ||           // 半字写，低半字
        (in_wsel == 2'b11 && byte_offset == 2'b00)              // 字节写，字节0
    );
    
    assign we1 = in_ena && in_wena && (
        (in_wsel == 2'b01 && byte_offset == 2'b00) ||           // 字写，对齐地址
        (in_wsel == 2'b10 && byte_offset == 2'b00) ||           // 半字写，低半字
        (in_wsel == 2'b11 && byte_offset == 2'b01)              // 字节写，字节1
    );
    
    assign we2 = in_ena && in_wena && (
        (in_wsel == 2'b01 && byte_offset == 2'b00) ||           // 字写，对齐地址
        (in_wsel == 2'b10 && byte_offset == 2'b10) ||           // 半字写，高半字
        (in_wsel == 2'b11 && byte_offset == 2'b10)              // 字节写，字节2
    );
    
    assign we3 = in_ena && in_wena && (
        (in_wsel == 2'b01 && byte_offset == 2'b00) ||           // 字写，对齐地址
        (in_wsel == 2'b10 && byte_offset == 2'b10) ||           // 半字写，高半字
        (in_wsel == 2'b11 && byte_offset == 2'b11)              // 字节写，字节3
    );
    
    // 读数据逻辑 - 与原始模块完全一致
    always @(*) begin
        out_data = 32'b0;  // 默认值
        
        if (in_ena && ~in_wena) begin
            case (in_rsel)
                2'b01: begin  // 字读
                    // 原始模块只处理字对齐读取
                    out_data = {mem3_out, mem2_out, mem1_out, mem0_out};
                end
                2'b10: begin  // 半字读
                    case (byte_offset)
                        2'b00: out_data = {16'b0, mem1_out, mem0_out};
                        2'b10: out_data = {16'b0, mem3_out, mem2_out};
                        // 原始模块只处理00和10情况，其他情况不处理
                        default: out_data = 32'b0;
                    endcase
                end
                2'b11: begin  // 字节读
                    case (byte_offset)
                        2'b00: out_data = {24'b0, mem0_out};
                        2'b01: out_data = {24'b0, mem1_out};
                        2'b10: out_data = {24'b0, mem2_out};
                        2'b11: out_data = {24'b0, mem3_out};
                    endcase
                end
                default: out_data = 32'b0;
            endcase
        end
    end
    
    // 按照IP核模式实例化四个存储体
    // 注意：原始模块有2048个32位字，即8192字节
    // 每个存储体需要2048个字节，地址宽度为11位(2^11=2048)
    ram_8bit mem0_uut(
        .a({word_addr, 1'b0}),  // 11位地址 = word_addr[9:0] + 1位扩展
        .d(mem0_in),
        .clk(in_clk),
        .we(we0),
        .spo(mem0_out)
    );
    
    ram_8bit mem1_uut(
        .a({word_addr, 1'b0}),
        .d(mem1_in),
        .clk(in_clk),
        .we(we1),
        .spo(mem1_out)
    );
    
    ram_8bit mem2_uut(
        .a({word_addr, 1'b0}),
        .d(mem2_in),
        .clk(in_clk),
        .we(we2),
        .spo(mem2_out)
    );
    
    ram_8bit mem3_uut(
        .a({word_addr, 1'b0}),
        .d(mem3_in),
        .clk(in_clk),
        .we(we3),
        .spo(mem3_out)
    );
    
endmodule