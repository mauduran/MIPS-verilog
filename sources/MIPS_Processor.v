/******************************************************************
* Description
*	This is the top-level of a MIPS processor that can execute the next set of instructions:
*		add
*		addi
*		sub
*		ori
*		or
*		bne
*		beq
*		and
*		nor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 256
)
(
	// Inputs
	input clk,
	input reset,
	// Output
	output [31:0] alu_result_o
);
//******************************************************************/
//******************************************************************/
// Data types to connect modules


//

wire reg_dst_w;
wire alu_src_w;
wire reg_write_w;
wire zero_w;
wire [2:0] alu_op_w;
wire [3:0] alu_operation_w;
wire [4:0] write_register_w;
wire [4:0] i_or_r_write_register_w;
wire [31:0] pc_w;
wire [31:0] instruction_w;
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;
wire [31:0] inmmediate_extend_w;
wire [31:0] read_ata_2_r_nmmediate_w;
wire [31:0] alu_result_w;
wire [31:0] pc_plus_4_w;

// Wires agregados para conectar componentes que no
// existian o que no estaban conectados
wire mem_read_w;
wire mem_write_w;
wire mem_to_reg_w;
wire [31:0] read_data_out_w;
wire [31:0] read_data_or_alu_result_w;
wire [31:0] shift_branch_w;
wire [31:0] pc_branch_w;
wire [31:0] new_pc_w;
wire [31:0] pc_branch_or_jump_w;
wire [31:0] pc_or_branch_w;
wire branch_eq_w;
wire branch_ne_w;
wire jump_w;
wire jr_w;
wire [27:0] instruction_jump_shift_w;
wire [31:0] write_data_w;

//***************************PIPELINE******************************/


//***************************WIRES FOR IF/ID************************/
wire [31:0] ID_instr_w;
wire [31:0] ID_pc_4_w;

//***************************WIRES FOR ID/EX************************/

//Wires Control Unit
wire EX_reg_dst_w;			//
wire EX_branch_ne_w;			//
wire EX_branch_eq_w;			//
wire [2:0] EX_alu_op_w;		//
wire EX_alu_src_w;			//
wire EX_reg_write_w;
wire EX_mem_read_w;
wire EX_mem_to_reg_w;
wire EX_mem_write_w;
wire EX_jump_w;

//Total 12 bits

//Wires Register Fil
wire [31:0] EX_read_data_1_w;
wire [31:0] EX_read_data_2_w;

//Total 64 bits


// Wire for sign extend
wire [31:0] EX_immediate_extend_w;
//Total 32 bits

// Wires coming from previous stage

wire [31:0] EX_instr_w;
wire [31:0] EX_pc_4_w;
//Total 64 bits

// Write register
wire [4:0] EX_write_reg;

//***************************WIRES FOR EX/MEM************************/
//Control_Unit
wire MEM_branch_ne_w;			//
wire MEM_branch_eq_w;
wire MEM_reg_dst_w;					
wire MEM_reg_write_w;
wire MEM_mem_read_w;
wire MEM_mem_to_reg_w;
wire MEM_mem_write_w;
wire MEM_jump_w;

//total 8//

//Wire salida ALU COntrol
wire MEM_jr_w;

//Wire salida ALU
wire [31:0]MEM_alu_result_w;
wire MEM_zero_w;


//Wire Reg file
wire [31:0]MEM_read_data_1_w;
wire [31:0]MEM_read_data_2_w;

//Wire PC
wire [31:00]MEM_pc_4_w;
wire [31:00]MEM_pc_branch_w;

//Wire instr
wire [31:0] MEM_instr_w;

// Write register
wire [4:0] MEM_write_reg;


////TOTAL 170/////

//***************************WIRES FOR MEM/WB************************/

//Wires control unit
wire WB_reg_dst_w;					
wire WB_reg_write_w;
wire WB_mem_to_reg_w;
wire WB_jump_w;

//Wires Data Memory
wire [31:0] WB_read_data_w;

//ALU
wire [31:0] WB_alu_result_w;

//Instruction
wire [31:0] WB_instr_w;

//Wire PC
wire [31:0] WB_pc_4_w;

// Write register
wire [4:0] WB_write_reg;


//Forwarding Unit
wire [1:0] forward_A_sel_w;
wire [1:0] forward_B_sel_w;
wire [31:0] ALU_input_A_w;
wire [31:0] ALU_input_B_w;


//Hazard Unit
wire pc_write_w;
wire IF_ID_write_w;
wire stall_w;

//Wires  Hazard Detection
wire HZ_reg_dst_w;			//
wire HZ_branch_ne_w;			//
wire HZ_branch_eq_w;			//
wire [2:0] HZ_alu_op_w;		//
wire HZ_alu_src_w;			//
wire HZ_reg_write_w;
wire HZ_mem_read_w;
wire HZ_mem_to_reg_w;
wire HZ_mem_write_w;
wire HZ_jump_w;

wire IF_ID_flush_w;
wire ID_EX_flush_w;
wire EX_MEM_flush_w;




//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/

//*******************PIPELINE REG IF/ID ***************************/
Pipeline_Register
#
(
	.N(64)
)
IF_ID_PIPELINE
(
	.enable(IF_ID_write_w),
	.clk(clk),
	.reset(reset),
	.flush(1'b0),
	.dataIn({pc_plus_4_w,instruction_w}),
	.dataOut({ID_pc_4_w,ID_instr_w})
);


////ID/EX
Pipeline_Register
#
(
	.N(177)
)
ID_EX_PIPELINE
(
	.enable(1'b1),
	.clk(clk),
	.reset(reset),
	.flush(ID_EX_flush_w),
	.dataIn({ i_or_r_write_register_w, HZ_reg_dst_w, HZ_branch_ne_w, HZ_branch_eq_w, HZ_alu_op_w, HZ_alu_src_w, 
		HZ_reg_write_w,HZ_mem_read_w, HZ_mem_to_reg_w, HZ_mem_write_w, HZ_jump_w, read_data_1_w,
		read_data_2_w, inmmediate_extend_w, ID_pc_4_w, ID_instr_w
	}),	
	.dataOut({EX_write_reg, EX_reg_dst_w, EX_branch_ne_w, EX_branch_eq_w,EX_alu_op_w, 
		EX_alu_src_w, EX_reg_write_w, EX_mem_read_w, EX_mem_to_reg_w, EX_mem_write_w, 
		EX_jump_w, EX_read_data_1_w, EX_read_data_2_w, EX_immediate_extend_w, 
		EX_pc_4_w, EX_instr_w})
);



////EX/MEM
Pipeline_Register
#
(
	.N(207)
)
EX_MEM_PIPELINE
(
	.enable(1'b1),
	.clk(clk),
	.reset(reset),
	.flush(EX_MEM_flush_w),
	.dataIn({EX_write_reg, ALU_input_A_w, jr_w, EX_reg_dst_w,EX_branch_ne_w, EX_branch_eq_w, EX_reg_write_w, 
		EX_mem_read_w, EX_mem_to_reg_w, EX_mem_write_w, 
		EX_jump_w,alu_result_w,zero_w,ALU_input_B_w,EX_pc_4_w,EX_instr_w,pc_branch_w }),	
	.dataOut({MEM_write_reg, MEM_read_data_1_w, MEM_jr_w, MEM_reg_dst_w, MEM_branch_ne_w, MEM_branch_eq_w,
		MEM_reg_write_w,MEM_mem_read_w, MEM_mem_to_reg_w, MEM_mem_write_w, 
		MEM_jump_w, MEM_alu_result_w,MEM_zero_w, MEM_read_data_2_w, MEM_pc_4_w, MEM_instr_w, MEM_pc_branch_w})
);


/////MEM/WB
Pipeline_Register
#
(
	.N(137)
)
MEM_WB_PIPELINE
(
	.enable(1'b1),
	.clk(clk),
	.reset(reset),
	.flush(1'b0),
	.dataIn({MEM_write_reg, MEM_reg_dst_w, MEM_reg_write_w, MEM_mem_to_reg_w, MEM_jump_w, 
				MEM_alu_result_w, read_data_out_w, MEM_pc_4_w , MEM_instr_w}),	
	.dataOut({WB_write_reg, WB_reg_dst_w, WB_reg_write_w, WB_mem_to_reg_w, WB_jump_w, 
				WB_alu_result_w,WB_read_data_w, WB_pc_4_w, WB_instr_w})
);


Control
CONTROL_UNIT
(
	.opcode_i(ID_instr_w[31:26]),
	.reg_dst_o(reg_dst_w),
	.branch_ne_o(branch_ne_w),
	.branch_eq_o(branch_eq_w),
	.alu_op_o(alu_op_w),
	.alu_src_o(alu_src_w),
	.reg_write_o(reg_write_w),
	.mem_read_o(mem_read_w),// bandera para cuando se lee de memoria
	.mem_to_reg_o(mem_to_reg_w),//bandera para cuando se escribe de memoria en registro
	.mem_write_o(mem_write_w),//bandera para cuando se escribe de memoria
	.jump_o(jump_w)//bandera para indicar cuando se hace un j o jal.
);

//Se agrega hazard detection unit
//Unidad de deteccion de dependencia de datos con lw.
Hazard_Unit
Hazard_Unit
(
	 .EX_mem_read(EX_mem_read_w),
	 .ID_reg_rs(ID_instr_w[25:21]),
	 .ID_reg_rt(ID_instr_w[20:16]),
	 .EX_reg_rt(EX_instr_w[20:16]),
	 .MEM_branch_i((MEM_zero_w & MEM_branch_eq_w) | (~MEM_zero_w & MEM_branch_ne_w)),
	 .MEM_jump_i(MEM_jump_w),
	 .MEM_jr_i(MEM_jr_w),
	 .pc_write_o(pc_write_w),
	 .IF_ID_write_o(IF_ID_write_w),
	 .stall_o(stall_w),
	 .IF_ID_flush(IF_ID_flush_w),
	 .ID_EX_flush(ID_EX_flush_w),
	 .EX_MEM_flush(EX_MEM_flush_w)
);

//Multiplexor para asignar valores normales o 0 a banderas de control
//segun deba hacerse un stall.
Multiplexer_2_to_1
#(
	.N_BITS(12)
)
MUX_CONTROL_OR_STALL
(
	.selector_i(stall_w),
	.data_0_i({reg_dst_w, branch_ne_w, branch_eq_w, alu_op_w, alu_src_w, reg_write_w,
		mem_read_w, mem_to_reg_w, mem_write_w, jump_w}),
	.data_1_i(12'b0),
	.mux_o({HZ_reg_dst_w, HZ_branch_ne_w, HZ_branch_eq_w, HZ_alu_op_w, HZ_alu_src_w, HZ_reg_write_w,
		HZ_mem_read_w, HZ_mem_to_reg_w, HZ_mem_write_w, HZ_jump_w})

);
///

Program_Counter
PC
(
	.clk(clk),
	.reset(reset),
	.enable(pc_write_w),
	.new_pc_i(new_pc_w),
	.pc_value_o(pc_w)
);

Program_Memory
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROM
(
	.address_i(pc_w),
	.instruction_o(instruction_w)
);



Adder
PC_Puls_4
(
	.data_0_i(pc_w),
	.data_1_i(32'h4),
	
	.result_o(pc_plus_4_w)
);

//Instancia  left para determinar el salto de branch
//Recibe intradas de Sign Extend
 Shift_Left_2 
 BRANCH_ADDRESS_SHIFT_LEFT
(   
  .data_i(EX_immediate_extend_w),
  .data_o(shift_branch_w)

);

//Se crea sumador para sumar el pc+4 y el salto requerido del branch.
Adder
PC_ADD_BRANCH
(
	.data_0_i(EX_pc_4_w),
	.data_1_i(shift_branch_w),
	
	.result_o(pc_branch_w)
);

//Multiplexor para elegir entre el pc+4 o salto de branch
//Se agregan compuertas logicas para beq o bne y realizar salto 
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_PC_OR_BRANCH
(
	.selector_i((MEM_zero_w & MEM_branch_eq_w) | (~MEM_zero_w & MEM_branch_ne_w)),
	.data_0_i(pc_plus_4_w),
	.data_1_i(MEM_pc_branch_w),
	
	.mux_o(pc_or_branch_w)

);
 
//

//Shift left para agregar 2 bits a la derecha 
//para reflejar que es una diferencia de 4 entre una direccion y la siguiente
assign instruction_jump_shift_w = MEM_instr_w[25:0]<<2;

//Multiplexor para elegir entre jump o pc+4/branch
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_JUMP_OR_PC
(
	.selector_i(MEM_jump_w),
	.data_0_i(pc_or_branch_w),
	.data_1_i({MEM_pc_4_w[31:28],instruction_jump_shift_w}),
	.mux_o(pc_branch_or_jump_w)

);

//Multiplexor para elegir entre jr o branch/jump/branch
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_BranchPCJump_Or_Jr
(
	.selector_i(MEM_jr_w),
	.data_0_i(pc_branch_or_jump_w),
	.data_1_i(MEM_read_data_1_w),
	.mux_o(new_pc_w)
);




//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Multiplexer_2_to_1
#(
	.N_BITS(5)
)
MUX_R_TYPE_OR_I_Type
(
	.selector_i(reg_dst_w),
	.data_0_i(ID_instr_w[20:16]),
	.data_1_i(ID_instr_w[15:11]),
	
	.mux_o(i_or_r_write_register_w)

);


/// Multiplexor para elegir entre MUX R_TYPE_OR_I_TYPE y registro 31 (ra)
//Va conectado al reg file

Multiplexer_2_to_1
#(
	.N_BITS(5)
)
MUX_Instruction_Type_OR_ra
(
	.selector_i(WB_jump_w),
	.data_0_i(WB_write_reg),
	.data_1_i(5'b11111),
	
	.mux_o(write_register_w)

);


Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.reg_write_i(WB_reg_write_w),
	.write_register_i(write_register_w),
	.read_register_1_i(ID_instr_w[25:21]),
	.read_register_2_i(ID_instr_w[20:16]),
	.write_data_i(write_data_w),
	.read_data_1_o(read_data_1_w),
	.read_data_2_o(read_data_2_w)

);


//Register File read data goes to jr multiplexor




Sign_Extend
SIGNED_EXTEND_FOR_CONSTANTS
(   
	.data_i(ID_instr_w[15:0]),
   .sign_extend_o(inmmediate_extend_w)
);



Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_READ_DATA_2_OR_IMMEDIATE
(
	.selector_i(EX_alu_src_w),
	.data_0_i(ALU_input_B_w),
	.data_1_i(EX_immediate_extend_w),
	
	.mux_o(read_ata_2_r_nmmediate_w)

);

//Se agrega bandera de jr
ALU_Control
ALU_CTRL
(
	.alu_op_i(EX_alu_op_w),
	.alu_function_i(EX_instr_w[5:0]),
	.alu_operation_o(alu_operation_w),
	.jr_o(jr_w)

);


//Unidad de deteccion de dependencia de datos 
Forwarding_Unit
Forwarding_Unit
(
	.MEM_reg_write(MEM_reg_write_w),
	.WB_reg_write(WB_reg_write_w),
	.MEM_reg_rd(MEM_write_reg),
	.WB_reg_rd(WB_write_reg),
	.EX_reg_rt(EX_instr_w[20:16]),
	.EX_reg_rs(EX_instr_w[25:21]),
	.forward_A(forward_A_sel_w),
	.forward_B(forward_B_sel_w)
);


//Multiplexor que toma selector de Forwarding A
Multiplexer_3_to_1
#(
	.N_BITS(32)
)
MUX_Forward_A_ALU_A
(
	.selector_i(forward_A_sel_w),
	.data_0_i(EX_read_data_1_w),
	.data_1_i(read_data_or_alu_result_w),
	.data_2_i(MEM_alu_result_w),
	.mux_o(ALU_input_A_w)

);

//Multiplexor que toma selector de Forwarding B
Multiplexer_3_to_1
#(
	.N_BITS(32)
)
MUX_Forward_B_ALU_B
(
	.selector_i(forward_B_sel_w),
	.data_0_i(EX_read_data_2_w),
	.data_1_i(read_data_or_alu_result_w),
	.data_2_i(MEM_alu_result_w),
	.mux_o(ALU_input_B_w)

);



//Se agrega shamt
ALU
ALU_UNIT
(
	.alu_operation_i(alu_operation_w),
	.a_i(ALU_input_A_w),
	.b_i(read_ata_2_r_nmmediate_w),
	.shamt(EX_instr_w[10:6]), /*Added shamt to ALU unit */
	.zero_o(zero_w),
	.alu_data_o(alu_result_w)
);

//Se instancia Data Memory para que sea nuestra RAM
Data_Memory 
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
RAM
(
	.write_data_i(MEM_read_data_2_w),
	.address_i(MEM_alu_result_w),
	.mem_write_i(MEM_mem_write_w),
	.mem_read_i(MEM_mem_read_w),
	.clk(clk),
	.data_o(read_data_out_w)
);
//Mux ubicado en salida de Data Memory para elegir 
//entre dato salido de memoria o ALU 
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_MEM_TO_REG_READ_DATA_OR_ALU_RESULT
(
	.selector_i(WB_mem_to_reg_w),
	.data_0_i(WB_alu_result_w),
	.data_1_i(WB_read_data_w),
	
	.mux_o(read_data_or_alu_result_w)

);

//MUX para elegir entre MUX_MEM_TO_REG_READ_DATA_OR_ALU_RESULT y PC+4 
//Se usa en jal para escribir registra ra en reg file.
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_PCplus4_OR_MUX_MemOrALUres
(
	.selector_i(WB_jump_w),
	.data_0_i(read_data_or_alu_result_w),
	.data_1_i(WB_pc_4_w),
	.mux_o(write_data_w)

);


assign alu_result_o = read_data_or_alu_result_w;


endmodule

