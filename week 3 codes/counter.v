`timescale 1ns / 1ps

module counter (
 input clk , rst , ctrl ,
 output reg [3:0] count=0
 ) ;
wire myclk;
clock_divder DUT(clk,myclk);
always @ ( posedge myclk )
 begin
 
 if( rst )
 count <= 4'd0 ;
 else
 begin
     if( ctrl ) begin
        count <= count + 1'b1 ; end
 else
        begin
        count <= count - 1'b1 ; end
 end
 end
 endmodule
 module clock_divder(
    input inclk,
    output reg outclk=0
    );
    integer i=0;
    always @(posedge inclk) begin
      if(i==100000000-1) begin
         i<=0;
         outclk<=~outclk; end
         
       else i<=i+1;
       end
endmodule
