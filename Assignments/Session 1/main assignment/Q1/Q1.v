module Mux2(in0,in1,sel,out);
input in0,in1,sel;
output out;
assign out=(sel==1)?in1:in0;
endmodule

module Q1(A,B,C,D,E,F,Sel,Out,Out_bar);
input A,B,C,D,E,F,Sel;
output Out,Out_bar;
wire z0,z1;
assign z0 =A&B&C ;
assign z1=~(D^E^F);
Mux2 m1(.sel(Sel),.in0(z0),.in1(z1),.out(Out));
assign Out_bar=~(Out);
endmodule