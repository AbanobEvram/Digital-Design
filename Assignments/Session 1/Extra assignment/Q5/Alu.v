module Mux2(In0_Mux2,In1_Mux2,Sel_Mux2,Out_Mux2);
input In0_Mux2,In1_Mux2,Sel_Mux2;
output Out_Mux2;
assign Out_Mux2=(Sel_Mux2==1)?In1_Mux2:In0_Mux2;
endmodule

module Mux3(In0_Mux3,In1_Mux3,In2_Mux3,Sel_Mux3,Out_Mux3);
input In0_Mux3,In1_Mux3,In2_Mux3;
input [1:0] Sel_Mux3;
output Out_Mux3;
assign Out_Mux3=(Sel_Mux3==0)?In0_Mux3:(Sel_Mux3==1)?In1_Mux3:In2_Mux3;
endmodule

module Adder2(In0_Adder,In1_Adder,Carryout_Adder,Carryin_Adder,Out_Adder);
input In0_Adder,In1_Adder,Carryin_Adder;
output Out_Adder,Carryout_Adder;
assign Out_Adder =In0_Adder+In1_Adder+Carryin_Adder ;
assign Carryout_Adder=(In0_Adder&In1_Adder)|(Carryin_Adder&In1_Adder)|(Carryin_Adder&In0_Adder);
endmodule

module Alu(A,B,Ainvert,Binvert,Carryin,Operation,Carryout,Result);
input A,B,Ainvert,Binvert,Carryin;
input [1:0] Operation;
output Carryout,Result;
wire Z0,Z1,Z2;
Mux2 m1(.Sel_Mux2(Ainvert),.In0_Mux2(A),.In1_Mux2(~A),.Out_Mux2(Z0));
Mux2 m2(.Sel_Mux2(Binvert),.In0_Mux2(B),.In1_Mux2(~B),.Out_Mux2(Z1));
Adder2 a1(.In0_Adder(Z0),.In1_Adder(Z1),.Carryin_Adder(Carryin),.Carryout_Adder(Carryout),.Out_Adder(Z2));
Mux3 m3(.Sel_Mux3(Operation),.In0_Mux3(Z0&Z1),.In1_Mux3(Z0|Z1),.In2_Mux3(Z2),.Out_Mux3(Result));
endmodule