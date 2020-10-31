// Testbench
//inicio del modulo
module testbench ();

// Variables para entradas y salidas
reg D;
reg enable;
reg clk;
reg reset;

wire  Q;

FFD U1(D,clk,reset,enable, Q);

// inicio de la demostracion en diagramas de timing
initial begin
      #1 reset = 1;
      $display("flip flop D");
      $display(" D   EN  |  Q ");
      $display("----------------");
      $monitor(" %b   %b   |   %b", D,enable, Q);

      #50; D <= 0; enable =0;
      #50  D <= 0; enable =1;
      #50 D <= 1; enable =0;
      #50 D <= 1; enable =1;

end

// se llama a la simulaacion en gtk wave
initial begin
  $dumpfile("FFD_E_tb.vcd");
  $dumpvars(0, testbench);

end

endmodule //testbench
