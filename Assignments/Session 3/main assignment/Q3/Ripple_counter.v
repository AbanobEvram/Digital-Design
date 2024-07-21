module Ripple_counter(clk,rstn,out);
input clk,rstn;
output [3:0] out;
wire q0,qn0,q1,qn1,q2,qn,q3,qn3;
D_Flipflop DFF0(qn0,rstn,clk,q0,qn0);
D_Flipflop DFF1(qn1,rstn,q0,q1,qn1);
D_Flipflop DFF2(qn2,rstn,q1,q2,qn2);
D_Flipflop DFF3(qn3,rstn,q2,q3,qn3);
assign out = {qn3,qn2,qn1,qn0};
endmodule