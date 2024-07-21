module Decoder2(A,D);
input [1:0] A ;
output reg [3:0] D;
always @(*) begin
	if (A==0) 
	D='b0001;		
	else if (A==1) 
	D='b0010;	
	else if (A==2) 
    D='b0100;
	else if (A==3) 
	D='b1000;
end
endmodule