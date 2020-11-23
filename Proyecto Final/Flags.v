
//------------------------------------------ FLAGS -----------------------------------------------------------

module Flags (input clk, enabled_flags, reset, C, Ze, output C_1, Z_1);
  reg C_1, Z_1;

  //C y Z son parte de la combinación de bits necesarios en el decoder para asignarle valores a las señales de control
  
  always @ (posedge clk or posedge reset) begin
    if (reset == 0 & enabled_flags == 1) begin
      C_1 = C;
      Z_1 = Ze;
    end

    if (reset == 1) begin
      C_1 = 0;
      Z_1 = 0;
    end
  end
endmodule
