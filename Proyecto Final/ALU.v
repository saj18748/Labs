
//------------------------------------------------- ALU--------------------------------------------------------

module ALU (input [3:0] A, B, input [2:0] S, output [3:0] Y, output Z_alu, C_alu);

// P es la variable de 4 bits que resivisa  el valor de las operaciones y  pasa a la salida
  reg [4:0] P;

  assign Y = P[3:0];
  assign C_alu = (S[0]) ? P[4]:0;
  assign Z_alu = (P[3:0] == 0);

  always @ ( A, B, S ) begin

//S guarda la dirección de las operaciones los cuales leera la ALU y procedera a realizar el calculo
    case (S)
      3'b000: P = A;
      3'b001: P = A-B;
      3'b010: P = B;
      3'b011: P = A+B;
      3'b100: P = ~(A&B);

     default:
            P = 0;
    endcase
  end
endmodule
