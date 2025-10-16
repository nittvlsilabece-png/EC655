`timescale 1ns / 1ps

module Three_Tap_Filter(
    input clk,rst,
    input [7:0] x,
    output reg [7:0]  y
    );
    
    parameter a=8'd1, b=8'd2, c=8'd3;

    reg [7:0] x0,x1,x2,x3;

    always @(posedge clk or posedge rst) begin
      if(rst) begin
          x0<=0;
          x1<=0;
          x2<=0;
          x3<=0; end
      else begin
          x1<=x;
          x2<=x1;
          x3<=x2; end
        end

     always @(posedge clk or posedge rst) begin     
        if(rst) 
          y<=0;
        else 
          y<= (a*x3) + (b*x2) + (c*x1);
        end

endmodule
