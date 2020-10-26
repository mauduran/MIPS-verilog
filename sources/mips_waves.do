onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk_tb
add wave -noupdate /MIPS_Processor_TB/reset_tb
add wave -noupdate -radix decimal /MIPS_Processor_TB/alu_result_tb
add wave -noupdate -expand -group PROGRAM_COUNTER -radix hexadecimal /MIPS_Processor_TB/DUV/PC/new_pc_i
add wave -noupdate -expand -group PROGRAM_COUNTER -radix hexadecimal /MIPS_Processor_TB/DUV/PC/pc_value_o
add wave -noupdate -group ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROM/address_i
add wave -noupdate -group ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROM/instruction_o
add wave -noupdate -group REGISTER_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/reg_write_i
add wave -noupdate -group REGISTER_FILE -label t0 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t0/data_o
add wave -noupdate -group REGISTER_FILE -label t1 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t1/data_o
add wave -noupdate -group REGISTER_FILE -label t2 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t2/data_o
add wave -noupdate -group REGISTER_FILE -label t3 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t3/data_o
add wave -noupdate -group REGISTER_FILE -label s7 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s7/data_o
add wave -noupdate -group REGISTER_FILE -color Yellow -label sp -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/sp/data_o
add wave -noupdate -group ALU -radix binary /MIPS_Processor_TB/DUV/ALU_UNIT/alu_operation_i
add wave -noupdate -group ALU -radix decimal /MIPS_Processor_TB/DUV/ALU_UNIT/a_i
add wave -noupdate -group ALU -radix decimal /MIPS_Processor_TB/DUV/ALU_UNIT/b_i
add wave -noupdate -group ALU -radix decimal /MIPS_Processor_TB/DUV/ALU_UNIT/zero_o
add wave -noupdate -group ALU -radix decimal /MIPS_Processor_TB/DUV/ALU_UNIT/alu_data_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/opcode_i
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/reg_dst_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/branch_eq_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/branch_ne_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_read_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_to_reg_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_write_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/alu_src_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/reg_write_o
add wave -noupdate -expand -group CONTROL_UNIT /MIPS_Processor_TB/DUV/CONTROL_UNIT/alu_op_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {76 ps} 0}
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
WaveRestoreZoom {70 ps} {102 ps}
