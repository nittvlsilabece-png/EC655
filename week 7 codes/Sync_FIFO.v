`timescale 1ns / 1ps

module Sync_FIFO #(parameter DEPTH=8, DWIDTH=16)
(
        input               	rstn,               
                            	clk,                 
                            	wr_en, 				
                            	rd_en, 				
        input      [DWIDTH-1:0] din, 				
        output reg [DWIDTH-1:0] dout, 				
        output              	empty, 				
                            	full 				
);

reg [$clog2(DEPTH):0]   wptr;
reg [$clog2(DEPTH):0]   rptr;

reg [DWIDTH-1 : 0]fifo[0:DEPTH-1];

always @ (posedge clk) begin
  if (!rstn) begin
    wptr <= 0;
  end else begin
    if (wr_en & !full) begin
      fifo[wptr] <= din;
      wptr <= wptr + 1;
    end
  end
end
  
  
always @ (posedge clk) begin
  if (!rstn) begin
    rptr <= 0;
    //dout<=0;
  end else begin
    if (rd_en & !empty) begin
      dout <= fifo[rptr];
      rptr <= rptr + 1;
    end
  end
end
  

assign empty = (wptr == rptr);
assign full  = (wptr[$clog2(DEPTH)] != rptr[$clog2(DEPTH)]) && (wptr[$clog2(DEPTH)-1:0] == rptr[$clog2(DEPTH)-1:0]);
               
endmodule