module Decode ( input [3:0] instr, input C, Ze, phase, output incPC, loadPC, loadA, loadFlags, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut,
  output [2:0] S,output [11:0] out);

  reg incPC, loadPC, loadA, loadFlags, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut;
  reg [2:0] S;
  reg [6:0] Din;

  always @ (instr or phase) begin

    Din = {instr, C, Ze, phase};

    casez (Din)

      7'b??????0:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JC
      7'b00001?1:
      begin
        incPC = 0;
        loadPC = 1;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JC2
      7'b00000?1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JNC
      7'b00011?1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JNC2
      7'b00010?1:
      begin
        incPC = 0;
        loadPC = 1;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //CMPI
      7'b0010??1:
      begin
        incPC = 0;
        loadPC = 0;
        loadA = 0;
        loadFlags = 1;
        csRAM = 0;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 1;
        loadOut = 0;
        S = 3'b001;
      end

      //CMPM
      7'b0011??1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 1;
        csRAM = 1;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b001;
      end

      //LIT
      7'b0100??1:
      begin
        incPC = 0;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 0;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 1;
        loadOut = 0;
        S = 3'b010;
      end

      //IN
      7'b0101??1:
      begin
        incPC = 0;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 0;
        weRAM = 0;
        oeALU = 0;
        oeIN = 1;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b010;
      end

      //LD
      7'b0110??1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 1;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b010;
      end

      //ST
      7'b0111??1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 1;
        weRAM = 1;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JZ
      7'b1000?11:
      begin
        incPC = 0;
        loadPC = 1;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JZ2
      7'b1000?01:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JNZ
      7'b1001?11:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //JNZ2
      7'b1001?01:
      begin
        incPC = 0;
        loadPC = 1;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //ADDI
      7'b1010??1:
      begin
        incPC = 0;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 0;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 1;
        loadOut = 0;
        S = 3'b011;
      end

      //ADDM
      7'b1011??1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 1;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b011;
      end

      //JMP
      7'b1100??1:
      begin
        incPC = 0;
        loadPC = 1;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b000;
      end

      //out
      7'b1101??1:
      begin
        incPC = 0;
        loadPC = 0;
        loadA = 0;
        loadFlags = 0;
        csRAM = 0;
        weRAM = 0;
        oeALU = 1;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 1;
        S = 3'b000;
      end

      // NANDI
      7'b1110??1:
      begin
        incPC = 0;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 0;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 1;
        loadOut = 0;
        S = 3'b100;
      end

      // NANDM
      7'b1111??1:
      begin
        incPC = 1;
        loadPC = 0;
        loadA = 1;
        loadFlags = 1;
        csRAM = 1;
        weRAM = 0;
        oeALU = 0;
        oeIN = 0;
        oeOprnd = 0;
        loadOut = 0;
        S = 3'b100;
      end
      default: ;
    endcase
  end

  assign out = {incPC, loadPC, loadA, loadFlags, S[2:0], csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut};

endmodule
