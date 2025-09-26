`timescale 1ns / 1ps


module USR_TB;
 reg clk,rst;
 reg [1:0] mode;
 reg sin;
 reg [3:0] pin;
 wire sout;
 wire [3:0] pout;
 USR DUT(clk,rst,mode,sin,pin,sout,pout);
 initial begin
 clk=0;rst=1;sin=0;pin=4'b0000; #20;
 rst=0; mode=2'b11;pin=4'b0101;sin=1;#20;
 mode=2'b00;#20;
 mode=2'b01;sin=1;#20;
 mode=2'b10;sin=0;#20;
 mode=2'b01;sin=0;#20;
 $finish;
 end
 always #5clk=~clk;
 
endmodule
