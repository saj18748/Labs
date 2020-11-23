
//-----------------------------------------------ROM  64x8 -----------------------------------------------

module ROM (input [11:0] address_ROM, output [7:0] data_ROM);

// salida de 7 bits,direccionamiento a 4096
  reg [7:0] memory [0:4095];


  assign data_ROM = memory [address_ROM];

// Se llama al archivo donde estan las intrucciones del Procesador
  initial begin
      $readmemb("memory.list", memory);
  end
endmodule
