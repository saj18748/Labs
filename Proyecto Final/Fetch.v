
//------------------------------------------------- Fetch -----------------------------------------------------

module Fetch (input clk, reset, enabled, input [7:0] En, output reg [7:0] Ou);

    always @ (posedge clk, posedge reset)
        if (reset)
            Ou <= 8'b0000;
        else if (enabled)
            Ou <= En;

endmodule
