/******************************************************************
* Description
*	This is a pipeline register, takes N bits as input and passes them to N bits
*	Output when clock signal goes down. 
* Version:
*	1.0
* Authors:
*	Mauricio Duran
*	Ivan Iturbe
******************************************************************/

module Pipeline_Register 
#
(
	parameter N = 32

)
(	
	input clk,
	input reset,
	input [N-1:0] dataIn,
	output reg [N-1:0] dataOut
);



//Se hace switch case para realizar operaciones segun sea necesario  
   always @ (negedge clk)
     begin
		if(reset==0)
			dataOut <= 0;
		else
			dataOut <= dataIn;
     end
	  
endmodule 
