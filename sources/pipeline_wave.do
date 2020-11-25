onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /MIPS_Processor_TB/clk_tb
add wave -noupdate -label s0 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s0/data_o
add wave -noupdate -label s1 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s1/data_o
add wave -noupdate -label s2 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s2/data_o
add wave -noupdate -label s3 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s3/data_o
add wave -noupdate -label t0 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t0/data_o
add wave -noupdate -label t1 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t1/data_o
add wave -noupdate -label t2 /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t2/data_o
add wave -noupdate -label IF/ID /MIPS_Processor_TB/DUV/IF_ID_PIPELINE/dataOut
add wave -noupdate -label ID/EX /MIPS_Processor_TB/DUV/ID_EX_PIPELINE/dataOut
add wave -noupdate -label EX/MEM /MIPS_Processor_TB/DUV/EX_MEM_PIPELINE/dataOut
add wave -noupdate -label MEM/WB /MIPS_Processor_TB/DUV/MEM_WB_PIPELINE/dataOut
add wave -noupdate -label ALU_RESULT /MIPS_Processor_TB/DUV/ALU_UNIT/alu_data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 232
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {8 ps} {27 ps}
