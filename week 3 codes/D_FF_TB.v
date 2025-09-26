`timescale 1ns / 1ps

module D_FF_TB(

    );
    reg d,clk;
    wire q,qbar;
    D_FF DUT(d,clk,q,qbar);
    initial begin
    clk=0;
    d=0; #10;
    d=1;#10;
    d=0;#10;
    $finish;
    end
    always #5 clk=~clk;
endmodule
