`timescale 1ns / 1ps

module ram_TB( );
reg clk,reset,we,re;
reg[7:0]din;
reg[3:0] addr;
wire [7:0] dout;

ram DUT(clk,we,re,reset,addr,din,dout);

initial begin 
      clk=1; we=1; re=0; reset=1; addr=0;din=0;#20; reset=0;  
end

initial begin
      forever #5 clk=~clk; 
end
         
initial begin
#20; we =1; re=0;din=8'd43;addr=4'd0;
#10; we =1; re=0;din=8'd53;addr=4'd1;
#10; we =1; re=0;din=8'd3;addr=4'd2;
#10; we =1; re=0;din=8'd4;addr=4'd3;
#10; we =1; re=1;addr=4'd0;din=8'd4;
#10; we =1; re=0;din=8'd43;addr=4'd4;
#10; we =1; re=0;din=8'd69;addr=4'd5;

#10; we =0; re=1;addr=4'd0;
#10; we =0; re=1;addr=4'd1;
#10; we =0; re=1;addr=4'd2;
#10; we =0; re=0;addr=4'd2;
#10; we =0; re=1;addr=4'd3;
#10; we =0; re=1;addr=4'd4;
#10; $finish;
end

endmodule
