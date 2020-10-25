// Inicio del testbench
`define simulation

module testbench();

 //registro de entrada A y B
reg [3:0] A;
reg [3:0] B;

wire [3:0] Y;  // Salida de la ALU


ALU1 U1(A, B, Y);

// Inicio  para mostrar los datos
initial begin
  A=0; B=0;

  $display("A\tB\tY\tC_out");
  $monitor("%b\t%b\t%b\t", A, B, Y);

  #1 A=2; B=4;
  #1 A=2; B=4;
  #1 A=2; B=4;
  #1 A=8; B=8;
  #1 A=4; B=3;
  #1 A=4; B=5;
  #1 A=4; B=4;
  #1 A=3; B=5;
  #1 $finish;
  end

  initial begin
  // Mostrar los resultdos en los diagramas de timng
  $dumpfile("ALU_tb.vcd");
  $dumpvars(0, testbench);

  end

endmodule
