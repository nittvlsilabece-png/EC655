`timescale 1ns / 1ps

module Seq_Detector_1001_Moore(
    input clk,rst,in_bit,
    output reg detect
    );
    
    parameter S0=3'b000,
              S1=3'b001,
              S2=3'b010,
              S3=3'b011,
              S4=3'b100;
              
    reg [2:0] P_State,N_State;
              
    always @(posedge clk or posedge rst) begin
        if(rst) begin 
                P_State<=S0; detect<=0; 
            end
        else 
                P_State <= N_State;
            end
             
    always @(*) begin
        detect = 1'b0;
        case (P_State)
            S0: N_State = in_bit ? S1 : S0; 
            S1: N_State = in_bit ? S1 : S2; 
            S2: N_State = in_bit ? S1 : S3; 
            S3: N_State = in_bit ? S4: S0;
            S4: begin 
                detect =1'b1;
                N_State= in_bit ? S1:S2;
                end
            default : N_State = S0;
        endcase
    end        
                                     
              
endmodule








