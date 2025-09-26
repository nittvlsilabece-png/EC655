`timescale 1ns / 1ps

module comp(
    input [3:0] A,
    input [3:0] B,
    output reg x,y,z
    );
    always@(*) begin
    if(A>B)begin
    z=1;
    x=0;
    y=0;
    end
    else if(A<B)
    begin
    x=1;
    y=0;
    z=0;
    end
    else begin
    y=1;
    x=0;
    z=0;
    end 
    end
endmodule
