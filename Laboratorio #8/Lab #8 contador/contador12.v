
// Laboratorio #8 -- contador de 12 bits
// Entrada = clock de se;al del reloj
// salida = 12 bits del contador

module counter12(input clk, output [11:0]data  );

wire clk;

reg [11:0]data = 0;  //salida de los 12 bits

    always @ (posedge clk) begin    // cuenta en cada flanco de reloj
  
    data <= data + 1;

    end

endmodule //counter12
