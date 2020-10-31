// Testbench
`define simulation

module testbench ();

reg [3:0]address;
reg read,enable;

wire [7:0]data;

ROM U1(address, enable, read, data);

initial begin

$display("Memoria ROM");
	$display("address |  data");         // se muestan los datos en el diagrama de timing
	$monitor("%d\t%d\t",address, data);

	#5 	address=0;
	#5 	address=1;
	#5 	address=2;
	#5 	address=3;
	#5 	address=4;
	#5 	address=5;
	#5 	address=6;
	#5 	address=7;
	#5 	address=8;
	#5 	address=9;
	#5 	address=10;
	#5 	address=11;
	#5 	address=12;
	#5 	address=13;
	#5 	address=14;
	#5 	address=15;

end

initial begin
	$dumpfile("ROOM_tb.vcd");
	$dumpvars(0, testbench);
end

endmodule //Testbench
