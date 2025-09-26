`timescale 1ns / 1ps

module counter_tb ;
 reg clk , rst , ctrl ;
 wire [3:0] count ;
 counter DUT ( clk , rst , ctrl , count ) ;

 initial begin
 clk =1'b0 ;
 end
 always #5 clk = ~clk ;
 initial begin
 ctrl = 0; #60;
 ctrl = 1; #70;
 ctrl = 0; #70;
 ctrl =1;
 end
 initial begin
 rst = 1'b1 ; #7;
 rst = 1'b0 ; #40;
 rst = 1'b0 ;
 #100;
 $finish ;
 end
 endmodule
