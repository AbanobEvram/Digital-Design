module Q1(D,A,B,C,Sel,Out,Out_bar);
input [2:0] D;
input A,B,C,Sel ;
output Out,Out_bar;
wire Z0,Z1,Z2;
assign Z0=D[0]&D[1];
assign Z1=Z0|D[2];
assign Z2=~(A^B^C);
assign Out=(Sel==1)?Z2:Z1;
assign Out_bar=~(Out);
endmodule