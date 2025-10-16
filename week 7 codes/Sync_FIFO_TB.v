`timescale 1ns / 1ps

module Sync_FIFO_TB;
 
  parameter DEPTH  = 8;
  parameter DWIDTH = 16;

  
  reg                clk, rstn;
  reg                wr_en, rd_en;
  reg  [DWIDTH-1:0]  din;
  wire [DWIDTH-1:0]  dout;
  wire               empty, full;

  
  Sync_FIFO #(DEPTH, DWIDTH) uut (
    .rstn   (rstn),
    .clk    (clk),
    .wr_en  (wr_en),
    .rd_en  (rd_en),
    .din    (din),
    .dout   (dout),
    .empty  (empty),
    .full   (full)
  );

 
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  
  initial begin
   
    rstn  = 0;
    wr_en = 0;
    rd_en = 0;
    din   = 0;
    
    
    #12 rstn = 1;
   
   
    repeat (DEPTH) begin
      @(negedge clk);
      if (!full) begin
        wr_en = 1;
        din   = din + 16'h11;
      end else begin
        wr_en = 0;
      end
    end
    @(negedge clk);
    wr_en = 0;

    
  
    #20;

  
    repeat (DEPTH) begin
      @(negedge clk);
      if (!empty) begin
        rd_en = 1;
      end else begin
        rd_en = 0;
      end
    end
    @(negedge clk);
    rd_en = 0;

  
    
    #20;
    $finish;
  end



endmodule
