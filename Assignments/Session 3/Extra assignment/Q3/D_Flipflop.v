module D_Flipflop(d,rstn,clk,q,qpar);
input d,rstn,clk;
output reg q;
output qpar;
assign qpar = ~q ;
always @(posedge clk or negedge rstn) begin
	if (~rstn) 
	q<=0;	
	else  
	q<=d;	
end
endmodule