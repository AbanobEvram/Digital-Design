module FF2(d,clk,rst,q);
input d,clk,rst;
output reg q;
always @(posedge clk or posedge rst) begin
	if(rst)
        q<=0;
    else 
        q<=d;
end
endmodule