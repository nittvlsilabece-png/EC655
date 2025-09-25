`timescale 1ns / 1ps

module dec_to_bcd_tb();
    reg [3:0] dec_in;
    wire [3:0] bcd_out;
    dec_to_bcd uut(dec_in,bcd_out);
    initial begin

    dec_in =4'd5; #10;
    dec_in =4'd9; #10;
    dec_in =4'd6; #10;
    dec_in =4'd15; #10;
    dec_in =4'd0; #10;
    dec_in =4'd6; #10;
    dec_in =4'd4; #10;
    dec_in =4'd11; #10;
    dec_in =4'd3; #10;
    $finish;
    end
    
endmodule
