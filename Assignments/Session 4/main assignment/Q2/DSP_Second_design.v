module Simple_DSP2(A,B,C,D,clk,rst_n,p);
 parameter OPERATION ="ADD";//ADD OR SUBTRACT
 input [17:0] A,B,D;
 input [47:0] C;
 input clk,rst_n;
 output reg [47:0] p;
 reg [17:0] Q_D,Q_B,Q_A1,Q_A2,Q_Adder1;
 reg [47:0] Q_C,Q_mult; 
 always @(posedge clk ) begin
 	if (~rst_n) begin
 		Q_D<=0;
 		Q_B<=0;
 		Q_A1<=0;
 		Q_A2<=0;
 		Q_Adder1<=0;
 		Q_C<=0;
 		Q_mult<=0;
 		p<=0;
 	end
 	else begin
 	    Q_D<=D;
 	    Q_B<=B;
 	    Q_C<=C;
 		Q_A1<=A;
 		Q_A2<=Q_A1;
 		if(OPERATION=="SUBTRACT") begin
            Q_Adder1<= Q_D - Q_B;
            p<= Q_mult - Q_C;
 		end
        else begin
            Q_Adder1<= Q_D + Q_B;
            p<= Q_mult + Q_C;
 		end
 		 Q_mult<=Q_A2*Q_Adder1;
 	end
 end
endmodule