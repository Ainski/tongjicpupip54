`timescale 1ns / 1ps

module testbench();
    reg           clk, rst, ena;
    reg [31:0]    pc_end_count;
    wire [7:0]    o_seg, o_sel;
    wire        halt;

//    wire [31:0] pc          = testbench.board_top_inst.cpu_inst.pc;
//    wire [31:0] instr       = testbench.board_top_inst.cpu_inst.instr;
//    wire [31:0] alu_a      = testbench.board_top_inst.cpu_inst.pipe_ex_inst.alu_a;
//    wire [31:0] alu_b      = testbench.board_top_inst.cpu_inst.pipe_ex_inst.alu_b;
//    wire [31:0] alu_data   = testbench.board_top_inst.cpu_inst.pipe_ex_inst.out_alu_data;
//    wire [31:0] exe_in_rs_data = testbench.board_top_inst.cpu_inst.pipe_ex_inst.in_rs_data;
//    wire [31:0] exe_in_rt_data = testbench.board_top_inst.cpu_inst.pipe_ex_inst.in_rt_data;
//    wire [31:0] exe_out_mul_hi = testbench.board_top_inst.cpu_inst.pipe_ex_inst.out_mul_hi;
//    wire [31:0] exe_out_mul_lo = testbench.board_top_inst.cpu_inst.pipe_ex_inst.out_mul_lo;

//    wire wb_out_hi_wena = testbench.board_top_inst.cpu_inst.pipe_wb_inst.out_hi_wena;
//    wire [1:0] wb_in_hi_sel = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_hi_sel;
//    wire [31:0] wb_in_div_r  = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_div_r;
//    wire [31:0] wb_in_mul_hi = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_mul_hi;
//    wire [31:0] wb_in_in_rs_data = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_rs_data;
//    wire [31:0] wb_out_hi_data = testbench.board_top_inst.cpu_inst.pipe_wb_inst.out_hi_data;

//    wire wb_out_lo_wena = testbench.board_top_inst.cpu_inst.pipe_wb_inst.out_lo_wena;
//    wire [1:0] wb_in_lo_sel = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_lo_sel;
//    wire [31:0] wb_in_div_q  = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_div_q;
//    wire [31:0] wb_in_mul_lo = testbench.board_top_inst.cpu_inst.pipe_wb_inst.in_mul_lo;
//    wire [31:0] wb_out_lo_data = testbench.board_top_inst.cpu_inst.pipe_wb_inst.out_lo_data;


//    wire [5:0]  in_exe_op = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_ex_op;
//    wire [5:0]  in_exe_func = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_ex_func;
//    wire [31:0] in_exe_hi_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.ex_df_hi_data;
//    wire [31:0] in_exe_lo_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.ex_df_lo_data;
//    wire [31:0] in_exe_rd_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.ex_df_rd_data;
//    wire        in_exe_hi_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_ex_hi_wena;
//    wire        in_exe_lo_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_ex_lo_wena;
//    wire        in_exe_rd_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_ex_rd_wena;
//    wire [4:0]  in_exe_rdc = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_ex_rd_waddr;
//    wire [31:0] in_mem_hi_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.mem_df_hi_data;
//    wire [31:0] in_mem_lo_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.mem_df_lo_data;
//    wire [31:0] in_mem_rd_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.mem_df_rd_data;
//    wire        in_mem_hi_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_mem_hi_wena;
//    wire        in_mem_lo_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_mem_lo_wena;
//    wire        in_mem_rd_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_mem_rd_wena;
//    wire [4:0]  in_mem_rdc = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_mem_rd_waddr;
//    // wire [31:0] in_wb_hi_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_hi_data;
//    // wire [31:0] in_wb_lo_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_lo_data;
//    // wire [31:0] in_wb_rd_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_rd_data;
//    // wire        in_wb_hi_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_hi_wena;
//    // wire        in_wb_lo_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_lo_wena;
//    // wire        in_wb_rd_wena = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_rd_wena;
//    // wire [4:0]  in_wb_rdc = testbench.board_top_inst.cpu_inst.pipe_id_inst.in_rd_waddr;
//    wire        out_stall = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_stall;
//    wire        out_forwarding = testbench.board_top_inst.cpu_inst.pipe_id_inst.forward;
//    wire        out_is_rs = testbench.board_top_inst.cpu_inst.pipe_id_inst.is_rs;
//    wire        out_is_rt = testbench.board_top_inst.cpu_inst.pipe_id_inst.is_rt;
//    wire [31:0] df_out_rs_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.rs_df_data;
//    wire [31:0] df_out_rt_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.rt_df_data;
//    wire [31:0] df_out_hi_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.hi_df_data;
//    wire [31:0] df_out_lo_data = testbench.board_top_inst.cpu_inst.pipe_id_inst.lo_df_data;

//    wire        out_alu_a_sel = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_alu_a_sel;
//    wire [1:0]  out_alu_b_sel = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_alu_b_sel;

//    wire [31:0] out_rs_data   = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_rs_data;
//    wire [31:0] out_rt_data   = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_rt_data;
//    wire [31:0] out_hi_data   = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_hi_data;
//    wire [31:0] out_lo_data   = testbench.board_top_inst.cpu_inst.pipe_id_inst.out_lo_data;

    

    integer file_output;//输出文件

    initial 
    begin
        //file_output = $fopen("_246tb_ex10_result.txt");
        clk = 1'b0;
        rst = 1'b1;
        ena = 1'b1;
        pc_end_count = 0;
        #1 
        rst = 1'b0;
        #200 
        ena = 1'b0;
        #200
        ena = 1'b1;
    end

    always 
    begin
        #1 
        clk = ~clk;
        if(halt) begin
            pc_end_count = pc_end_count + 1;
        end
        if (pc_end_count == 20) begin
//            $fdisplay(file_output, "regfile0: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[0]);
//            $fdisplay(file_output, "regfile1: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[1]);
//            $fdisplay(file_output, "regfile2: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[2]);
//            $fdisplay(file_output, "regfile3: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[3]);
//            $fdisplay(file_output, "regfile4: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[4]);
//            $fdisplay(file_output, "regfile5: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[5]);
//            $fdisplay(file_output, "regfile6: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[6]);
//            $fdisplay(file_output, "regfile7: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[7]);
//            $fdisplay(file_output, "regfile8: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[8]);
//            $fdisplay(file_output, "regfile9: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[9]);
//            $fdisplay(file_output, "regfile10: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[10]);
//            $fdisplay(file_output, "regfile11: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[11]);
//            $fdisplay(file_output, "regfile12: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[12]);
//            $fdisplay(file_output, "regfile13: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[13]);
//            $fdisplay(file_output, "regfile14: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[14]);
//            $fdisplay(file_output, "regfile15: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[15]);
//            $fdisplay(file_output, "regfile16: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[16]);
//            $fdisplay(file_output, "regfile17: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[17]);
//            $fdisplay(file_output, "regfile18: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[18]);
//            $fdisplay(file_output, "regfile19: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[19]);
//            $fdisplay(file_output, "regfile20: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[20]);
//            $fdisplay(file_output, "regfile21: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[21]);
//            $fdisplay(file_output, "regfile22: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[22]);
//            $fdisplay(file_output, "regfile23: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[23]);
//            $fdisplay(file_output, "regfile24: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[24]);
//            $fdisplay(file_output, "regfile25: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[25]);
//            $fdisplay(file_output, "regfile26: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[26]);
//            $fdisplay(file_output, "regfile27: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[27]);
//            $fdisplay(file_output, "regfile28: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[28]);
//            $fdisplay(file_output, "regfile29: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[29]);
//            $fdisplay(file_output, "regfile30: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[30]);
//            $fdisplay(file_output, "regfile31: %h", testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[31]);
//            $fclose(file_output);
            $stop;
        end
    end
//    wire [31:0] regfile0    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[0];
//    wire [31:0] regfile1    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[1];
//    wire [31:0] regfile2    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[2];   
//    wire [31:0] regfile3    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[3];
//    wire [31:0] regfile4    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[4];
//    wire [31:0] regfile5    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[5];
//    wire [31:0] regfile6    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[6];
//    wire [31:0] regfile7    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[7];
//    wire [31:0] regfile8    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[8];
//    wire [31:0] regfile9    = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[9];
//    wire [31:0] regfile10   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[10];
//    wire [31:0] regfile11   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[11];
//    wire [31:0] regfile12   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[12];
//    wire [31:0] regfile13   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[13];
//    wire [31:0] regfile14   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[14];
//    wire [31:0] regfile15   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[15];
//    wire [31:0] regfile16   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[16];
//    wire [31:0] regfile17   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[17];
//    wire [31:0] regfile18   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[18];
//    wire [31:0] regfile19   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[19];
//    wire [31:0] regfile20   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[20];
//    wire [31:0] regfile21   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[21];
//    wire [31:0] regfile22   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[22];
//    wire [31:0] regfile23   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[23];
//    wire [31:0] regfile24   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[24];
//    wire [31:0] regfile25   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[25];
//    wire [31:0] regfile26   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[26];
//    wire [31:0] regfile27   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[27];
//    wire [31:0] regfile28   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[28];
//    wire [31:0] regfile29   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[29];
//    wire [31:0] regfile30   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[30];
//    wire [31:0] regfile31   = testbench.board_top_inst.cpu_inst.pipe_id_inst.regfile_inst.array_reg[31];

    board_top board_top_inst(.clk(clk), .rst(rst), .ena(ena), .o_seg(o_seg), .o_sel(o_sel), .halt(halt));

endmodule