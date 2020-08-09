// tesbench

module tesbench();

reg p1, p2, p3, p4, p5, p6;
wire led1, led2;

alarmagt_SOP G1(p1, p2, p3, led1);
alarmagt_SOP G2(p4, p5, p6, led2);

initial begin
  #10
  $display("    \n     ");
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

  initial begin

  #20
  $display("    \n     ");
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

  initial
  #40 $finish;

  initial begin
$dumpfile("alarma_tb.vcd");
$dumpvars(0, tesbench);
end


endmodule
