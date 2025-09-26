`timescale 1ns / 1ps


module USR(
           input clk,rst,
           input [1:0]mode,
           input sin,
           input [3:0]pin,
           output reg sout,
           output reg [3:0]pout);
       always @(posedge clk) begin
       if(rst)
       {sout,pout}<=0;
       else begin
            case(mode)
            2'b00 : pout<=pout;
            2'b01 : begin  pout<={sin,pout[3:1]};
                           sout<=pout[0]; end
            2'b10: begin   sout<=pout[3];
                           pout<={pout[2:0],sin}; end
            2'b11: pout<=pin;
            default : pout<=pout;
            endcase
            end
        end
endmodule
