// TESTBENCH
`define simulation

module testbench ();

reg inp, enable;
wire salida;

BUTRI_1bit U1(inp, enable, salida);

initial begin

	$display("Buffer tri-estado de un bit");
	$display(" Inp  Enable | Salida");
	$display("---------------");
	$monitor("  %b      %b    |  %b ",inp, enable, salida);
	inp = 0; enable = 1;

	#2 inp = 1; enable = 1;
	#2 inp = 1; enable = 1;
	#2 inp = 0; enable = 1;
	#2 inp = 1; enable = 1;

end

initial begin
	#100 $finish;
end

// testbench del buffer tri estado de 4 bits

reg A, E;
wire Y;

BUTRI_4bits U2(A, E, Y);

initial begin

	$display("Buffer tri-estado de un bit");
	$display(" A  E | Y");
	$display("---------------");
	$monitor(" %b  %b |  %b ",A, E,Y);
	A = 0; E = 1;

	#2 A = 1; E = 1;
	#2 A = 1; E = 1;
	#2 A = 0; E = 1;
	#2 A = 1; E = 1;

end

initial begin
	#100 $finish;
end

initial begin
		$dumpfile("BUTRI_tb.vcd");
		$dumpvars(0, testbench);
end

endmodule //testbench2
