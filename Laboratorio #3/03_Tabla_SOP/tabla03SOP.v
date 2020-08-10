module tablas3();

//SOP de la tabla 2

//Declaracion de variables

reg A, B, C, D;
wire s1, s2, s3, s4, s5, s6, s7, out;

// compuertas y conexiones
and U1(s1, ~A, ~B, ~C, ~D);
and U2(s2, ~A, ~B,~ C, D);
and U3(s3, ~A, ~B, C,~ D);
and U4(s4, ~A, ~B, C, D);
and U5(s5, A, ~B, ~C, ~D);
and U6(s6, A, ~B, C, ~D);
and U7(s7, A, B, C, ~D);


or U8(out, s1,s2,s3,s4,s5,s6,s7);

//inicio de la simulacion
initial begin

  $display("A  B  C  D  |  Y");
  $display("------------|---");
  $monitor("%b  %b  %b  %b  |  %b", A, B, C, D, out);

  A = 0; B = 0; C = 0; D = 0;

  #1 D = 1;
  #1 C = 1; D = 0;
  #1 C = 1; D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 B = 1; C = 0; D = 1;
  #1 B = 1; C = 1; D = 0;
  #1 B = 1; C = 1; D = 1;
  #1 A = 1; B = 0; C = 0; D = 0;
  #1 A = 1; B = 0; C = 0; D = 1;
  #1 A = 1; B = 0; C = 1; D = 0;
  #1 A = 1; B = 0; C = 1; D = 1;
  #1 A = 1; B = 1; C = 0; D = 0;
  #1 A = 1; B = 1; C = 0; D = 1;
  #1 A = 1; B = 1; C = 1; D = 0;
  #1 A = 1; B = 1; C = 1; D = 1;

  #1 $finish;
  end

  initial begin
  $dumpfile("tabla03SOP_tb.vcd");
  $dumpvars(0, tablas3);
  end


endmodule
