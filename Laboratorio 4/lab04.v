// Laboratorio #4

// Ejercicio #1, tabla #1

module gatelevel1(input wire A, B, C, output wire Y);

wire s1,s2, notA, notB, notC;

not U1(notA, A);
not U2(notB, B);
not U3(notC, C);

or  U4(s1, notA, notB, C);
or  U5(s2, A , notC);
and U6(Y, s1, s2);

endmodule//gatelevel1

// Ejercicio #1, Tabla $2
module gatelevel2 (input wire A, B, C, output wire Y);

wire s1,s2, notA, notB, notC;

not U1(notA, A);
not U2(notB, B);
not U3(notC, C);

and  U4(s1, notA, notB, notC);
and  U5(s2, A , notB, C);
or   U6(Y, s1, s2);

endmodule //gatelevel2

// Ejercicio #1, Tabla #3

module gatelevel3 (input wire A, B, C, D, output wire Y);

wire s1,s2,s3,s4,s5,s6,s7,s8, notA, notB, notC, notD;

not U1(notA, A);
not U2(notB, B);
not U3(notC, C);
not U4(notD, D);

and U5(s1, notA, notB, notC, notD);
and U6(s2, A, B, notC, notD);
and U7(s3, notA, B, notC, D);
and U8(s4, A, notB, notC, D);
and U9(s5, notA, notB, C, D);
and U10(s6, A, B, C, D);
and U11(s7, notA, B, C, notD);
and U12(s8, A, notB, C, notD);

or U13(Y, s1,s2,s3,s4,s5,s6,s7,s8);

endmodule //gatelevel3

//Ejercicio #1, Tabla #4

module gatelevel4 (input wire A, B, C, D, output wire Y);

wire s1,s2,s3;

not U1(notC, C);
not U2(notD, D);

and U3(s1, A, notC, notD);
and U4(s2, A, B, notC);
and U5(s3, A, C, D);

or U6(Y, s1, s2, s3);

endmodule //gatelevel4

// Opereradores
// Ejercicio #2, Tabla #1

module operadores1 (input wire A, B, C, D, output wire Y);

assign Y = (A & B & C & ~D) | (A & ~(B & C & D)) | ~(A | B | C | D);

endmodule //operadores1

// Ejercicio #2, tabla #2

module operadores2 (input wire A, B, C, output wire Y);

assign Y = (~A & B & C) | ~(B & ~C) | (B & C);

endmodule //operadores2

//  Ejercicio #2, tabla #3

module operadores3 (input wire A, B, C, D, output wire Y);

assign Y = (~(A | B | C) & D) | (A & D) | B ;

endmodule //operadores3

// Ejercicio #2, tabla #4

module operadores4 (input wire A, B, C, output wire Y);

assign Y = (B & C) | (~A & ~B & ~C) | (B & ~C);

endmodule //operadores4
