module tablas1();

//POS de la tabla 1

//Declaracion de variables

reg A, B, C;
wire s1, s2, s3, out;

or U1(s1, A,B, ~C);
or U2(s2, A, ~B, ~C);
or U3(s3, ~A, ~B, C);
and U4(out, s1,s2,s3);

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
  $dumpfile("tabla01POS_tb.vcd");
  $dumpvars(0, tablas1);
  end


endmodule
