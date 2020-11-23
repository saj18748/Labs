//`include "UP.v"

module testbench();

// Declaracion de variables
 wire Z_ALU;
 real points = 0;
  reg clk = 1, reset;
  reg [3:0] PUSH_BUTTONS;
  wire PHASE, C_FLAG, Z_FLAG;
  wire [3:0] INSTR, OPERAND, DATA_BUS, FFD_OUT, ACCU;
  wire [7:0] PROGRAM_BYTE;
  wire [11:0] PC, ADDRESS_RAM;
  wire [12:0] DECODE;
  wire [3:0] ALU;

// Coneccion del modulo principal ¨UP¨ con  el testbench
  UP uPmodule(.clk(clk),
        .reset(reset),
        .pushbuttons(PUSH_BUTTONS),
        .phase(PHASE),
        .c_flag(C_FLAG),
        .z_flag(Z_FLAG),
        .instr(INSTR),
        .operand(OPERAND),
        .data_bus(DATA_BUS),
        .FF_out(FFD_OUT),
        .accu(ACCU),
        .program_byte(PROGRAM_BYTE),
        .pc(PC),
        .address_ram(ADDRESS_RAM)
        );

// Cambio en el clock cada 5 segundos
  always
  #5 clk = ~clk;


  initial begin
    reset = 0;
    #1 reset = 1;
    #1 reset = 0;
    PUSH_BUTTONS = 4'b0110;
    #1998 $finish;
  end

// comienzo de la lectrua del procesador
  always @ (PHASE) begin

    case ($time)

// -------------------------------------------------------------------------------------------------------------
// Verificacion de las instrucciones del procesador base
// En esta sección se prueban  las instrucciones LIT, IN, OUT, ADDI, NANDI y CMPI
// Se verifica si funciona bien, o funciona mal. Se asignaran los puntos en cada verificacion correcta
// -------------------------------------------------------------------------------------------------------------

      20: begin
        if (ACCU === 4'b1001) begin
          points = points + 70;
         $display("LIT funciona bien. Nota: %f", points); end
        else
          $display("LIT NO funciona bien. Nota: %f", points);
      end

      40: begin
        if (ACCU === PUSH_BUTTONS) begin
          points = points + 33;
           $display(" IN funciona bien. Nota: %f", points); end
        else
          $display(" IN NO funciona bien. Nota: %f", points);
      end

      60: begin
        if (FFD_OUT === ACCU) begin
          points = points + 33;
          $display("OUT funciona bien. Nota: %f", points); end
        else begin
          $display("OUT NO funciona bien. Nota: %f", points); end
      end

      80: begin
        if (ACCU === 4'b1111) begin
          points = points + 33;
           $display("ADDI funciona bien. (sin overflow). Nota: %f", points); end
        else begin
          $display("ADDI NO funciona bien. (sin overflow). Nota: %f", points); end
      end

      100: begin
        if (C_FLAG === 1'b1) begin
          points = points + 66; $display("ADDI funciona bien. (con overflow) Nota: %f", points); end
        else
          $display("ADDI NO funciona bien. (con overflow). Nota: %f", points);
      end

      140: begin
        if (ACCU === (~(4'b1010 & 4'b0101))) begin
          points = points + 33;
          $display("NANDI funciona bien. (sin banderas). Nota: %f", points); end
        else
          $display("NANDI NO funciona bien. (sin banderas) Nota: %f", points);
      end

      160: begin
        if (Z_FLAG) begin
          points = points + 33;
          $display("NANDI funciona bien. (con bandera Z). Nota: %f", points); end
        else
          $display("NANDI NO funciona bien. (con bandera Z) Nota: %f", points);
      end

      200: begin
        if (Z_FLAG & ~C_FLAG) begin
          points = points + 33;
          $display("CMPI funciona bien. (A-B=0 -> Z=1, C=0). Nota: %f", points); end
        else
          $display("CMPI NO funciona bien. (A-B=0 -> Z=1, C=0) Nota: %f", points);
      end

      220: begin
        if (~Z_FLAG & ~C_FLAG) begin
          points = points + 33;
          $display("CMPI funciona bien. (A-B=1 -> Z=0, C=0). Nota: %f", points); end
        else
          $display("CMPI NO funciona bien. (A-B=1 -> Z=0, C=0) Nota: %f", points);
      end

      240: begin
        if (~Z_FLAG & C_FLAG) begin
          points = points + 33;
          $display("CMPI funciona bien. (A-B=-1 -> Z=0, C=1). Nota: %f", points); end
        else
          $display("CMPI NO funciona bien. (A-B=-1 -> Z=0, C=1) Nota: %f", points);
      end

// -------------------------------------------------------------------------------------------------------------
// Verificacion de las instrucciones de la RAM
// En esta sección se prueban  las instrucciones LD, ST, ADDM, NANDM y CMPM
// -------------------------------------------------------------------------------------------------------------

      380: begin
        if (ACCU === 4'hE) begin
          points = points + 80;
          $display("LD y ST funcionan bien. Nota: %f", points); end
        else
          $display("LD y ST NO funcionan bien. Nota: %f", points);
      end

      420: begin
        if (ACCU === 4'hF & ~C_FLAG) begin
          points = points + 20;
          $display("ADDM funciona bien (C=0). Nota: %f", points); end
        else
          $display("ADDM NO funciona bien (C=0). Nota: %f", points);
      end

      440: begin
        if (ACCU === 4'h0 & C_FLAG & Z_FLAG) begin
          points = points + 20;
          $display("ADDM funciona bien (C=1, Z=1). Nota: %f", points); end
        else
          $display("ADDM NO funciona bien (C=1, Z=1). Nota: %f", points);
      end

      480: begin
        if (ACCU === 4'h1 & ~C_FLAG & ~Z_FLAG) begin
          points = points + 20;
          $display("NANDM funciona bien (C=0, Z=0). Nota: %f", points); end
        else
          $display("NANDM NO funciona bien (C=0, Z=0). Nota: %f", points);
      end

      540: begin
        if (ACCU === 4'h0 & ~C_FLAG & Z_FLAG) begin
          points = points + 20;
          $display("NANDM funciona bien (C=0, Z=1). Nota: %f", points); end
        else
          $display("NANDM NO funciona bien (C=0, Z=1). Nota: %f", points);
      end

      600: begin
        if (ACCU === 4'h2 & ~C_FLAG & Z_FLAG) begin
          points = points + 20;
           $display("CMPM funciona bien (A-B=0, Z=1, C=0). Nota: %f", points); end
        else
          $display("CMPM NO funciona bien (A-B=0, Z=1, C=0). Nota: %f", points);
      end

      680: begin
        if (ACCU === 4'h1 & C_FLAG & ~Z_FLAG) begin
          points = points + 20;
           $display("CMPM funciona bien (A-B=-1, Z=0, C=1). Nota: %f", points); end
        else
          $display("CMPM NO funciona bien (A-B=-1, Z=0, C=1). Nota: %f", points);
      end

// -------------------------------------------------------------------------------------------------------------
// Verificacion de las instrucciones de los saltos
// En esta sección se prueban  las instrucciones JMP, JC, JNC, JZ y JNZ
// Para cada comparación se verifican las banderas
// -------------------------------------------------------------------------------------------------------------

      700: begin
        if (PC === 12'h034) begin
          points = points + 60;
          $display("JMP funciona bien. Nota: %f", points); end
        else
          $display("JMP NO funciona bien. Nota: %f", points);
      end

      740: begin
        if (PC === 12'h037) begin
          points = points + 30;
          $display("JC funciona bien con C=0. Nota: %f", points); end
        else
          $display("JC NO funciona bien con C=0. Nota: %f", points);
      end

      760: begin
        if (PC === 12'h039) begin
          points = points + 30;
          $display("JZ funciona bien con Z=0. Nota: %f", points); end
        else
          $display("JZ NO funciona bien con Z=0. Nota: %f", points);
      end

      820: begin
        if (PC === 12'h03F) begin
          points = points + 30;
           $display("JZ funciona bien con Z=1. Nota: %f", points); end
        else
          $display("JZ NO funciona bien con Z=1. Nota: %f", points);
      end

      880: begin
        if (PC === 12'h045) begin
          points = points + 30;
           $display("JC funciona bien con C=1. Nota: %f", points); end
        else

          $display("JC NO funciona bien con C=1. Nota: %f", points);
      end

      940: begin
        if (PC === 12'h049) begin
          points = points + 30;
          $display("JNC funciona bien con C=1. Nota: %f", points); end
        else
          $display("JNC NO funciona bien con C=1. Nota: %f", points);
      end

      960: begin
        if (PC === 12'h04B) begin
          points = points + 30;
          $display("JNZ funciona bien con Z=1. Nota: %f", points); end
        else
          $display("JNZ NO funciona bien con Z=1. Nota: %f", points);
      end

      1000: begin
        if (PC === 12'h050) begin
          points = points +30 ;
           $display("JNC funciona bien con C=0. Nota: %f", points); end
        else
          $display("JNC NO funciona bien con C=0. Nota: %f", points);
      end

      1040: begin
        if (PC === 12'h030) begin
          points = points + 30;
           $display("JNZ funciona bien con Z=1. Nota: %f", points); end
        else
          $display("JNZ NO funciona bien con Z=1. Nota: %f", points);
      end
  endcase
  //fin de las verificaciones

  end

// Se abre GTKwave para los diagramas de timing
  initial begin
    $dumpfile("UP_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
