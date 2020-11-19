//    Universidad del valle de Guatemala
//		Electronica Digital
//		Yefry Elias Sajquiy vargas  - 18748
// 		Proyecto final - Procesador

// Conexion de los modulos

module proyec_F (input clk, reset, enCounter, enFetch, load,// enBuf1, enBuf2, enAccu,
  //  bus dirver, FFD_2, ALu
            //input [2:0]F,
            //input [3:0] busInput,
            //output C,Z,
            //output [3:0] busOutput, accu,

// contador, ROM, Fetch
            input [11:0] counter12bit,
            output [3:0] instr, oprnd,
            output [7:0] program_byte);


    wire [11:0] PC;
    //wire [3:0] data_bus, aluResult;

// LLegan los datos de la RAM
//conexion de  puertos del program counter -> input clk, reset, enabled, load, input [11:0] loadData, output reg [11:0] outValue
    Counter U1(.clk(clk), .reset(reset), .enabled(enCounter), .load(load), .load_Data(counter12bit), .out_Val(PC));

//Los daros llegan del program counter
    // conexxiones puertos de ROM -> input [11:0] address, output [7:0] data
    ROM U2 (PC, program_byte);

//Datos llegan de la ROM
    // puertos de  Fetch -> input clk, reset, enabled, input [7:0] D, output reg [7:0] Q
    Fetch U3 (clk, reset, enFetch, program_byte, {instr, oprnd});

//Datos pasan al Bus Driver  de 4 bits, LLega del Fetch --- BUS DRIVER 1
    Buffer U4(enBuf1, busInput, data_bus);

//Datos pasan al Bus Driver  de 4 bits - Salida de la ALU --- BUS DRIVER  2
    Buffer U5(enBuf2, aluResult, busOutput);

// ALU de 4 Bists de entrada, llegan del BUS DRIBER 1 y pasan ala salida y al al Acumulador
// entrada tambien del acumulado
    ALU U6(.A(accu), .B(data_bus), .F(F), .C(C),.Z(Z), .S(aluResult));

//ACUMULADOR -- flip fliop de 4 bits, datos llegan de la alu y regresan a la misma
    FF_D U7(clk, reset, enAccu, aluResult, accu);


endmodule //proyec_F
