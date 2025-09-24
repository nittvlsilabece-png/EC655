`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2025 00:42:24
// Design Name: 
// Module Name: mux_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_tb(

    );
    
    reg s0,s1,d0,d1,d2,d3;
    wire data_out;
    
    mux uut(.s0(s0), .s1(s1), .d0(d0), .d1(d1), . d2(d2), .d3(d3), .data_out(data_out));
    
    
    initial begin
    {s1,s0,d0,d1,d2,d3} = 6'b00_1000; #10
    {s1,s0,d0,d1,d2,d3} = 6'b01_1000; #10
    {s1,s0,d0,d1,d2,d3} = 6'b11_0001; #10
    $finish;
    end
endmodule
