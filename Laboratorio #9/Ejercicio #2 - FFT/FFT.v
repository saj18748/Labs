

module FFD (input D,clk, reset,enable, output reg Q );

  always @ (posedge clk or posedge reset or posedge enable) begin

  if (reset )
    Q <= 0;
  else if (enable)
    Q <= D;
  end

endmodule //FDDE

module FFT (inout clk, reset, enable, output wire Q);

  wire D2;
	not(D2, Q);

	always @ ( posedge clk ) begin

	end
	FFD U2(clk, reset, enable, D, Q);
endmodule //FFT
