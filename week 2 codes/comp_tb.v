`timescale 1ns / 1ps

module comp_tb;
reg [3:0]A,B;
wire x,y,z;
comp DUT(.A(A),.B(B),.x(x),.y(y),.z(z));
initial
begin
A=4'b0000;B=4'b0000;#10
A=4'b0000;B=4'b0100;#10
A=4'b0011;B=4'b0000;#10
A=4'b0110;B=4'b1000;#10;
$finish();
end
endmodule
