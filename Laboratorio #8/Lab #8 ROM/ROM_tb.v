// Testbench del la ROM
`define simulation

module testbench();

reg [11:0] addr;    // regisro de la ROM
wire [7:0] data;    // salida de los datos

ROM4k ROM(addr, data);

initial begin     // inicio para mostrar los datos
  addr=0;

  $display("addr\tdata\t");         // se muestan los datos en el diagrama de timing
  $monitor("%d\t%h", addr, data);

  #1 addr=0;
  #1 addr=1;
  #1 addr=2;
  #1 addr=3;
  #1 addr=4;
  #1 addr=5;
  #1 addr=6;
  #1 addr=7;
  #1 addr=8;
  #1 addr=9;
  #1 addr=10;

 end

 initial begin
   // Mostrar los resultdos en los diagramas de timng
   $dumpfile("ROM_tb.vcd");
   $dumpvars(0, testbench);

 end
endmodule
