module N_bit_Adder(A,B,C);
parameter N = 1;
input [N-1:0] A,B;
output [N-1:0] C ;
assign C = A+B;
endmodule