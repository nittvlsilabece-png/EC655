`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2025 15:24:11
// Design Name: 
// Module Name: mux_demux_tb
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


module demux_tb;
reg[7:0]in;
reg[2:0]s;
wire out;
demux uut(.in(in),.s(s),.out(out));
initial
begin

#10; s=3'b000; in=8'hAA;
#10; s=3'b010; in=8'hBB;
#40; s=3'b110; in=8'hCC;
#20; s=3'b011; in=8'hDD;
end
endmodule
