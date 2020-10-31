// Testbench
`define simulation

module testbench ();

// declaracion de las variables
reg [6:0]address;

wire [12:0]data;

ROM U1(address, data);  // se llaman las variables de la programacion principal

// Inicio de la simulacion para el despliege de los datos
initial begin

$display("Memoria ROM");
	$display("address |  data");
	$monitor("%d\t%d\t",address, data);

	#5 	address = 7'bxxxxxx0;
	#5  address = 7'b00001x1;
	#5  address = 7'b1111xx1;
	#5 address = 	7'b00000x1;
	#5  address = 7'b1110xx1;
	#5  address = 7'b1111111;
	#40 $finish ;

end

initial begin			// se muestan los datos en el diagrama de timing
	$dumpfile("ROOM_tb.vcd");
	$dumpvars(0, testbench);
end

endmodule //Testbench
