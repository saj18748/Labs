
//----------------------------------------- Bus_Driver -----------------------------------------------------
// Buffer tri estado se usa para el paso de los bits que los redirecciona

module Buffer_3state (input [3:0] in, input enabled_buf, output [3:0] out_buf);

    assign out_buf = (enabled_buf) ? in : 4'bzzzz;

endmodule
