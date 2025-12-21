# ModelSim Batch Script for 5-Stage Pipeline CPU Testing

# Clean up any existing libraries and files
if {[file exists work]} {
    vdel -lib work -all
}
# Don't delete transcript and vsim.wlf as they might be in use
# Clean up any old result files if they exist
catch {file delete _246tb_ex10_result.txt}

# Create fresh working library
vlib work

# Compile IP core files first (these are required for the design to work)
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/ip/ram_8bit/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/ip/ram_8bit/sim/ram_8bit.v

# Compile source files for 5-stage pipeline CPU
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/mips_def.vh
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/alu.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/board_top.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/clz_counter.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/compare.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/controller.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/cp0.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/cutter.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/div.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/dmem.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/forwarding.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/mult.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/mux2_32.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/mux2_5.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/mux4_32.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/mux8_32.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pc.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_ex.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_ex_mem.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_id.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_id_ex.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_if.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_if_id.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_mem.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_mem_wb.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/pipe_wb.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/regfile.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/register.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/seg7x16.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/cpu.v
vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sim_1/new/testbench.v

# Create results directory using Tcl commands
set results_dir "./test_scripts/results"
if {![file exists $results_dir]} {
    file mkdir $results_dir
}

# Automatically discover all .hex.txt test files in the testdata directory
proc get_test_files {} {
    set hex_files [glob -nocomplain -directory "./testdata" "*.hex.txt"]
    set result {}

    foreach file $hex_files {
        # Convert absolute path back to relative path format
        set rel_file [string map {"./testdata/" "testdata/"} $file]
        lappend result $rel_file
    }

    # Sort the files for consistent ordering
    set sorted_result [lsort $result]
    return $sorted_result
}

# Get all test files dynamically
set test_files [get_test_files]

# Display how many test files were found and list them
puts "Found [llength $test_files] test files to run:"
foreach test_file $test_files {
    puts "  - $test_file"
}
puts ""

# Procedure to run a single test
proc run_single_test {test_file results_dir} {
    # Get test name without extension
    set test_name [file rootname [file tail $test_file]]
    set test_name [string map {.hex ""} $test_name]

    puts "\n-----------------------------"
    puts "RUNNING TEST: $test_file"
    puts "-----------------------------"

    # Clean up any old result files before starting the test
    if {[file exists ./_246tb_ex10_result.txt]} {
        catch {file delete ./_246tb_ex10_result.txt}
    }

    # Backup original IMEM_ip.v
    file copy -force ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v.bak

    # Read the original IMEM_ip.v
    set fid [open "./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v" r]
    set content [read $fid]
    close $fid

    # Replace the readmemh line with the current test file
    set lines [split $content "\n"]
    set new_lines {}
    foreach line $lines {
        if {[string match "*\$readmemh*" $line] && [string match "*IMEMreg*" $line] && [string match "*//*" [string trimleft $line]] == 0} {
            # Found the active $readmemh line, replace it
            lappend new_lines "        \$readmemh(\"E:/Homeworks/cpu31real/$test_file\", IMEMreg);"
        } else {
            lappend new_lines $line
        }
    }

    set new_content [join $new_lines "\n"]

    # Write the modified IMEM_ip.v
    set fid [open "./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v" w]
    puts -nonewline $fid $new_content
    close $fid

    # Recompile only IMEM_ip.v and the testbench
    vlog -work work -quiet ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v

    # Load and run simulation
    vsim -quiet work.testbench

    # Run simulation for maximum 100000ns, but check for halt condition
    run 100000ns

    # Copy the test result file to the results directory
    set sim_result_file "./_246tb_ex10_result.txt"
    set output_result_file "$results_dir/${test_name}_sim_result.txt"

    if {[file exists $sim_result_file]} {
        file copy -force $sim_result_file $output_result_file
        puts "Saved simulation result to: $output_result_file"
    } else {
        puts "Warning: Simulation result file not found: $sim_result_file"
    }

    # Restore original IMEM_ip.v
    file copy -force ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v.bak ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v
    file delete ./cpupip31real/cpupip31real.srcs/sources_1/new/IMEM_ip.v.bak

    # Use existing standard result file from testdata/
    set original_std_result_file "$test_file"
    regsub {\.hex\.txt$} $original_std_result_file ".result.txt" std_result_file

    # Copy standard result file to the results directory
    set output_std_result_file "$results_dir/${test_name}_std_result.txt"
    if {[file exists $std_result_file]} {
        file copy -force $std_result_file $output_std_result_file
        puts "Standard test result copied to: $output_std_result_file"
    } else {
        puts "Standard result file not found: $std_result_file"
        return 0
    }

    # Compare simulation result with standard result using external tool
    set compare_result [catch {exec txt_compare --file1 $output_result_file --file2 $std_result_file --display detailed > "$results_dir/${test_name}_comparison_result.txt"} compare_output]

    # Check the comparison result
    set comp_file "$results_dir/${test_name}_comparison_result.txt"
    if {[file exists $comp_file]} {
        set comp_fid [open $comp_file r]
        set comp_content [read $comp_fid]
        close $comp_fid

        # 检查是否包含成功的输出行
        set lines [split $comp_content "\n"]
        set success 0
        foreach line $lines {
            # 检查是否包含"在指定检查条件下完全一致."
            if {[string match "*在指定检查条件下完全一致.*" $line]} {
                set success 1
                break
            }
        }

        if {$success} {
            puts "RESULT: PASS - $test_file"
            return 1
        } else {
            puts "RESULT: FAIL - $test_file"

            # 输出失败的具体信息
            puts "Comparison output:"
            puts "=================================================================================="
            puts $comp_content
            puts "=================================================================================="

            return 0
        }
    } else {
        puts "Comparison result file not found: $comp_file"
        return 0
    }
}

# Run all tests
set total_tests [llength $test_files]
set pass_count 0

puts "Starting batch simulation for $total_tests tests..."

foreach test_file $test_files {
    set result [run_single_test $test_file $results_dir]
    if {$result == 1} {
        incr pass_count
    }
}

# Generate final summary
set summary_text [subst "BATCH TEST SUMMARY\n==================================\nTotal tests: $total_tests\nPassed tests: $pass_count\nFailed tests: [expr $total_tests - $pass_count]\nSuccess rate: [format %.2f [expr double($pass_count)*100/double($total_tests)]]%\n=================================="]

puts "\n$summary_text"

# Write summary to file
set sum_fid [open "$results_dir/test_summary.txt" w]
puts $sum_fid $summary_text
close $sum_fid

puts "\nAll tests completed. Results saved in $results_dir/"
puts "Success rate: [format %.2f [expr double($pass_count)*100/double($total_tests)]]%"

# Quit ModelSim
quit