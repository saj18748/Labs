// TESTBENCH
`define simulation

module testbench ();

reg J,K,clk, reset;
wire Q, Y;

//FJK U1(.J(J), .K(K), .clk(clk), .reset(reset),.Q(Q), .Y(Y));
FJK U1(J,K,clk,reset, Q, Y);

initial begin
	clk = 1'b1;
end

initial begin
	#5 J <=0; K <=0; reset = 1;

	$display("flip flop JK");
	$display(" J   K | Q   Y");
	$display("---------------");
	$monitor(" %b   %b | %b  %b", J,K, Q, Y);
	#5	J <= 0; K <= 1; 
	#20 J <= 1; K <= 0;
	#20 J <= 1; K <=1;
	#20 $finish;
end

initial begin
	$dumpfile("FJK_tb.vcd");
	$dumpvars(0, testbench);
end


endmodule //testbench
