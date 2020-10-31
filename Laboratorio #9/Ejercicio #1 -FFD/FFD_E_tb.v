module testbench ();

reg D;
reg enable;
reg clk;
reg reset;

wire  Q;

FFD U1(D,clk,reset,enable, Q);

initial begin
  clk = 0;
end

initial begin
      reset = 1;
      $display("flip flop D");
      $display(" D |  EN  |  Q ");
      $display("--|--");
      $monitor(" %b %b | %b", D,enable, Q);

      #100;
      D <= 1; enable =0;
      #100;
      D <= 0; enable =1;
      #100;
      D <= 1; enable =0;
end

initial begin
  $dumpfile("FDD_E_tb.vcd");
  $dumpvars(0, testbench);

end

endmodule //testbench
