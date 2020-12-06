/******************************************************************
* Description
* Version:
*	1.0
* Authors:
*	Mauricio Duran
*	Ivan Iturbe
******************************************************************/

module Hazard_Unit
(	
	input EX_mem_read,
	input [4:0] ID_reg_rs,
	input [4:0] ID_reg_rt,
	input [4:0] EX_reg_rt,
	input MEM_branch_i,
	input MEM_jump_i,
	input MEM_jr_i,
	output pc_write_o,
	output IF_ID_write_o,
	output stall_o,
	output IF_ID_flush,
	output ID_EX_flush,
	output EX_MEM_flush
);


	assign pc_write_o 		= (EX_mem_read==1 && (ID_reg_rs==EX_reg_rt || ID_reg_rt==EX_reg_rt))? 1'b0:1'b1;
	assign IF_ID_write_o 	=  (EX_mem_read==1 && (ID_reg_rs==EX_reg_rt || ID_reg_rt==EX_reg_rt))? 1'b0:1'b1;
	assign stall_o 			=  (EX_mem_read==1 && (ID_reg_rs==EX_reg_rt || ID_reg_rt==EX_reg_rt))? 1'b1:1'b0;

	assign IF_ID_flush		= (MEM_jump_i || MEM_jr_i || MEM_branch_i)? 1'b1: 1'b0;
	assign ID_EX_flush		= (MEM_jump_i || MEM_jr_i || MEM_branch_i)? 1'b1: 1'b0;
	assign EX_MEM_flush		= (MEM_jump_i || MEM_jr_i || MEM_branch_i)? 1'b1: 1'b0;
	
endmodule 
