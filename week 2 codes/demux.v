`timescale 1ns / 1ps

module demux(
    input in,
    input [2:0]s,
    output reg out
    );
   always@(*)
   begin
   case(s)
   3'b000:out=in;
   3'b001:out=in;
   3'b010:out=in;
   3'b011:out=in;
   3'b100:out=in;
   3'b101:out=in;
   3'b110:out=in;
   3'b111:out=in;
   endcase
   end
endmodule
