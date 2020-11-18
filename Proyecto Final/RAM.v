module RAM (input wire [11:0] PCI ,input wire csRAM, weRAM, inout [3:0] data_bus, input wire[3:0] data_out);
    reg [3:0] RAM [0:4095];
    reg [3:0] data_salida;
    assign data_bus = data_salida;
    //assign data_bus = (csRAM && !weRAM) ? data_salida:4'bzzzz;
    always @ ( csRAM, weRAM)
      begin
        if (csRAM==1) begin
            if (weRAM==0) begin
              data_salida = RAM[PCI];
            end
            else begin
              data_salida= data_out;
              RAM[PCI] = data_salida;
            end
        end
        else
          begin
            data_salida= 4'bzzzz;
          end
      end
endmodule
