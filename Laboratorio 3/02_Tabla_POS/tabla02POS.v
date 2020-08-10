module tablas2();

//POS de la tabla 2

//Declaracion de variables

reg A, B, C;
wire s1, s2, s3, s4, s5, out;

// compuertas y conexiones
or U1(s1, A,B, C);
or U2(s2, A, ~B, C);
or U3(s3, A, ~B, ~C);
or U4(s4, ~A, B, C);
or U5(s5, ~A, B, ~C);

and U6(out, s1,s2,s3,s4,s5);

//inicio de la simulacion
initial begin

  A = 0; B = 0; C = 0;

  $display("A  B  C  | Y");
  $display("---------|--");
  $monitor("%b  %b  %b  | %b", A, B, C, out);

  #1 C = 1;
  #1 B = 1; C = 0;
  #1 B = 1; C = 1;
  #1 A = 1; B = 0; C = 0;
  #1 A = 1; B = 0; C = 1;
  #1 A = 1; B = 1; C = 0;
  #1 A = 1; B = 1; C = 1;
  #1 $finish;
  end

  initial begin
  $dumpfile("tabla02POS_tb.vcd");
  $dumpvars(0, tablas2);
  end


endmodule
