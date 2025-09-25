`timescale 1ns / 1ps

module bcd_to_ex3(
    input [3:0] bcd,
    output reg [3:0] ex3
    );
    
    always @(*)
    begin
    if(bcd<10) begin 
        ex3=bcd + 4'b0011;
        end
    else begin 
        ex3=0;              //out of range
        end
    end
    
endmodule
