
// --------------------------------------- PHASE -----------------------------------------------------------

module Phase (input clk, reset, output out_ph);
  reg out_ph;

  // El phase permite el control del fetch, con un 1. Tambien permite a otros modulos poder pasar a otro estado en cualquier
  // flanco de reloj

  always @ ( posedge clk or posedge reset) begin

    if (reset) begin
      out_ph = 0;
    end else begin
      out_ph = ~out_ph;
      
      end
  end
endmodule
