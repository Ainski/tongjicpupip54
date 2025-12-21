`timescale 1ns / 1ps
`include "def.v"

// ============================================================
// 基于Tomasulo算法的动态流水线控制单元模块
// 功能：根据指令生成各种控制信号，控制CPU流水线各阶段的操作
// ============================================================
module PipeControlUnit(
    // 输入端口
    input clk,                    // 时钟信号
    input rstn,                   // 复位信号（低电平有效）
    input [31:0] instr,
    input userbreak,             // 用户中断信号（1：暂停，0：继续）
    input [4:0] rsc,              // 源寄存器Rs编号 [25:21]
    input [4:0] rtc,              // 源寄存器Rt编号 [20:16]
    input [4:0] rdc,              // 目标寄存器Rd编号 [15:11]
    input [5:0] func,             // 指令功能码 [5:0]
    input [5:0] op,               // 指令操作码 [31:26]
    input [4:0] mf,               // CP0寄存器字段 [25:21]
    input isBranch,               // 分支指令标志（来自比较器，用于CP0的intr输入）
    input EisGoto,                // EX阶段跳转指令标志
    input [4:0] Ern,              // EX阶段目标寄存器编号
    input [4:0] Mrn,              // MEM阶段目标寄存器编号
    input Ew_rf,                  // EX阶段写寄存器堆标志
    input Mw_rf,                  // MEM阶段写寄存器堆标志
    input Ew_hi,                  // EX阶段写HI寄存器标志
    input Ew_lo,                  // EX阶段写LO寄存器标志
    input [2:0] Erfsource,        // EX阶段寄存器堆源选择
    input [2:0] Mrfsource,        // MEM阶段寄存器堆源选择
    input [1:0] Ehisource,        // EX阶段HI源选择
    input [1:0] Elosource,        // EX阶段LO源选择
    
    // 输出端口 - 根据CP0.v的实际接口调整
    output reg [1:0] fwhi,        // HI寄存器数据前递选择 [1:0]
    output reg [1:0] fwlo,        // LO寄存器数据前递选择 [1:0]
    output reg [2:0] fwda,        // A操作数数据前递选择 [2:0]
    output reg [2:0] fwdb,        // B操作数数据前递选择 [2:0]
    output reg [4:0] rn,          // 目标寄存器编号 [4:0]
    output reg sign,              // 符号扩展标志 [0]
    output reg div,               // 除法操作标志 [0]
    output reg mfc0,              // 从CP0读取标志 [0]
    output reg mtc0,              // 写入CP0标志 [0]
    output reg eret,              // 异常返回标志 [0]
    output reg teq,               // 相等测试标志 [0] (TEQ指令)
    output reg beq,               // 相等分支标志 [0]
    output reg bne,               // 不等分支标志 [0]
    output reg bgez,              // 大于等于零分支标志 [0]
    output [3:0] aluc,            // ALU操作码 [3:0]
    output reg w_hi,              // 写HI寄存器标志 [0]
    output reg w_lo,              // 写LO寄存器标志 [0]
    output reg w_rf,              // 写寄存器堆标志 [0]
    output reg w_dm,              // 写数据存储器标志 [0]
    output reg [4:0] cause,       // 异常原因编码 [4:0] (直接对应CP0的cause输入)
    output reg exception,         // 异常指令标志 (CP0的exception输入)
    output reg asource,           // A源选择标志 [0]
    output reg bsource,           // B源选择标志 [0]
    output reg [1:0] hisource,    // HI寄存器源选择 [1:0]
    output reg [1:0] losource,    // LO寄存器源选择 [1:0]
    output [2:0] rfsource,        // 寄存器堆源选择 [2:0]
    output reg [2:0] pcsource,    // PC源选择 [1:0]
    output reg [1:0] SC,          // 存储器命令信号 [1:0]
    output reg [2:0] LC,          // 加载命令信号 [2:0]
    output reg stall,             // 流水线暂停信号 [0]
    output reg isGoto,            // 跳转指令标志 [0]
    output halt               // CPU停止信号 [0]
);
    reg halt_r;
    // ============================================================
    // Tomasulo算法相关参数
    // ============================================================
    parameter NUM_RESERVATION_STATIONS = 6;  // 保留站数量
    parameter NUM_FUNCTION_UNITS = 4;        // 功能单元数量
    parameter NUM_CDB_BUSES = 2;             // 公共数据总线数量
    
    // ============================================================
    // 内部寄存器定义
    // ============================================================
    
    // 保留站状态定义
    reg [31:0] reservation_stations [0:NUM_RESERVATION_STATIONS-1];
    reg [2:0] station_type [0:NUM_RESERVATION_STATIONS-1];   // 保留站类型
    reg [4:0] station_dest [0:NUM_RESERVATION_STATIONS-1];   // 目标寄存器
    reg [3:0] station_opcode [0:NUM_RESERVATION_STATIONS-1]; // 操作码
    reg station_busy [0:NUM_RESERVATION_STATIONS-1];         // 忙碌标志
    
    // 寄存器状态表 - 跟踪每个寄存器的生产者
    reg [2:0] reg_status [0:31];  // 每个寄存器的状态: 0:空闲, >0:保留站编号
    
    // HI/LO寄存器状态
    reg [2:0] hi_status;          // HI寄存器状态
    reg [2:0] lo_status;          // LO寄存器状态
    
    // 公共数据总线(CDB)信号
    reg [31:0] cdb_value [0:NUM_CDB_BUSES-1];
    reg [4:0] cdb_reg [0:NUM_CDB_BUSES-1];
    reg [2:0] cdb_rs_id [0:NUM_CDB_BUSES-1];  // 来源保留站ID
    reg cdb_valid [0:NUM_CDB_BUSES-1];
    
    // 功能单元状态
    reg [2:0] fu_busy [0:NUM_FUNCTION_UNITS-1];
    reg [4:0] fu_dest [0:NUM_FUNCTION_UNITS-1];
    reg [2:0] fu_rs_id [0:NUM_FUNCTION_UNITS-1];  // 关联的保留站ID
    
    // 内部控制信号
    reg [3:0] aluc_reg;
    reg [2:0] rfsource_reg;
    
    // 指令译码辅助信号
    reg isRType, isIType, isJType, isLoad, isStore, isBranchType;
    reg isMultDiv, isMFHI, isMFLO, isMTHI, isMTLO;
    reg isJump, isJR, isJAL, isJALR, isSpecialInstr;
    reg isShift, isShiftV, isALUOp, isMemOp;
    reg isHalt;  // HALT指令标志
    reg isSyscall, isBreak;  // 系统调用和断点指令标志
    
    // HALT状态寄存器
    reg halt_state;  // HALT状态，一旦置位，CPU停止
    
    // 用户中断状态寄存器
    reg userbreak_paused;  // 用户中断暂停状态
    reg userbreak_prev;    // 上一个时钟周期的userbreak值，用于检测边沿
    
    // 循环变量和临时变量声明
    integer i, j, k, l;
    integer rs_id_int;
    reg [2:0] rs_type_reg;
    reg cdb_found_flag;
    integer busy_count_temp;
    integer rs_status_temp, rt_status_temp;
    assign halt = halt_state||isHalt;
    
    // ============================================================
    // Tomasulo算法辅助函数
    // ============================================================
    
    // 分配保留站
    function integer allocate_reservation_station;
        input [2:0] type_req;
        integer i_local;
        reg found_flag;
        begin
            allocate_reservation_station = -1;  // 默认返回无效
            found_flag = 0;
            
            for (i_local = 0; i_local < NUM_RESERVATION_STATIONS; i_local = i_local + 1) begin
                if (!station_busy[i_local] && station_type[i_local] == `RS_TYPE_IDLE) begin
                    allocate_reservation_station = i_local;
                    found_flag = 1;
                end
                // 如果已经找到，就不再继续循环
                if (found_flag) begin
                    i_local = NUM_RESERVATION_STATIONS; // 设置循环终止条件
                end
            end
        end
    endfunction
    
    // 检查冒险
    function reg check_hazards;
        input [4:0] rs; 
        input [4:0] rt; 
        input [4:0] rd; 
        input [5:0] opcode; 
        input [5:0] funcode;
        reg hazard;
        integer rs_status, rt_status;
        integer busy_count;
        integer i_local;
        begin
            hazard = `STALL_DISABLE;
            
            // 1. 检查RAW冒险（读后写）
            if (rs != 5'b0) begin
                rs_status = reg_status[rs];
                if (rs_status != 3'b0 && station_busy[rs_status-1]) begin
                    // 如果源寄存器被占用且保留站忙碌，需要等待
                    hazard = `STALL_ENABLE;
                end
            end
            
            if (rt != 5'b0) begin
                rt_status = reg_status[rt];
                if (rt_status != 3'b0 && station_busy[rt_status-1]) begin
                    hazard = `STALL_ENABLE;
                end
            end
            
            // 2. 检查结构冒险（保留站满）
            busy_count = 0;
            for (i_local = 0; i_local < NUM_RESERVATION_STATIONS; i_local = i_local + 1) begin
                if (station_busy[i_local]) busy_count = busy_count + 1;
            end
            if (busy_count >= NUM_RESERVATION_STATIONS) begin
                hazard = `STALL_ENABLE;
            end
            
            // 3. 检查功能单元忙（乘除指令）
            if (is_mult_div_operation(opcode, funcode)) begin
                busy_count = 0;
                for (i_local = 0; i_local < NUM_FUNCTION_UNITS; i_local = i_local + 1) begin
                    if (fu_busy[i_local] != `FU_IDLE) busy_count = busy_count + 1;
                end
                if (busy_count >= NUM_FUNCTION_UNITS) begin
                    hazard = `STALL_ENABLE;
                end
            end
            
            // 4. 检查WAW冒险（写后写）- 对于Tomasulo算法通常不是问题
            // 因为保留站可以处理乱序完成
            
            check_hazards = hazard;
        end
    endfunction
    
    // 判断是否为乘除操作
    function reg is_mult_div_operation;
        input [5:0] opcode;
        input [5:0] funcode;
        reg result;
        begin
            result = 1'b0;
            if (opcode == `OP_R_TYPE) begin
                case (funcode)
                    `FUNC_MULT, `FUNC_MULTU, `FUNC_DIV, `FUNC_DIVU: 
                        result = 1'b1;
                    default: 
                        result = 1'b0;
                endcase
            end
            is_mult_div_operation = result;
        end
    endfunction
    
    // 检查CDB是否有数据可用
    function reg check_cdb_ready;
        input [4:0] reg_num;
        integer i_local;
        reg found;
        begin
            found = 1'b0;
            
            for (i_local = 0; i_local < NUM_CDB_BUSES; i_local = i_local + 1) begin
                if (cdb_valid[i_local] && cdb_reg[i_local] == reg_num) begin
                    found = 1'b1;
                    // 设置循环终止条件
                    i_local = NUM_CDB_BUSES;
                end
            end
            
            check_cdb_ready = found;
        end
    endfunction
    
    // ============================================================
    // 控制信号生成主逻辑
    // ============================================================
    always @(*) begin
        // 如果CPU处于HALT状态，所有控制信号置为无效
        if (halt_state) begin
            sign = 1'b0;
            div = 1'b0;
            mfc0 = 1'b0;
            mtc0 = 1'b0;
            eret = 1'b0;
            teq = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            bgez = 1'b0;
            w_hi = 1'b0;
            w_lo = 1'b0;
            w_rf = 1'b0;
            w_dm = 1'b0;
            asource = `OP_SRC_REG;
            bsource = `OP_SRC_REG;
            hisource = `HILO_SRC_NONE;
            losource = `HILO_SRC_NONE;
            pcsource = `PC_SRC_SEQ_PLUS4;
            SC = `MEM_STORE_WORD;
            LC = `MEM_LOAD_WORD;
            stall = `STALL_ENABLE;  // HALT时暂停流水线
            isGoto = `GOTO_DISABLE;
            fwhi = `FWD_HILO_NONE;
            fwlo = `FWD_HILO_NONE;
            fwda = `FWD_SRC_NONE;
            fwdb = `FWD_SRC_NONE;
            aluc_reg = `DEFAULT_ALUC;
            rfsource_reg = `DEFAULT_RF_SRC;
            cause = 5'b00000;       // 无异常原因
            exception = 1'b0;       // 无异常
            halt_r = 1'b1;  // 输出HALT信号
            isHalt = 1'b0;
            
            // 不处理指令类型判断
            isRType = 1'b0;
            isIType = 1'b0;
            isJType = 1'b0;
            isLoad = 1'b0;
            isStore = 1'b0;
            isBranchType = 1'b0;
            isMultDiv = 1'b0;
            isMFHI = 1'b0;
            isMFLO = 1'b0;
            isMTHI = 1'b0;
            isMTLO = 1'b0;
            isJR = 1'b0;
            isJALR = 1'b0;
            isJAL = 1'b0;
            isJump = 1'b0;
            isShift = 1'b0;
            isShiftV = 1'b0;
            isALUOp = 1'b0;
            isMemOp = 1'b0;
            isSyscall = 1'b0;
            isBreak = 1'b0;
            rn = 5'b0;
        end
        // 如果CPU处于用户中断暂停状态
        else if (userbreak_paused) begin
            // 用户中断暂停时，暂停流水线但保持所有状态
            sign = 1'b0;
            div = 1'b0;
            mfc0 = 1'b0;
            mtc0 = 1'b0;
            eret = 1'b0;
            teq = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            bgez = 1'b0;
            w_hi = 1'b0;
            w_lo = 1'b0;
            w_rf = 1'b0;
            w_dm = 1'b0;
            asource = `OP_SRC_REG;
            bsource = `OP_SRC_REG;
            hisource = `HILO_SRC_NONE;
            losource = `HILO_SRC_NONE;
            pcsource = `PC_SRC_SEQ_PLUS4;
            SC = `MEM_STORE_WORD;
            LC = `MEM_LOAD_WORD;
            stall = `STALL_ENABLE;  // 暂停流水线
            isGoto = `GOTO_DISABLE;
            fwhi = `FWD_HILO_NONE;
            fwlo = `FWD_HILO_NONE;
            fwda = `FWD_SRC_NONE;
            fwdb = `FWD_SRC_NONE;
            aluc_reg = `DEFAULT_ALUC;
            rfsource_reg = `DEFAULT_RF_SRC;
            cause = 5'b00000;
            exception = 1'b0;
            halt_r = 1'b0;  // 用户中断暂停时不输出HALT信号
            isHalt = 1'b0;
            
            // 不处理指令类型判断
            isRType = 1'b0;
            isIType = 1'b0;
            isJType = 1'b0;
            isLoad = 1'b0;
            isStore = 1'b0;
            isBranchType = 1'b0;
            isMultDiv = 1'b0;
            isMFHI = 1'b0;
            isMFLO = 1'b0;
            isMTHI = 1'b0;
            isMTLO = 1'b0;
            isJR = 1'b0;
            isJALR = 1'b0;
            isJAL = 1'b0;
            isJump = 1'b0;
            isShift = 1'b0;
            isShiftV = 1'b0;
            isALUOp = 1'b0;
            isMemOp = 1'b0;
            isSyscall = 1'b0;
            isBreak = 1'b0;
            rn = 5'b0;
        end
        else begin
            // ------------------------------------------------
            // 1. 默认值设置
            // ------------------------------------------------
            sign = 1'b0;
            div = 1'b0;
            mfc0 = 1'b0;
            mtc0 = 1'b0;
            eret = 1'b0;
            teq = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            bgez = 1'b0;
            w_hi = 1'b0;
            w_lo = 1'b0;
            w_rf = 1'b0;
            w_dm = 1'b0;
            asource = `OP_SRC_REG;
            bsource = `OP_SRC_REG;
            hisource = `HILO_SRC_NONE;
            losource = `HILO_SRC_NONE;
            pcsource = `PC_SRC_SEQ_PLUS4;
            SC = `MEM_STORE_WORD;
            LC = `MEM_LOAD_WORD;
            stall = `STALL_DISABLE;
            isGoto = `GOTO_DISABLE;
            fwhi = `FWD_HILO_NONE;
            fwlo = `FWD_HILO_NONE;
            fwda = `FWD_SRC_NONE;
            fwdb = `FWD_SRC_NONE;
            aluc_reg = `DEFAULT_ALUC;
            rfsource_reg = `DEFAULT_RF_SRC;
            cause = 5'b00000;       // 默认无异常原因
            exception = 1'b0;       // 默认无异常
            halt_r = 1'b0;  // 正常执行时HALT为0
            
            // ------------------------------------------------
            // 2. 指令类型判断（包括HALT指令）
            // ------------------------------------------------
            // 检测HALT指令：操作码为6'b111111（全1）
            isHalt = (instr==`INSTR_HALT);
            
            isRType = (op == `OP_R_TYPE) && !isHalt;
            isIType = (op != `OP_R_TYPE) && (op != `OP_J) && (op != `OP_JAL) && 
                      (op != `OP_BGEZ) && (op != `OP_COPROC0) && !isHalt;
            isJType = ((op == `OP_J) || (op == `OP_JAL)) && !isHalt;
            isBranchType = ((op == `OP_BEQ) || (op == `OP_BNE) || (op == `OP_BGEZ)) && !isHalt;
            isLoad = ((op == `OP_LW) || (op == `OP_LH) || (op == `OP_LB) ||
                     (op == `OP_LHU) || (op == `OP_LBU)) && !isHalt;
            isStore = ((op == `OP_SW) || (op == `OP_SH) || (op == `OP_SB)) && !isHalt;
            
            // 具体指令类型判断
            isMultDiv = isRType && ((func == `FUNC_MULT) || (func == `FUNC_MULTU) ||
                                    (func == `FUNC_DIV) || (func == `FUNC_DIVU));
            isMFHI = isRType && (func == `FUNC_MFHI);
            isMFLO = isRType && (func == `FUNC_MFLO);
            isMTHI = isRType && (func == `FUNC_MTHI);
            isMTLO = isRType && (func == `FUNC_MTLO);
            isJR = isRType && (func == `FUNC_JR);
            isJALR = isRType && (func == `FUNC_JALR);
            isJAL = (op == `OP_JAL) && !isHalt;
            isJump = isJType;
            isShift = isRType && ((func == `FUNC_SLL) || (func == `FUNC_SRL) || 
                                  (func == `FUNC_SRA));
            isShiftV = isRType && ((func == `FUNC_SLLV) || (func == `FUNC_SRLV) || 
                                   (func == `FUNC_SRAV));
            isALUOp = isRType || isIType;
            isMemOp = isLoad || isStore;
            
            // CP0相关指令判断
            isSyscall = isRType && (func == `FUNC_SYSCALL);
            isBreak = isRType && (func == `FUNC_BREAK);
            
            // ------------------------------------------------
            // 3. 目标寄存器选择
            // ------------------------------------------------
            if (isRType) begin
                if (func == `FUNC_JR || func == `FUNC_MTHI || func == `FUNC_MTLO || 
                    isMultDiv || isSyscall || isBreak || (func == `FUNC_TEQ)) begin
                    rn = 5'b0;  // 这些指令不写通用寄存器
                end else if (func == `FUNC_JALR) begin
                    rn = 5'd31;  // JALR写$ra寄存器
                end else begin
                    rn = rdc;    // 标准R型指令写rd
                end
            end else if (isLoad) begin
                rn = rtc;        // 加载指令写rt
            end else if (isIType || op == `OP_JAL || op == `OP_CLZ) begin
                rn = rtc;        // I型指令、JAL、CLZ写rt
            end else if (op == `OP_COPROC0 && mf == `RS_MFC0) begin
                rn = rtc;        // mfc0写rt
            end else begin
                rn = 5'b0;       // 其他指令不写寄存器
            end
            
            // ------------------------------------------------
            // 4. ALU控制信号生成
            // ------------------------------------------------
            if (isRType) begin
                case (func)
                    `FUNC_ADD:   aluc_reg = `ALUC_ADD;
                    `FUNC_ADDU:  aluc_reg = `ALUC_ADDU;
                    `FUNC_SUB:   aluc_reg = `ALUC_SUB;
                    `FUNC_SUBU:  aluc_reg = `ALUC_SUBU;
                    `FUNC_AND:   aluc_reg = `ALUC_AND;
                    `FUNC_OR:    aluc_reg = `ALUC_OR;
                    `FUNC_XOR:   aluc_reg = `ALUC_XOR;
                    `FUNC_NOR:   aluc_reg = `ALUC_NOR;
                    `FUNC_SLT:   aluc_reg = `ALUC_SLT;
                    `FUNC_SLTU:  aluc_reg = `ALUC_SLTU;
                    `FUNC_SLL:   aluc_reg = `ALUC_SLL;
                    `FUNC_SRL:   aluc_reg = `ALUC_SRL;
                    `FUNC_SRA:   aluc_reg = `ALUC_SRA;
                    `FUNC_SLLV:  aluc_reg = `ALUC_SLL;
                    `FUNC_SRLV:  aluc_reg = `ALUC_SRL;
                    `FUNC_SRAV:  aluc_reg = `ALUC_SRA;
                    `FUNC_CLZ:   aluc_reg = `ALUC_CLZ;
                    `FUNC_TEQ:   aluc_reg = `ALUC_SUB;  // TEQ使用减法比较
                    default:     aluc_reg = `DEFAULT_ALUC;
                endcase
            end else if (isHalt) begin
                aluc_reg = `DEFAULT_ALUC;  // HALT指令不需要ALU操作
            end else begin
                case (op)
                    `OP_ADDI:   aluc_reg = `ALUC_ADD;
                    `OP_ADDIU:  aluc_reg = `ALUC_ADDU;
                    `OP_SLTI:   aluc_reg = `ALUC_SLT;
                    `OP_SLTIU:  aluc_reg = `ALUC_SLTU;
                    `OP_ANDI:   aluc_reg = `ALUC_AND;
                    `OP_ORI:    aluc_reg = `ALUC_OR;
                    `OP_XORI:   aluc_reg = `ALUC_XOR;
                    `OP_LUI:    aluc_reg = `ALUC_LUI;
                    `OP_CLZ:    aluc_reg = `ALUC_CLZ;
                    `OP_BEQ, `OP_BNE: aluc_reg = `ALUC_SUB;
                    `OP_BGEZ:   aluc_reg = `ALUC_BGEZ;
                    default:    aluc_reg = `DEFAULT_ALUC;
                endcase
            end
            
            // ------------------------------------------------
            // 5. 寄存器堆写入源选择
            // ------------------------------------------------
            if (isLoad) begin
                rfsource_reg = `RF_SRC_MEM;      // 来自内存
            end else if (op == `OP_JAL || isJALR) begin
                rfsource_reg = `RF_SRC_PC_PLUS4; // 来自PC+4
            end else if (isMFHI || isMFLO) begin
                rfsource_reg = `RF_SRC_HILO;     // 来自HI/LO
            end else if (mfc0) begin
                rfsource_reg = `RF_SRC_CP0;      // 来自CP0
            end else if (isALUOp) begin
                rfsource_reg = `RF_SRC_ALU;      // 来自ALU
            end else begin
                rfsource_reg = `DEFAULT_RF_SRC;
            end
            
            // ------------------------------------------------
            // 6. CP0相关信号生成（根据CP0.v接口）
            // ------------------------------------------------
            // mfc0和mtc0信号
            mfc0 = (op == `OP_COPROC0) && (mf == `RS_MFC0);
            mtc0 = (op == `OP_COPROC0) && (mf == `RS_MTC0);
            
            // eret指令判断：opcode为010000，rdc为01110，func为011000
            eret = (op == `OP_COPROC0) && (rdc == 5'b01110) && (func == 6'b011000);
            
            // TEQ指令标志
            teq = isRType && (func == `FUNC_TEQ);
            
            // 异常原因编码（5位，对应CP0的cause输入）
            if (isSyscall) begin
                cause = `SYSCALL;  // 需要在def.v中定义为5位系统调用异常码
            end else if (isBreak) begin
                cause = `BREAK;    // 需要在def.v中定义为5位断点异常码
            end else if (teq) begin
                cause = `TEQ;      // 需要在def.v中定义为5位Trap异常码
            end else begin
                cause = 5'b00000;  // 无异常
            end
            
            // 异常指令标志（只要有异常指令就输入1）
            exception = (isSyscall || isBreak || teq);
            
            // ------------------------------------------------
            // 7. 分支指令控制
            // ------------------------------------------------
            beq = (op == `OP_BEQ);
            bne = (op == `OP_BNE);
            bgez = (op == `OP_BGEZ) && (rtc == `RT_BGEZ);
            
            // ------------------------------------------------
            // 8. 符号扩展控制
            // ------------------------------------------------
            sign = (op == `OP_ADDI || op == `OP_SLTI || op == `OP_SLTIU || 
                    op == `OP_LB || op == `OP_LH || op == `OP_LW);
            
            // ------------------------------------------------
            // 9. 除法操作标志
            // ------------------------------------------------
            div = isRType && (func == `FUNC_DIV || func == `FUNC_DIVU);
            
            // ------------------------------------------------
            // 10. 寄存器写入控制
            // ------------------------------------------------
            w_hi = isRType && (func == `FUNC_MULT || func == `FUNC_MULTU || 
                              func == `FUNC_DIV || func == `FUNC_DIVU || 
                              func == `FUNC_MTHI);
            w_lo = isRType && (func == `FUNC_MULT || func == `FUNC_MULTU || 
                              func == `FUNC_DIV || func == `FUNC_DIVU || 
                              func == `FUNC_MTLO);
            w_rf = (isRType && !isJR && !isJALR && !isMTHI && !isMTLO && !isMultDiv && 
                   !isSyscall && !isBreak && !teq) || isIType || isLoad || 
                   (op == `OP_JAL) || mfc0 || (op == `OP_CLZ);
            w_dm = isStore;
            
            // ------------------------------------------------
            // 11. 操作数源选择
            // ------------------------------------------------
            asource = isRType ? `OP_SRC_REG : `OP_SRC_IMM;  // R型:寄存器, I型:立即数
            bsource = (isRType && isShift && !isShiftV) ? `OP_SRC_IMM : `OP_SRC_REG;
            
            // ------------------------------------------------
            // 12. HI/LO寄存器源选择
            // ------------------------------------------------
            if (func == `FUNC_MULT || func == `FUNC_MULTU) begin
                hisource = `HILO_SRC_MULT;
                losource = `HILO_SRC_MULT;
            end else if (func == `FUNC_DIV || func == `FUNC_DIVU) begin
                hisource = `HILO_SRC_DIV;
                losource = `HILO_SRC_DIV;
            end else if (func == `FUNC_MTHI || func == `FUNC_MTLO) begin
                hisource = `HILO_SRC_MOVE;
                losource = `HILO_SRC_MOVE;
            end else begin
                hisource = `HILO_SRC_NONE;
                losource = `HILO_SRC_NONE;
            end
            
            // ------------------------------------------------
            // 13. 存储器访问控制
            // ------------------------------------------------
            case (op)
                `OP_SB: SC = `MEM_STORE_BYTE;
                `OP_SH: SC = `MEM_STORE_HALF;
                `OP_SW: SC = `MEM_STORE_WORD;
                default: SC = `MEM_STORE_WORD;
            endcase
            
            case (op)
                `OP_LW:  LC = `MEM_LOAD_WORD;
                `OP_LH:  LC = `MEM_LOAD_HALF_S;
                `OP_LB:  LC = `MEM_LOAD_BYTE_S;
                `OP_LHU: LC = `MEM_LOAD_HALF_U;
                `OP_LBU: LC = `MEM_LOAD_BYTE_U;
                default: LC = `MEM_LOAD_WORD;
            endcase
            
            // ------------------------------------------------
            // 14. Tomasulo算法: 冒险检测和保留站分配
            // ------------------------------------------------
            stall = check_hazards(rsc, rtc, rn, op, func);
            
            // 如果没有停顿，尝试分配保留站
            if (!stall && !isHalt) begin
                rs_id_int = -1;
                
                // 确定保留站类型
                if (isMultDiv) begin
                    rs_type_reg = `RS_TYPE_MULDIV;
                end else if (isMemOp) begin
                    rs_type_reg = `RS_TYPE_MEM;
                end else if (isBranchType || isJump || isJR || isJALR) begin
                    rs_type_reg = `RS_TYPE_BRANCH;
                end else begin
                    rs_type_reg = `RS_TYPE_ALU;
                end
                
                // 分配保留站
                rs_id_int = allocate_reservation_station(rs_type_reg);
                if (rs_id_int == -1) begin
                    stall = `STALL_ENABLE;  // 没有可用保留站，停顿
                end else if (rs_id_int != -1) begin
                    // 配置保留站
                    station_opcode[rs_id_int] = aluc_reg;
                    station_dest[rs_id_int] = rn;
                end
            end
            
            // ------------------------------------------------
            // 15. 数据前递控制 (Tomasulo算法)
            // ------------------------------------------------
            fwda = `FWD_SRC_NONE;
            fwdb = `FWD_SRC_NONE;
            fwhi = `FWD_HILO_NONE;
            fwlo = `FWD_HILO_NONE;
            
            // 检查源寄存器Rs的数据相关
            if (rsc != 5'b0) begin
                rs_status_temp = reg_status[rsc];
                if (rs_status_temp != 3'b0 && station_busy[rs_status_temp-1]) begin
                    // 检查CDB是否有数据可用
                    if (check_cdb_ready(rsc)) begin
                        fwda = `FWD_SRC_EX_ALU;  // 从CDB获取数据
                    end else begin
                        fwda = `FWD_SRC_NONE;    // 等待数据就绪
                    end
                end
            end
            
            // 检查源寄存器Rt的数据相关
            if (rtc != 5'b0) begin
                rt_status_temp = reg_status[rtc];
                if (rt_status_temp != 3'b0 && station_busy[rt_status_temp-1]) begin
                    if (check_cdb_ready(rtc)) begin
                        fwdb = `FWD_SRC_EX_ALU;  // 从CDB获取数据
                    end else begin
                        fwdb = `FWD_SRC_NONE;    // 等待数据就绪
                    end
                end
            end
            
            // HI/LO寄存器前递
            if (Ew_hi) fwhi = `FWD_HILO_EX;
            if (Ew_lo) fwlo = `FWD_HILO_EX;
            
            // 对于乘除指令，前递来自EX阶段的结果
            if (isMultDiv) begin
                fwda = `FWD_SRC_EX_MULT;
                fwdb = `FWD_SRC_EX_MULT;
            end
            
            // ------------------------------------------------
            // 16. 跳转和分支控制
            // ------------------------------------------------
            isGoto = isJump || isJR || isJALR || isBranchType || eret;
        
            if (isJump || isJALR || isJR) begin
                pcsource = `PC_SRC_JUMP;        // 跳转指令的PC值
            end else if (isBranchType) begin
                pcsource = `PC_SRC_BRANCH;      // 分支指令计算的PC值
            end else if (eret) begin
                pcsource = `PC_SRC_RETURN;      // 返回指令的PC值
            end else if (exception) begin
                pcsource = `PC_SRC_CP0;         // CP0提供的PC值（异常处理）
            end else if (!rstn) begin
                pcsource = `PC_SRC_RESET;       // 32'h4（复位时）
            end else begin
                pcsource = `PC_SRC_SEQ_PLUS4;   // 当前PC+4（顺序执行）
            end
        end
    end
    
    // ============================================================
    // HALT指令和用户中断处理逻辑
    // ============================================================
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            halt_state <= 1'b0;         // 复位时清除HALT状态
            userbreak_paused <= 1'b0;   // 复位时清除用户中断暂停状态
            userbreak_prev <= 1'b0;     // 复位时清除上一个userbreak值
        end else begin
            // 保存上一个时钟周期的userbreak值，用于边沿检测
            userbreak_prev <= userbreak;
            
            // HALT指令检测，优先级最高
            if (isHalt && !halt_state) begin
                halt_state <= 1'b1;
                // HALT指令执行时，忽略userbreak状态
                userbreak_paused <= 1'b0;
            end
            // 只有在未执行HALT指令的情况下，才处理userbreak
            else if (!halt_state) begin
                // 检测userbreak的上升沿（0->1）：进入暂停状态
                if (!userbreak_prev && userbreak) begin
                    userbreak_paused <= 1'b1;
                end
                // 检测userbreak的下降沿（1->0）：退出暂停状态
                else if (userbreak_prev && !userbreak) begin
                    userbreak_paused <= 1'b0;
                end
            end
        end
    end
    
    // ============================================================
    // 寄存器状态更新逻辑
    // ============================================================
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // 复位时初始化所有寄存器状态
            for (i = 0; i < NUM_CDB_BUSES; i = i + 1) begin
                cdb_valid[i] <= 1'b0;
                cdb_reg[i] <= 5'b00000;
                cdb_value[i] <= 32'b0;
                cdb_rs_id[i] <= 3'b000;
            end
            
            for (i = 0; i < 32; i = i + 1) begin
                reg_status[i] <= 3'b000;
            end
        end
        else if (!halt_state && !userbreak_paused) begin
            // 当CDB有效时，更新寄存器状态（仅在非HALT且非暂停状态下）
            for (i = 0; i < NUM_CDB_BUSES; i = i + 1) begin
                if (cdb_valid[i]) begin
                    if (reg_status[cdb_reg[i]] == cdb_rs_id[i] + 1) begin
                        reg_status[cdb_reg[i]] <= 3'b0;  // 寄存器变为空闲
                    end
                end
            end
        end
    end
    
    // ============================================================
    // Tomasulo算法状态寄存器初始化
    // ============================================================
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // 复位时初始化保留站
            for (i = 0; i < NUM_RESERVATION_STATIONS; i = i + 1) begin
                station_busy[i] <= 1'b0;
                station_type[i] <= `RS_TYPE_IDLE;
                station_dest[i] <= 5'b00000;
                station_opcode[i] <= `DEFAULT_ALUC;
            end
            
            hi_status <= 3'b000;
            lo_status <= 3'b000;
            
            // 复位时初始化功能单元
            for (i = 0; i < NUM_FUNCTION_UNITS; i = i + 1) begin
                fu_busy[i] <= `FU_IDLE;
                fu_dest[i] <= 5'b00000;
                fu_rs_id[i] <= 3'b000;
            end
        end
    end
    
    // ============================================================
    // 输出连接
    // ============================================================
    assign aluc = aluc_reg;
    assign rfsource = rfsource_reg;
    
endmodule