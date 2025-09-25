`timescale 1ns / 1ps

module bcd_to_ex3(
    );
    reg [3:0] bcd;
    wire [3:0] ex3;
    integer i;
    bcd_to_ex3 uut (bcd,ex3);
    initial
    begin
    for (i=0; i<15; i=i+1)
    begin
    bcd =i;
    #10;
    end
    $finish;
    end
 
 endmodule
