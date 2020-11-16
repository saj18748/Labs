// Ejercicio #2 - Laboratorio #10
// Implementacion de 2 bus driver , acumulador y ALU

// ------------------------- Bus driver ----------------------------------------------------------------------

module BUTRI_4bits (input [3:0]A, input E, output [3:0]Y);

reg [3:0]Y;

always @ ( A )
	if (A && E) begin
	Y <= 1;
	end
	else if (~A && E) begin
	Y <= 0;
	end
	else begin
	Y <= 1'bz;

end

endmodule //BUTRI

//--------------------------------------------------------------------------------------------------------------

// --------------------------- acumulador -----------------------------------------------------------------


//-------------------------------------------------------------------------------------------------------------

//---------------------------- ALU  -------------------------------------------------------------------------

// Laboratorio #8 -- ALU

module ALU1 (input [3:0] A,input[3:0] B, output [3:0] Y);

reg v_temp;
reg [3:0] y_temp;
reg [4:0] temp;

assign Y = temp[3:0];


//inicio de la ALU
always @ (A,B) begin

case(B)  // Case para las operaciones logicas

  3'b000: temp = A;
  3'b001: temp = B;
  3'b010: temp = A+B;
  3'b011: temp = A-B;
  3'b100: temp = ~(A&B);
  default: temp = 0;

endcase

end

endmodule
//-------------------------------------------------------------------------------------------------------------

// ------------------------- Bus driver  -------------------------------------------------------------------

module BUTRI_42bits (input [3:0]A, input E, output [3:0]Y);

reg [3:0]Y;

always @ ( A )
	if (A && E) begin
	Y <= 1;
	end
	else if (~A && E) begin
	Y <= 0;
	end
	else begin
	Y <= 1'bz; 

end

endmodule //BUTRI2
