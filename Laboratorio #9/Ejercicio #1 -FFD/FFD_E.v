module FFD (input D,clk, reset,enable, output reg Q );

  always @ (posedge clk or posedge reset or posedge enable) begin

  if (reset )
    Q <= 0;
  else if (enable)
    Q <= D;
  end

endmodule //FDDE
