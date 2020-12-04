/******************************************************************
* Description
* Version:
*	1.0
* Authors:
*	Mauricio Duran
*	Ivan Iturbe
*This unit controls stalls the pc unit, the if/id pipeline register and assigns 0 to the control flags for lw 
data hazard detection.
******************************************************************/

module Hazard_Unit
(	
	input EX_mem_read,
	input [4:0] ID_reg_rs,
	input [4:0] ID_reg_rt,
	input [4:0] EX_reg_rt,
	output pc_write_o,
	output IF_ID_write_o,
	output stall_o
);


	assign pc_write_o 		= (EX_mem_read==1 && (ID_reg_rs==EX_reg_rt || ID_reg_rt==EX_reg_rt))? 1'b0:1'b1;
	assign IF_ID_write_o 	=  (EX_mem_read==1 && (ID_reg_rs==EX_reg_rt || ID_reg_rt==EX_reg_rt))? 1'b0:1'b1;
	assign stall_o 			=  (EX_mem_read==1 && (ID_reg_rs==EX_reg_rt || ID_reg_rt==EX_reg_rt))? 1'b1:1'b0;

endmodule 
