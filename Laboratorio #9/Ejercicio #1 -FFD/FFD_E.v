// Ejercicio #1 -- flip flop D
// Fli flop de 1 bit
module FFD (input D,clk, reset,enable, output reg Q );

  always @ (posedge clk or posedge reset or posedge enable) begin
// proceso del flip flop
  if (reset )
    Q <= 1'b0;
  else if (enable)
   Q <= D;
   else
    Q <= Q;
  end

endmodule //FDDE
