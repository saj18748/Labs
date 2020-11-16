// Ejercicio #1 - Laboratorio #10
// Implemetacion del contador, rom y fetch

//  ----------------------------- Contador de 12 bits ----------------------------------------------------

module counter12(input clk, output [11:0]data  );

wire clk;

reg [11:0]data = 0;  //salida de los 12 bits

    always @ (posedge clk) begin    // cuenta en cada flanco de reloj

    data <= data + 1;

    end

endmodule //counter12
//--------------------------------------------------------------------------------------------------------------

// -------------------------------------- Memoria Rom --------------------------------------------------

module ROM4k(  input [11:0] addr, output [7:0] data );

reg [7:0] merom [0:4095];     // Registro de la memoria

assign data = merom [addr];

initial begin         // Se guardan los datos aleatorios

    merom[0] = 8'h88;
    merom[1] = 8'h75;
    merom[2] = 8'h55;
    merom[3] = 8'hCbB;
    merom[4] = 8'hFE;
    merom[5] = 8'hFF;
    merom[6] = 8'hAA;
    merom[7] = 8'h10;
    merom[8] = 8'h7A;
    merom[9] = 8'hC8;
    merom[10] = 8'h77;

 end

endmodule // ROM4k

//--------------------------------------------------------------------------------------------------------------

//---------------------------------------------- Fetch --------------------------------------------------------

module FFD (input D,clk, reset,enable, output reg Q );

  always @ (posedge clk or posedge reset or posedge enable) begin
// proceso del flip flop
  if (reset )
    Q <= 1'b0;
  else if (enable)
   Q <= D;
   else
    Q <= Q;
  end

endmodule //FDDE
