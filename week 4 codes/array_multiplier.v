`timescale 1ns / 1ps

module array_multiplier(
    input [3:0] A,B,
    output [7:0] z
    );
    wire p[3:0][3:0];
    wire [10:0] c ;
 wire [5:0] s ;

 genvar i , j ;
 generate
 for ( i = 0; i < 4; i = i + 1) begin : row
    for (j = 0; j < 4; j = j + 1) begin : col
      and pp_gen ( p [ i ][ j ] , A [i ] , B [j ]) ;
    end
 end
 endgenerate
 assign z [0] = p [0][0];

 half_adder ha0 ( p [0][1] , p [1][0] , z [1] , c [0]) ;
 half_adder ha1 ( p [1][1] , p [2][0] , s [0] , c [1]) ;
 half_adder ha2 ( p [2][1] , p [3][0] , s [1] , c [2]) ;

 full_adder fa0 ( p [0][2] , c [0] , s [0] , z [2] , c [3]) ;
 full_adder fa1 ( p [1][2] , c [1] , s [1] , s [2] , c [4]) ;
 full_adder fa2 ( p [2][2] , c [2] , p [3][1] , s [3] , c [5]) ;

 full_adder fa3 ( p [0][3] , c [3] , s [2] , z [3] , c [6]) ;
 full_adder fa4 ( p [1][3] , c [4] , s [3] , s [4] , c [7]) ;
 full_adder fa5 ( p [2][3] , c [5] , p [3][2] , s [5] , c [8]) ;

 half_adder ha3 ( c [6] , s [4] , z [4] , c [9]) ;
 full_adder fa6 ( c [9] , c [7] , s [5] , z [5] , c [10]) ;
 full_adder fa7 ( c [10] , c [8] , p [3][3] , z [6] , z [7]) ;

 endmodule


module full_adder (input a,b,cin, output s,c);
assign s=a^b^cin;
assign c=a&b|b&cin|cin&a;
endmodule

module half_adder (input a,b, output s,c);
assign s=a^b;
assign c=a&b;
endmodule