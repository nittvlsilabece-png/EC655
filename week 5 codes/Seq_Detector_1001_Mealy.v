`timescale 1ns / 1ps

module Seq_Detector_1001_Mealy(
    input clk,rst,in_bit,
    output reg detect
    );
    
    parameter S0=2'b00,
              S1=2'b01,
              S2=2'b10,
              S3=2'b11;
              
    reg [1:0] P_State, N_State;
              
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
            S3: begin 
                if (in_bit) begin
                    N_State =  S1;
                    detect = 1'b1;
                end
                else 
                    N_State = S0;
            end
            default : N_State = S0;
        endcase
    end        
                                     
              
endmodule








