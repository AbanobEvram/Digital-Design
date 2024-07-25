module D_Flipflop(d,rstn,clk,q);
parameter WIDTH=1;
input [WIDTH-1:0] d;
input rstn,clk;
output reg [WIDTH-1:0] q;
    always @(posedge clk) begin
	    if (~rstn) 
	        q<=0;	
	    else  
	        q<=d;	
    end
endmodule