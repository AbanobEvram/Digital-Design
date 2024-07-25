module Simple_DSP1(A,B,C,D,clk,rst_n,P);
 parameter OPERATION ="ADD";//ADD OR SUBTRACT
 input [17:0] A,B,D;
 input [47:0] C;
 input clk,rst_n;
 output  [47:0] P;
 reg [17:0]  Adder1 ;
 reg [47:0]  Adder2 ;
 reg [47:0] mult;
 wire [17:0] Q_D,Q_B,Q_A1,Q_A2,Q_Adder1;
 wire [47:0] Q_C,Q_mult;
 
 D_Flipflop     #(18)   d0(D,rst_n,clk,Q_D);
 D_Flipflop     #(18)   d1(B,rst_n,clk,Q_B);
 D_Flipflop     #(18)   d2(A,rst_n,clk,Q_A1);
 D_Flipflop     #(48)   d3(C,rst_n,clk,Q_C);

 D_Flipflop     #(18)   d4(Adder1,rst_n,clk,Q_Adder1);
 D_Flipflop     #(18)   d5(Q_A1,rst_n,clk,Q_A2);
 D_Flipflop     #(48)   d6(mult,rst_n,clk,Q_mult);
 D_Flipflop     #(48)   d7(Adder2,rst_n,clk,P);
 
 always @(*) begin
 	if (OPERATION=="SUBTRACT")
        Adder1= Q_D - Q_B;

    else 
        Adder1= Q_D + Q_B;

    mult = Q_A2*Q_Adder1;

 	if (OPERATION=="SUBTRACT")
        Adder2= Q_mult - Q_C;

    else 
        Adder2= Q_mult + Q_C;
 end
endmodule