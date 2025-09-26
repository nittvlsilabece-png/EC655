`timescale 1ns / 1ps

module JK_FF ( input clk , j , k ,
                 output reg q=0 ,   
                  output qbar) ;
 always @ ( posedge clk )
 begin
 case ({ j , k })
 2'b00 : q <= q ;
 2'b01 : q <= 0;
 2'b10 : q <= 1;
 2'b11 : q <= ~q;
 default : q<= q;
 endcase
 end
 assign qbar = ~q ;
 endmodule
