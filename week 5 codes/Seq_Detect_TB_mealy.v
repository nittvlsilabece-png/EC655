`timescale 1ns / 1ps

module Seq_Detect_TB();
reg clk,rst,in_bit;
wire detect;

Seq_Detector_1001_Mealy DUT(clk,rst,in_bit,detect);

initial begin 
  clk=0; in_bit=0; rst=1; #40;rst=0;
end

initial begin 
  forever #10 clk=!clk; 
end
  
initial begin
   
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=1;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=1;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=1;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=1;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=1;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=0;
  @(posedge clk); in_bit=1;
  #20; $finish;
           
end
        
endmodule
