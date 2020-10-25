// Laboratorio #8 -- ALU

module ALU1 (input [3:0] A,input[3:0] B, output [3:0] Y);

reg v_temp;
reg [3:0] y_temp;
reg [4:0] temp;

assign Y = temp[3:0];


//inicio de la ALU
always @ (A,B) begin

case(B)  // Case para las operaciones logicas

  3'b000: temp = A;
  3'b001: temp = B;
  3'b010: temp = A+B;
  3'b011: temp = A-B;
  3'b100: temp = ~(A&B);
  default: temp = 0;

endcase

end

endmodule
