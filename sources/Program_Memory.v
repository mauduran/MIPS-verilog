/******************************************************************
* Description
*	This is  a ROM memory that represents the program memory. 
* 	Internally, the memory is read without a signal clock. The initial 
*	values (program) of this memory are written from a file named text.dat.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/
module Program_Memory
#
(
	parameter MEMORY_DEPTH = 256,
	parameter DATA_WIDTH = 32
)
(
	input [(DATA_WIDTH-1):0] address_i,
	output reg [(DATA_WIDTH-1):0] instruction_o
);



wire [(DATA_WIDTH-1):0] real_address_r;
//Se agfega formula para restar 400_000 al pc de entrada 
//y shift left right para dividir entre 4													
assign real_address_r = (address_i[(DATA_WIDTH-1):0]-32'h400000)>>2 ;


	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[MEMORY_DEPTH-1:0];

	initial
	begin
		$readmemh("C:/MIPS/sources/test.dat", rom);
	end

	always @ (real_address_r)
	begin
		instruction_o = rom[real_address_r];
	end

endmodule
