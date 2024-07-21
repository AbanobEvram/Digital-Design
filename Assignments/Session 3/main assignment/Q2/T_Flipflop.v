module T_Flipflop(t,rstn,clk,q,qpar);
input t,rstn,clk;
output reg q;
output qpar;
assign qpar = ~q ;
always @(posedge clk or negedge rstn) begin
	if (~rstn) 
	    q<=0;
	else if (t)
	    q<=~q;
end
endmodule