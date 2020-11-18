//    Universidad del valle de Guatemala
//		Electronica Digital
//		Yefry Elias Sajquiy vargas  - 18748
// 		Proyecto final

// Conexion de los modulos

module proyec_F (input clk, reset, enCounter, enFetch, load,
            input [11:0] counter12bit,
            output [3:0] instr, oprnd,
            output [7:0] program_byte);


    wire [11:0] PC;

    // puertos de 'counter' -> input clk, reset, enabled, load, input [11:0] loadData, output reg [11:0] outValue
    Counter U1(.clk(clk), .reset(reset), .enabled(enCounter), .load(load), .load_Data(counter12bit), .out_Val(PC));
    // puertos de 'ROM' -> input [11:0] address, output [7:0] data
    ROM U2 (PC, program_byte);
    // puertos de 'FF_D' -> input clk, reset, enabled, input [7:0] D, output reg [7:0] Q
    Fetch U3 (clk, reset, enFetch, program_byte, {instr, oprnd});

endmodule //proyec_F
