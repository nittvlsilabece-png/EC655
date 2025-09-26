`timescale 1ns / 1ps

module T_FF(
    input t,clk,
    output reg q=0,
    output qbar
    );
    always @(posedge clk) begin
    if(t)
    q<=~q; 
    else  q<=q;
    end
    assign qbar=~q;
endmodule