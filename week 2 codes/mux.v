`timescale 1ns / 1ps

module mux(
    input s0,s1,d0,d1,d2,d3,
    output reg data_out
    );
    
    always @ (*) begin
    case({s1,s0})
    2'b00: data_out = d0;
    2'b01: data_out = d1;
    2'b10: data_out = d2;
    2'b11: data_out = d3;
    default: data_out = d0;   
    endcase
    end
endmodule
