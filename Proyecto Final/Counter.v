
//---------------------------------------- Program Counter  --------------------------------------------

module Counter (input clk, enabled_counter, reset, load_counter, input [11:0] load_Val, output [11:0] out_Val);

  reg [11:0] count;
  assign out_Val = count;

//Su señal de control es incPC hace que se pueda seguir sel conteo, cuand load_Val es 1 ,se salta instrucciones y ejecuta lo que se solicita

//Se comienza con las condiciones
  always @ (posedge clk or posedge reset) begin
    if (enabled_counter == 1 ) begin
      count = count + 1;
    end

    if (enabled_counter == 0) begin
      count = count;
    end

    if (load_counter == 1) begin
      count = load_Val;
    end

    if (reset == 1) begin
      count=0;
    end
  end
endmodule
