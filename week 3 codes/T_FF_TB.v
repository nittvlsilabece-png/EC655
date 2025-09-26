`timescale 1ns / 1ps

module T_FF_TB(

    );
    reg t,clk;
    wire q,qbar;
    T_FF DUT(t,clk,q,qbar);
    initial begin
    clk=0;
    t=0; #10;
    t=1;#10;
    t=0;#10;
     t=1;#10;
    t=0;#10;
    $finish;
    end
    always #5 clk=~clk;
endmodule