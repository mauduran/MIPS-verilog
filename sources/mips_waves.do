onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk_tb
add wave -noupdate /MIPS_Processor_TB/reset_tb
add wave -noupdate /MIPS_Processor_TB/alu_result_tb
add wave -noupdate -expand -group ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROM/address_i
add wave -noupdate -expand -group ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROM/instruction_o
add wave -noupdate -expand -group REGISTER_FILE /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/reg_write_i
add wave -noupdate -expand -group REGISTER_FILE -label t0 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t0/data_o
add wave -noupdate -expand -group REGISTER_FILE -label t1 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t1/data_o
add wave -noupdate -expand -group REGISTER_FILE -label t2 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t2/data_o
add wave -noupdate -expand -group REGISTER_FILE -label t3 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t3/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ps} 0}
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
WaveRestoreZoom {0 ps} {19 ps}
