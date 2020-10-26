onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk_tb
add wave -noupdate /MIPS_Processor_TB/reset_tb
add wave -noupdate -radix decimal -childformat {{{/MIPS_Processor_TB/alu_result_tb[31]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[30]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[29]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[28]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[27]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[26]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[25]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[24]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[23]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[22]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[21]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[20]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[19]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[18]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[17]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[16]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[15]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[14]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[13]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[12]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[11]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[10]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[9]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[8]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[7]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[6]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[5]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[4]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[3]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[2]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[1]} -radix decimal} {{/MIPS_Processor_TB/alu_result_tb[0]} -radix decimal}} -subitemconfig {{/MIPS_Processor_TB/alu_result_tb[31]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[30]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[29]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[28]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[27]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[26]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[25]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[24]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[23]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[22]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[21]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[20]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[19]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[18]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[17]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[16]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[15]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[14]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[13]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[12]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[11]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[10]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[9]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[8]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[7]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[6]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[5]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[4]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[3]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[2]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[1]} {-radix decimal} {/MIPS_Processor_TB/alu_result_tb[0]} {-radix decimal}} /MIPS_Processor_TB/alu_result_tb
add wave -noupdate -expand -group PROGRAM_COUNTER -radix hexadecimal /MIPS_Processor_TB/DUV/PC/new_pc_i
add wave -noupdate -expand -group PROGRAM_COUNTER -radix hexadecimal /MIPS_Processor_TB/DUV/PC/pc_value_o
add wave -noupdate -expand -group ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROM/address_i
add wave -noupdate -expand -group ROM -radix binary /MIPS_Processor_TB/DUV/ROM/instruction_o
add wave -noupdate -expand -group REGISTERS -label zero /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/Zero/data_o
add wave -noupdate -expand -group REGISTERS /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/reg_write_i
add wave -noupdate -expand -group REGISTERS -label s0 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s0/data_o
add wave -noupdate -expand -group REGISTERS -label s1 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s1/data_o
add wave -noupdate -expand -group REGISTERS -label s2 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s2/data_o
add wave -noupdate -expand -group REGISTERS -label s3 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s3/data_o
add wave -noupdate -expand -group REGISTERS -label t0 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t0/data_o
add wave -noupdate -expand -group REGISTERS -label t1 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t1/data_o
add wave -noupdate -expand -group REGISTERS -label t2 -radix hexadecimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t2/data_o
add wave -noupdate -expand -group REGISTERS -color Yellow -label sp -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/sp/data_o
add wave -noupdate -expand -group ALU -radix binary /MIPS_Processor_TB/DUV/ALU_UNIT/alu_operation_i
add wave -noupdate -expand -group ALU -radix hexadecimal /MIPS_Processor_TB/DUV/ALU_UNIT/a_i
add wave -noupdate -expand -group ALU -radix hexadecimal /MIPS_Processor_TB/DUV/ALU_UNIT/b_i
add wave -noupdate -expand -group ALU -radix decimal /MIPS_Processor_TB/DUV/ALU_UNIT/zero_o
add wave -noupdate -expand -group ALU -radix decimal /MIPS_Processor_TB/DUV/ALU_UNIT/alu_data_o
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/SIGNED_EXTEND_FOR_CONSTANTS/sign_extend_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/opcode_i
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/reg_dst_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/branch_eq_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/branch_ne_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_read_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_to_reg_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_write_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/alu_src_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/reg_write_o
add wave -noupdate -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/alu_op_o
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/reg_write_i
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/write_register_i
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_register_1_i
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_register_2_i
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/write_data_i
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_data_1_o
add wave -noupdate -group REG_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_data_2_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 77
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {17 ps} {25 ps}
