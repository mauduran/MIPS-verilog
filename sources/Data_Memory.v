/******************************************************************
* Description
*	This is the data memory for the MIPS processor
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/

module Data_Memory 
//Previemante tiene valor de 8
#(	parameter DATA_WIDTH=32,
	parameter MEMORY_DEPTH = 256

)
(
	input [DATA_WIDTH-1:0] write_data_i,
	input [DATA_WIDTH-1:0]  address_i,
	input mem_write_i,mem_read_i, clk,
	output  [DATA_WIDTH-1:0]  data_o
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[MEMORY_DEPTH-1:0];
	wire [DATA_WIDTH-1:0] read_data_aux;
	wire [DATA_WIDTH-1:0] real_address;
	
	//assign real_address = (address_i-32'h10010000)>>2;
	assign real_address = {24'b 0,address_i[7:0]}>>2;

	always @ (posedge clk)
	begin
		// Write
		if (mem_write_i)
			ram[real_address] <= write_data_i;
	end
	assign read_data_aux = ram[real_address];
  	assign data_o = {DATA_WIDTH{mem_read_i}}& read_data_aux;
	


endmodule
