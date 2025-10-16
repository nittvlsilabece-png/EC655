`timescale 1ns / 1ps

module ALU_Tb();
reg [3:0] A,B ;
reg [1:0] S;
wire [7:0] res;
alu_4bit DUT(A,B,S,res);
initial begin
   A=4'd4;B=4'd10; S=2'b00; #20;
   A=4'd14;B=4'd10;S=2'b01; #20;
    A=4'd4;B=4'd9;S= 2'b10; #20;
     A=4'd0;B=4'd10;S=2'b11; #20;
     $finish;
     end
endmodule
