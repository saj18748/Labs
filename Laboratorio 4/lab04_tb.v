// tesbench de cada tabla

module tesbench();

reg p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,p17, p18, p19, p20, p21, p22,p23, p24, p25, p26, p27, p28;
wire led1, led2, led3, led4, led5, led6, led7, led8;

gatelevel1 G1(p1, p2, p3, led1);
gatelevel2 G2(p4, p5, p6, led2);
gatelevel3 G3(p7, p8, p9, p10, led3);
gatelevel4 G4(p11, p12, p13, p14, led4);

operadores1 OP1(p15, p16, p17, p18, led5);
operadores2 OP2(p19, p20, p21, led6);
operadores3 OP3(p22, p23, p24, p25, led7);
operadores4 OP4(p26, p27, p28, led8);

// se muestra los resultados de las operaciones

// tabla1 ejercico 1
  initial begin

  $display("    \n     ");
  $display("Tabla 1 ,ejercicio 1");
  $display("A  B  C  | Y");
  $display("---------|--");
  $monitor("%b  %b  %b  | %b", p1, p2, p3, led1);

  p1 = 0; p2 = 0; p3 = 0;
  #1 p3 = 1;
  #1 p2 = 1; p3 = 0;
  #1 p2 = 1; p3 = 1;
  #1 p1 = 1; p2 = 0; p3 = 0;
  #1 p1 = 1; p2 = 0; p3 = 1;
  #1 p1 = 1; p2 = 1; p3 = 0;
  #1 p1 = 1; p2 = 1; p3 = 1;
  end

  // tabla 2 ejercico 1
  initial begin
  #10
  $display("    \n     ");
  $display("Tabla 2 ,ejercicio 1");
  $display("A  B  C  | Y");
  $display("---------|--");
  $monitor("%b  %b  %b  | %b", p4, p5, p6, led2);

  p4 = 0; p5 = 0; p6 = 0;
  #1 p6 = 1;
  #1 p5 = 1; p6 = 0;
  #1 p5 = 1; p6 = 1;
  #1 p4 = 1; p5 = 0; p6 = 0;
  #1 p4 = 1; p5 = 0; p6 = 1;
  #1 p4 = 1; p5 = 1; p6 = 0;
  #1 p4 = 1; p5 = 1; p6 = 1;
  end

  initial begin
  #20
  $display("    \n     ");
  $display("Tabla 3 ,ejercicio 1");
  $display("A  B  C  D  | Y");
  $display("------------|--");
  $monitor("%b  %b  %b  %b  | %b", p7, p8, p9, p10, led3);

  p7 = 0; p8 = 0; p9 = 0; p10 = 0;

  #1 p10 = 1;
  #1 p9 = 1; p10 = 0;
  #1 p9 = 1; p10 = 1;
  #1 p8 = 1; p9 = 0; p10 = 0;
  #1 p8 = 1; p9 = 0; p10 = 1;
  #1 p8 = 1; p9 = 1; p10 = 0;
  #1 p8 = 1; p9 = 1; p10 = 1;
  #1 p7 = 1; p8 = 0; p9 = 0; p10 = 0;
  #1 p7 = 1; p8 = 0; p9 = 0; p10 = 1;
  #1 p7 = 1; p8 = 0; p9 = 1; p10 = 0;
  #1 p7 = 1; p8 = 0; p9 = 1; p10 = 1;
  #1 p7 = 1; p8 = 1; p9 = 0; p10 = 0;
  #1 p7 = 1; p8 = 1; p9 = 0; p10 = 1;
  #1 p7 = 1; p8 = 1; p9 = 1; p10 = 0;
  #1 p7 = 1; p8 = 1; p9 = 1; p10 = 1;
  end

  initial begin
  #60
  $display("    \n     ");
  $display("Tabla 4 ,ejercicio 1");
  $display("A  B  C  D  | Y");
  $display("------------|--");
  $monitor("%b  %b  %b  %b  | %b", p11, p12, p13, p14, led4);

  p11 = 0; p12 = 0; p13 = 0; p14 = 0;

  #1 p14 = 1;
  #1 p13 = 1; p14 = 0;
  #1 p13 = 1; p14 = 1;
  #1 p12 = 1; p13 = 0; p14 = 0;
  #1 p12 = 1; p13 = 0; p14 = 1;
  #1 p12 = 1; p13 = 1; p14 = 0;
  #1 p12 = 1; p13 = 1; p14 = 1;
  #1 p11 = 1; p12 = 0; p13 = 0; p14 = 0;
  #1 p11 = 1; p12 = 0; p13 = 0; p14 = 1;
  #1 p11 = 1; p12 = 0; p13 = 1; p14 = 0;
  #1 p11 = 1; p12 = 0; p13 = 1; p14 = 1;
  #1 p11 = 1; p12 = 1; p13 = 0; p14 = 0;
  #1 p11 = 1; p12 = 1; p13 = 0; p14 = 1;
  #1 p11 = 1; p12 = 1; p13 = 1; p14 = 0;
  #1 p11 = 1; p12 = 1; p13 = 1; p14 = 1;
  end

  initial begin
  #90
  $display("    \n     ");
  $display("Tabla 1 ,ejercicio 2");
  $display("A  B  C  D  | Y");
  $display("------------|--");
  $monitor("%b  %b  %b  %b  | %b", p15, p16, p17, p18, led5);

  p15 = 0; p16 = 0; p17 = 0; p18 = 0;

  #1 p18 = 1;
  #1 p17 = 1; p18 = 0;
  #1 p17 = 1; p18 = 1;
  #1 p16 = 1; p17 = 0; p18 = 0;
  #1 p16 = 1; p17 = 0; p18 = 1;
  #1 p16 = 1; p17 = 1; p18 = 0;
  #1 p16 = 1; p17 = 1; p18 = 1;
  #1 p15 = 1; p16 = 0; p17 = 0; p18 = 0;
  #1 p15 = 1; p16 = 0; p17 = 0; p18 = 1;
  #1 p15 = 1; p16 = 0; p17 = 1; p18 = 0;
  #1 p15 = 1; p16 = 0; p17 = 1; p18 = 1;
  #1 p15 = 1; p16 = 1; p17 = 0; p18 = 0;
  #1 p15 = 1; p16 = 1; p17 = 0; p18 = 1;
  #1 p15 = 1; p16 = 1; p17 = 1; p18 = 0;
  #1 p15 = 1; p16 = 1; p17 = 1; p18 = 1;

  end

  initial begin
  #110
  $display("    \n     ");
  $display("Tabla 2 ,ejercicio 2");
  $display("A  B  C  | Y");
  $display("---------|--");
  $monitor("%b  %b  %b  | %b", p19, p20, p21, led6);

  p19 = 0; p20 = 0; p21 = 0;
  #1 p21 = 1;
  #1 p20 = 1; p21 = 0;
  #1 p20 = 1; p21 = 1;
  #1 p19 = 1; p20 = 0; p21 = 0;
  #1 p19 = 1; p20 = 0; p21 = 1;
  #1 p19 = 1; p20 = 1; p21 = 0;
  #1 p19 = 1; p20 = 1; p21 = 1;
  end

  initial begin
  #140
  $display("    \n     ");
  $display("Tabla 3 ,ejercicio 2");
  $display("A  B  C  D  | Y");
  $display("------------|--");
  $monitor("%b  %b  %b  %b  | %b", p22, p23, p24, p25, led7);

  p22 = 0; p23 = 0; p24 = 0; p25 = 0;

  #1 p25 = 1;
  #1 p24 = 1; p25 = 0;
  #1 p24 = 1; p25 = 1;
  #1 p23 = 1; p24 = 0; p25 = 0;
  #1 p23 = 1; p24 = 0; p25 = 1;
  #1 p23 = 1; p24 = 1; p25 = 0;
  #1 p23 = 1; p24 = 1; p25 = 1;
  #1 p22 = 1; p23 = 0; p24 = 0; p25 = 0;
  #1 p22 = 1; p23 = 0; p24 = 0; p25 = 1;
  #1 p22 = 1; p23 = 0; p24 = 1; p25 = 0;
  #1 p22 = 1; p23 = 0; p24 = 1; p25 = 1;
  #1 p22 = 1; p23 = 1; p24 = 0; p25 = 0;
  #1 p22 = 1; p23 = 1; p24 = 0; p25 = 1;
  #1 p22 = 1; p23 = 1; p24 = 1; p25 = 0;
  #1 p22 = 1; p23 = 1; p24 = 1; p25 = 1;
  end

  initial begin
  #160
  $display("    \n     ");
  $display("Tabla 4 ,ejercicio 2");
  $display("A  B  C  | Y");
  $display("---------|--");
  $monitor("%b  %b  %b  | %b", p26, p27, p28, led8);

  p26 = 0; p27 = 0; p28 = 0;

  #1 p28 = 1;
  #1 p27 = 1; p28 = 0;
  #1 p27 = 1; p28 = 1;
  #1 p26 = 1; p27 = 0; p28 = 0;
  #1 p26 = 1; p27 = 0; p28 = 1;
  #1 p26 = 1; p27 = 1; p28 = 0;
  #1 p26 = 1; p27 = 1; p28 = 1;
  end

  initial
  #200 $finish;

  initial begin
  $dumpfile("lab04_tb.vcd");
  $dumpvars(0, tesbench);
  end

endmodule
