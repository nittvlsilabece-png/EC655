`timescale 1ns / 1ps

module demux_tb;
reg in;
reg[2:0]s;
wire out;
demux uut(.in(in),.s(s),.out(out));
initial
begin

#10; s=3'b000; in=1'b0;
#10; s=3'b010; in=1'b1;
#40; s=3'b110; in=1'b1;
#20; s=3'b011; in=1'b1;
end
endmodule
