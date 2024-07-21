module dff_en_pre(E, D, Q, clk, PRE);
input E,D,clk ,PRE;
output reg Q ;
always @(posedge clk or negedge PRE) begin
 	if (~PRE) 
 Q<= 1;
 else if (E==1)
 Q<=D;		
 
 end 
endmodule