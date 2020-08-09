// Ejercico #5, SOP

module alarmagt_SOP(input wire A, B, C, output wire Y);

wire s1,s2, notB;

not U1(notB, B);

and U1(s1, A, notB);
and U2(s2, A, C);

or U3(Y, s1, s2);

endmodule // alarmagt_SOP

// Ejercico #5 POS
module alarmagt_POS (input wire A, B, C, output wire Y);

wire s1, notB;

not U1(notB, B);

or (s1, notB, C);
and(Y, A, s1);


endmodule //alarmagt_POS
