module LFSR(clk,rst,set,out);
 input clk,rst,set;
 output [3:0] out;
 wire q1,q2,q3,q4,d2;
 FF1   FF1(q4,clk,set,q1);
 FF2   FF2(d2,clk,rst,q2);
 FF2   FF3(q2,clk,rst,q3);
 FF2   FF4(q3,clk,rst,q4);
assign d2 =q4^q1 ;
assign out ={q4,q3,q2,q1};
endmodule