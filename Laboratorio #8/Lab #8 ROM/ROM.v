// Laboratorio #8 -- Memoria ROM 4k x8

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
