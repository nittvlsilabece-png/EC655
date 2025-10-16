`timescale 1ns / 1ps

module alu_4bit(
    input [3:0] A,B,
    input [1:0] S,
    output reg [7:0] res=0
    );
    wire [7:0] inter_add;
    wire [7:0] inter_mul;
    wire dummy;
    array_multiplier am1(A,B,inter_mul);
    CSA cs1({4'd0,A},{4'd0,B},1'b0,inter_add,dummy);
    always @(*) begin
     case(S)
       2'b00: res=A&B;
       2'b01: res=A|B;
       2'b10: res=inter_mul;
       2'b11: res=inter_add;
       default : res = 8'd0;
       endcase
       end
endmodule
