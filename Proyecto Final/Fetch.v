//------------------------------------------------- Fetch -----------------------------------------------------

module Fetch (input clk, reset, enabled, input [7:0] D, output reg [7:0] Q);

    always @ (posedge clk, posedge reset)
        if (reset)
            Q <= 8'b0000;
        else if (enabled)
            Q <= D;

endmodule
