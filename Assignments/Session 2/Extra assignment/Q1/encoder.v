module encoder(A,B);
parameter USE_GRAY=0;
input [2:0] A;
output reg [6:0] B;
 generate
    if (USE_GRAY==0)
       always @(A) 
       case(A)
          0:B=0;
          1:B=1;
          2:B=2;
          3:B=4;
          4:B=8;
          5:B=16;
          6:B=32;
          7:B=64;
        endcase
    else	
       always @(A)
       case(A)
          0:B=0;
          1:B=1;
          2:B=3;
          3:B=2;
          4:B=6;
          5:B=7;
          6:B=5;
          7:B=4;
        endcase
 endgenerate
endmodule
