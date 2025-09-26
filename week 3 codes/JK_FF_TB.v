`timescale 1ns / 1ps

module JK_FF_TB(  );
reg clk,j,k;
    wire q,qbar;
  JK_FF DUT(clk,j,k,q,qbar);
  initial begin
  clk=0;
  j=0;k=0; #10;
  j=0;k=1; #10;
  j=1;k=0; #10;
  j=1;k=1; #10;
  j=0;k=1; #10;
  j=1;k=0; #10;
  $finish ; end
  always #5clk=~clk;
endmodule
