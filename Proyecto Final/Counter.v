//---------------------------------------- Program Counter  --------------------------------------------

module Counter (input clk, reset, enabled, load, input [11:0] load_Data, output reg [11:0] out_Val);

    always @ (posedge clk, posedge reset) begin
        if (reset)
            out_Val <= 12'b0;
        else if (load)
            out_Val <=  load_Data;
        else if (enabled)
            out_Val <= out_Val + 1;
    end

endmodule
