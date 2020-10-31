module FJK ( input J,K, clk, reset, output Q,Y);

reg Q;
	always @ (posedge clk) begin

	if(reset)	

	Q <= 1'b0;

		else begin
		case({J,K})

			2'b00 : Q <= Q;
			2'b01 : Q <= 1'b0;
			2'b00 : Q <= 1'b1;
			2'b00 : Q <= ~Q;
		endcase
	  end
	end

	assign Y = ~Q;

endmodule //FJK
