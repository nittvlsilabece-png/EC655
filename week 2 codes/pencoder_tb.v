`timescale 1ns / 1ps

module pencoder_tb;
reg[7:0]in;
wire [2:0]out;
pencoder uut(.in(in),.out(out));
initial
begin
#10; in=8'b00110010;
#10; in=8'b00000010;
#40; in=8'b00000001;
#20; in=8'b00000101;
#10;
$finish();
end
endmodule
