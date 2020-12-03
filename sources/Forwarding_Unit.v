/******************************************************************
* Description
* Version:
*	1.0
* Authors:
*	Mauricio Duran
*	Ivan Iturbe
******************************************************************/

module Forwarding_Unit
(	
	input MEM_reg_write,
	input WB_reg_write,
	input [4:0] MEM_reg_rd,
	input [4:0] WB_reg_rd,
	input [4:0] EX_reg_rt,
	input [4:0] EX_reg_rs,
	input [5:0] EX_opcode,
	output [1:0] forward_A,
	output [1:0] forward_B
);


	assign forward_A 		= (MEM_reg_write==1 && MEM_reg_rd!=0 && MEM_reg_rd==EX_reg_rs)? 2'b10: 
								  (WB_reg_write==1 && WB_reg_rd!=0 && WB_reg_rd==EX_reg_rs)? 2'b01: 2'b00;

	assign forward_B 		= (MEM_reg_write==1 && MEM_reg_rd!=0 && MEM_reg_rd==EX_reg_rt)? 2'b10: 
								  (WB_reg_write==1 && WB_reg_rd!=0 && WB_reg_rd==EX_reg_rt)? 2'b01: 2'b00; //EX_opcode==0 

endmodule 
