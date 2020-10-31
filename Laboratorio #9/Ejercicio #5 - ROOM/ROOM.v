// Ejercicio #5  memoria rom con un case

module ROM (address,  data);

// Se definene las variables
input [6:0] address ;
output  [12:0] data;

reg [12:0]data ;				// salida de 7 bits

always @ (  address ) begin  // inicio del always  para el case

	case (address)  // case de los datos guardados que puede desplegar el testbench

// datos de la tabla de la guia del laboratorio

	7'bxxxxxx0 : data = 13'b1000000001000;
	7'b00001x1 : data = 13'b0100000001000;
	7'b1111xx1: data = 13'b1011100100000;
	7'b00000x1: data = 13'b1000000001000;
	7'b1110xx1 : data = 13'b0011100000010;
	7'b1111111: data = 13'b1111111111111;


	endcase
end

endmodule //ROM
