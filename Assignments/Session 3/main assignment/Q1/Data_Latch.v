module Data_Latch(CLR,D,G,Q);
input CLR,D,G;
output reg Q;
always @(*) begin
if (~CLR)
Q<=0;
else if (G)
Q<=D;	
end
endmodule