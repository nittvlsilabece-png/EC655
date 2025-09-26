`timescale 1ns / 1ps

module D_FF(
    input d,clk,rst,
    output reg q,
    output qbar
    );
    always @(posedge clk) begin
    if(rst) q<=0;
    else  q<=d; end
    assign qbar=~q;
endmodule
