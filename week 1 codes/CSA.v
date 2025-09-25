`timescale 1ns / 1ps

module CSA(
    input [7:0] a,b,
    input cin,
    output [7:0] s,
    output Cout
    );
    wire [7:0] c,p;
    wire carry_mux1, carry_mux3, carry_mux5;

    FA f1(a[0], b[0], cin, s[0], c[0], p[0]);
    FA f2(a[1], b[1], c[0], s[1], c[1], p[1]);

    assign carry_mux1 = (p[0] & p[1]) ? cin : c[1];

    FA f3(a[2], b[2], carry_mux1, s[2], c[2], p[2]);
    FA f4(a[3], b[3], c[2], s[3], c[3], p[3]);

    assign carry_mux3 = (p[2] & p[3]) ? carry_mux1 : c[3];

    FA f5(a[4], b[4], carry_mux3, s[4], c[4], p[4]);
    FA f6(a[5], b[5], c[4], s[5], c[5], p[5]);

    assign carry_mux5 = (p[4] & p[5]) ? carry_mux3 : c[5];

    FA f7(a[6], b[6], carry_mux5, s[6], c[6], p[6]);
    FA f8(a[7], b[7], c[6], s[7], c[7], p[7]);

    assign Cout = (p[6] & p[7]) ? carry_mux5 : c[7];
endmodule

module FA(input a,b,cin,output sum,carry,pro);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | ((a ^ b) & cin);
    assign pro = a ^ b;
endmodule



