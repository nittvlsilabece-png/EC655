`timescale 1ns / 1ps

module array_multi_tb();
reg [3:0] A,B;
wire [7:0] z;
array_multiplier DUT(A,B,z);
initial begin
  A=4'd4;B=4'd10; #20;
   A=4'd14;B=4'd10; #20;
    A=4'd4;B=4'd9; #20;
     A=4'd0;B=4'd10; #20;
     $finish;
     end
endmodule
