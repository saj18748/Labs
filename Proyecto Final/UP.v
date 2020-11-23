//    Universidad del valle de Guatemala
//		Electronica Digital
//		Yefry Elias Sajquiy Vargas  - 18748
// 		Proyecto final - Procesador UP

// Conexion de los modulos

/*`include "ALU.v"
`include "Buffer.v"
`include "Counter.v"
`include "Decode.v"
`include "Fetch.v"
`include "FFD_2.v"
`include "Flags.v"
`include "Phase.v"
`include "RAM.v"
`include "ROM.v"
*/

// Modulo principal para las conexiones del los otros modulos
module UP (input clk, reset, input [3:0] pushbuttons, output phase, c_flag, z_flag, output [3:0] instr, operand, data_bus, FF_out, accu,
                      output [7:0] program_byte, output [11:0] pc, address_ram);

  wire [2:0] S;
  wire [11:0] pc;
  wire incPC, loadPC, phase, loadFlags, c_flag_in, z_flag_in, loadA, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut;
  wire [3:0] alu_out;
  wire ph;

  assign address_ram = {operand, program_byte};
  assign phase = ph;


// Se comienza por el modulo del program counter
    Counter     U1(.clk(clk), .enabled_counter(incPC), .reset(reset), .load_counter(loadPC), .load_Val({operand, program_byte}), .out_Val(pc));

// los datos del counter pasan a la memoria ROM
    ROM          U2(.address_ROM(pc), .data_ROM(program_byte));

//Los datos de la ROM pasan al fetch para direccionarlos al decodificador y al bus driver 1
    Fetch          U3(.clk(clk), .enabled_fetch(ph), .reset(reset), .in_fetch(program_byte), .out_fetch({instr, operand}));

//Los flags, son las banderas que pasan al decodificador
    Flags          U4(.clk(clk), .enabled_flags(loadFlags), .reset(reset), .Ze(z_flag_in), .C(c_flag_in), .Z_1(z_flag), .C_1(c_flag));

// El phase permite que haya lectruas en cualquier parte de los tiempos
    Phase          U5(.clk(clk), .reset(reset), .out_ph(ph));

// decodificador oara las instrucciones
    Decode       U6(.instr(instr), .C(c_flag), .Ze(z_flag), .phase(ph), .incPC(incPC), .loadPC(loadPC), .loadA(loadA),
                       .loadFlags(loadFlags), .csRAM(csRAM), .weRAM(weRAM), .oeALU(oeALU), .oeIN(oeIN), .oeOprnd(oeOprnd),
                       .loadOut(loadOut), .S(S));

//Los daros son fuardados en la RAM que Pasan al program counter  y qu ellegan del fetch y de la ROM
    RAM            U7(.csRAM(csRAM), .weRAM(weRAM), .address_RAM({operand, program_byte}), .data_RAM(data_bus));

// Deja pasar los datos del getch para la alu
    Buffer_3state    U8(.in(operand), .enabled_buf(oeOprnd), .out_buf(data_bus));

// Se hacen las operaciones que pasan al Acumulador y al segundo bus driver
   ALU             U9(.A(accu), .B(data_bus), .S(S), .Y(alu_out), .Z_alu(z_flag_in), .C_alu(c_flag_in));

// le ellegan los datos de la Alu
    Acumulador   U10(.clk(clk), .enabled_Acumulador(loadA), .reset(reset), .in_acumulador(alu_out), .out_Acumulador(accu));

   Buffer_3state  U11(.in(alu_out), .enabled_buf(oeALU), .out_buf(data_bus));

   Acumulador    U12(.clk(clk), .enabled_Acumulador(loadOut), .reset(reset), .in_acumulador(data_bus), .out_Acumulador(FF_out));

   Buffer_3state  U13(.in(pushbuttons), .enabled_buf(oeIN), .out_buf(data_bus));

endmodule
