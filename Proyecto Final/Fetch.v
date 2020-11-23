
//------------------------------------------------- Fetch -----------------------------------------------------

module Fetch (input clk, enabled_fetch, reset, input [7:0] in_fetch, output [7:0] out_fetch);
  reg [7:0] out_fetch;

    // Se revisa cada cambió de clk y reset, cuando enable es 1 deja pasar el valor
  always @ ( posedge clk or posedge reset ) begin
      if (enabled_fetch == 1 ) begin
        out_fetch = in_fetch;
      end

      if (reset) begin
        out_fetch=0;
      end
  end
endmodule
