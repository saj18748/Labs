
//---------------------------- Memoria RAM -------------------------------------------------------------

module RAM (input csRAM, weRAM, input [11:0] address_RAM, inout [3:0] data_RAM);
    reg [3:0] out_data;
    reg [3:0] memory [0:4095];

//  Comiezo del proceso de la RAM
    assign data_RAM = (csRAM & ~weRAM) ? out_data : 4'bzzzz;

    always @ ( address_RAM, csRAM, weRAM ) begin
      if ( csRAM & ~weRAM ) begin
        out_data = memory[address_RAM];
        end
    end

    always @ (csRAM, weRAM, data_RAM, address_RAM) begin

        if ( csRAM & weRAM  ) begin
          memory[address_RAM] = data_RAM;
        end
    end

endmodule
