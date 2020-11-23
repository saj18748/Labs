
//------------------------------------------- Acumulador --------------------------------------------------

module Acumulador (input clk, enabled_Acumulador, reset, input [3:0] in_acumulador, output [3:0] out_Acumulador);
reg [3:0] out_Acumulador;

//  Se verifica el cambio del clock , con el enabled_Acumulador es igaul a 1, permite el paso del valor acumulado de la ALU
always @ (posedge clk or posedge reset) begin
  if ( enabled_Acumulador == 1) begin
    out_Acumulador = in_acumulador;
  end
  if (reset == 1) begin
    out_Acumulador = 4'b0000;
  end
end
endmodule
