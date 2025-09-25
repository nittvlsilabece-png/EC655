`timescale 1ns / 1ps

module CSA_TB(

    );
    reg [7:0]a,b;
    reg cin;
    wire [7:0]Sum;
    wire cout;
    CSA uut(a,b,cin,Sum,cout);
    initial
    begin
    a=8'd100;b=8'd78;cin=1'b0;
    #10 a=8'd200;b=8'd58;cin=1'b0;
    #10 a=8'd150;b=8'd28;cin=1'b1;
    #10 a=8'd10;b=8'd78;cin=1'b0;
    #10 a=8'd100;b=8'd122;cin=1'b1;
    #10 a=8'd0;b=8'd78;cin=1'b0; 
    $finish ; end
endmodule
