// Ejercicio #4 -- Buffer tri-estado
//Buffer tri-estado de un Bit

module BUTRI_1bit (input inp,enable, output reg salida);

	always @ (inp)
		if (inp && enable) begin
		salida <= 1;
		end
		else if (~inp && enable) begin
		salida <= 0;
		end
		else begin
		salida <= 1'bz;

	end

endmodule //BUTRI_1bit

// Buffer tri-estado de 4 bits

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
