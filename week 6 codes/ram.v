`timescale 1ns / 1ps

module ram(
    input clk,we,re,reset,
    input [3:0] addr,
    input [7:0] din,
    output reg [7:0] dout=0
    );
    
    reg [7:0] mem [0:15];
    
    always @(posedge clk or posedge reset) begin
    if(reset) begin
        dout<=8'd0;end
    else begin
        if (we & re) dout<=0;  
        else if(we)     
            mem[addr]<=din;
         else if(re)    
             dout <= mem[addr];
         else dout<=0;  
         end
     end
      
endmodule
