module Flipflop(d,rstn,clk,q,qpar);
parameter FF_TYPE="DFF"; 
input d,rstn,clk;
output reg q;
output qpar;
assign qpar = ~q ;   
    always @(posedge clk or negedge rstn) begin
	    if (~rstn) 
	        q<=0;
	    else if (FF_TYPE=="TFF")
	        q<=q^d; //when d is high then q is toggle 
        else
            q<=d;
    end 
endmodule