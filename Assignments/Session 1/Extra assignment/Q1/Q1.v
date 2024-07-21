module Q1(A,out);
input [3:0] A;
output out ;
assign out = (2<A&&A<8)?1:0;
endmodule