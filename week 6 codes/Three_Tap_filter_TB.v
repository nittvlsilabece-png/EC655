`timescale 1ns / 1ps

module fir_TB();
   reg clk,rst;
   reg [7:0] x;
   wire [7:0] y;

   Three_Tap_Filter DUT(clk,rst,x,y);

   initial begin
        clk=0; forever #5clk =~clk; 
    end

   initial begin
        rst=1; #20; rst=0;
   end 

   initial begin
        x=8'd08; #10;
        x=8'd03; #10;
        x=8'd23; #10;
        x=8'd01; #10;
        x=8'd69; #10;
        x=8'd03; #10;
        x=8'd23; #10;
        x=8'd01; #10;
        x=8'd69; #10;
        $finish;
    end
    
endmodule
