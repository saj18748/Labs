// Ejercicio #5  memoria rom con un case

module ROM (address, enable, read, data);

input [3:0] address ;
input read, enable;
output  [7:0] data;

reg [7:0]data ;

always @ ( enable or read or address ) begin

	case (address)
	0 : data = 10;
	 1 : data = 55;
	 2 : data = 244;
	 3 : data = 0;
	 4 : data = 1;
	 5 : data = 8'hff;
	 6 : data = 8'h11;
	 7 : data = 8'h1;
	 8 : data = 8'h10;
	 9 : data = 8'h0;
	 10 : data = 8'h10;
	 11 : data = 8'h15;
	 12 : data = 8'h60;
	 13 : data = 8'h90;
	 14 : data = 8'h70;
	 15 : data = 8'h90;

	endcase
end

endmodule //ROM
