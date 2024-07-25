module FF1(d,clk,set,q);
input d,clk,set;
output reg q;
always @(posedge clk or posedge set) begin
	if(set)
        q<=1;
    else 
        q<=d;
end
endmodule