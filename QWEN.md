# 流水线CPU设计项目 (Pipeline CPU Design Project)

## 项目概述

这是一个基于MIPS架构的五级流水线CPU设计项目，fork自郑学长的代码（https://github.com/ZhengBryan/TongjiCS-Undergraduate-Courses.git）。该项目针对原始代码中发现的多个严重bug进行了修复和优化。

主要修复的bug包括：
- 0号寄存器永远为0的问题，但在数据重定向时可能引入非零值
- 写回阶段的数据前递问题
- forwarding模块中out_forwarding存在两个驱动源，导致复杂电路和逻辑错误
- CPU无法通过开关暂停周期后再继续运行的问题
- 除法器无法正常工作的问题
- mul指令下lo_wena信号无法正确传递的问题

## 项目架构目录

### 主要目录结构

```
cpu31real/
├── cpupip31real/                 # Vivado项目主目录
│   ├── cpupip31real.xpr          # Vivado项目文件
│   ├── cpupip31real.srcs/        # 项目源文件
│   │   ├── sources_1/new/        # 核心Verilog源文件
│   │   ├── sim_1/new/            # 仿真文件
│   │   └── ip/                   # IP核文件
│   ├── cpupip31real.cache/       # Vivado缓存
│   ├── cpupip31real.hw/          # 硬件配置
│   ├── cpupip31real.runs/        # 编译运行文件
│   ├── cpupip31real.sim/         # 仿真运行文件
│   └── cpupip31real.ip_user_files/ # IP用户文件
├── test_scripts/                 # 自动化测试脚本
│   ├── vivado_auto_test.tcl      # Vivado自动化测试脚本
│   ├── simple_modelsim_batch.do  # ModelSim简化批处理脚本
│   ├── modelsim_basic_sim.do     # ModelSim基本仿真脚本
│   └── results/                  # 测试结果目录
├── testdata/                     # 测试数据目录
├── tests/                        # 测试汇编代码
├── tools/                        # 工具脚本
│   └── hex_to_coe.py             # 十六进制转COE格式转换工具
├── report/                       # 实验报告相关文件
├── readme.md                     # 项目说明文件
├── run_cpu_tests.do              # ModelSim批处理测试脚本
└── log                           # 日志目录（如果存在）
```

### 核心源文件说明 (cpupip31real/cpupip31real.srcs/sources_1/new/)

- **cpu.v**: CPU顶层模块，集成了所有流水线阶段和控制单元
- **board_top.v**: 板级顶层模块
- **mips_def.vh**: MIPS指令集定义头文件
- **alu.v**: 算术逻辑单元
- **regfile.v**: 寄存器文件
- **controller.v**: 控制器模块
- **forwarding.v**: 数据前递模块
- **pc.v**: 程序计数器模块
- **IMEM_ip.v**: 指令存储器IP模块
- **dmem.v**: 数据存储器模块
- **pipe_*.v**: 各级流水线寄存器模块
  - pipe_if.v: 取指级流水线寄存器
  - pipe_if_id.v: 取指-译码级流水线寄存器
  - pipe_id.v: 译码级流水线寄存器
  - pipe_id_ex.v: 译码-执行级流水线寄存器
  - pipe_ex.v: 执行级流水线寄存器
  - pipe_ex_mem.v: 执行-访存级流水线寄存器
  - pipe_mem.v: 访存级流水线寄存器
  - pipe_mem_wb.v: 访存-写回级流水线寄存器
  - pipe_wb.v: 写回级流水线寄存器
- **mux*.v**: 多路选择器模块
- **mult.v**: 乘法器模块
- **div.v**: 除法器模块
- **clz_counter.v**: 前导零计数器模块
- **cutter.v**: 数据切割模块
- **cp0.v**: CP0协处理器模块
- **compare.v**: 比较器模块
- **seg7x16.v**: 七段数码管显示模块
- **register.v**: 通用寄存器模块

### 测试相关目录

#### test_scripts/
该目录包含所有自动化测试脚本，支持Vivado和ModelSim环境下的批处理测试：

- **vivado_auto_test.tcl**: Vivado自动化测试脚本，自动遍历所有测试文件并进行批处理仿真
- **simple_modelsim_batch.do**: ModelSim简化批处理脚本，依次运行所有测试
- **modelsim_basic_sim.do**: ModelSim基本仿真脚本，用于快速单独测试
- **results/**: 存储测试结果的目录

#### testdata/
包含大量测试用例，覆盖各种MIPS指令：

- **数字_指令名称.hex.txt**: 测试程序的十六进制机器码
- **数字_指令名称.result.txt**: 对应的标准输出结果
- **数字_指令名称.txt**: 测试程序的汇编代码

目前包含超过100个测试用例，覆盖以下指令类型：
- 算术运算：add, addu, addi, addiu, sub, subu
- 逻辑运算：and, andi, or, ori, xor, xori, nor
- 移位运算：sll, sllv, srl, srlv, sra, srav, clz
- 比较运算：slt, sltu, slti, sltiu
- 跳转分支：j, jal, jr, jalr, beq, bne, bgez
- 加载存储：lw, sw, lb, sb, lh, sh, lbu, lhu, lwl, lwr, swl, swr
- 乘除法：mult, multu, div, divu
- 特殊指令：mfc0, mtc0, mfhi, mthi, mflo, mtlo
- 其他：lui, nop等

#### tests/
包含一些额外的手动测试文件：
- **test.asm**: 复杂的汇编测试程序

### 工具目录 (tools/)

- **hex_to_coe.py**: 十六进制转COE格式转换工具，支持单文件、批量和交互式转换

### 报告目录 (report/)

包含实验报告相关的LaTeX文档和截图：
- **实验一.tex**: 实验报告LaTeX源文件
- **实验一.pdf**: 生成的PDF报告
- **screenshot*.png**: 实验截图
- **tongji_logo.png**: 同济大学Logo

## 构建与测试

### 使用ModelSim进行测试
运行提供的批处理脚本来执行所有测试：
```bash
vsim -c -do run_cpu_tests.do
```

### 使用Vivado进行测试
在Vivado的Tcl控制台中运行：
```tcl
source test_scripts/vivado_auto_test.tcl
```

## 开发约定

- 所有Verilog文件遵循标准命名规范，模块名与文件名保持一致
- 流水线设计严格按照IF-ID-EX-MEM-WB五个阶段进行划分
- 使用统一的信号命名约定，便于维护和理解
- 代码中包含详细的注释说明，特别是对于复杂的控制逻辑

## 注意事项

- 项目中仍存在一些未修复的bug，如lbsb, lh, sh指令无法正常运行
- 项目使用延迟分支的方式执行分支和跳转指令
- 为了确保正确的时钟使能控制，使用ena信号控制时钟启动而非直接数据流控制