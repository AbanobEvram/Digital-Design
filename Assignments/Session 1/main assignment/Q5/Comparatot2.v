module comparator2(A,B,greater,equal,less);
input [3:0] A,B;
output reg greater,equal,less;
always @(*) begin
	if (A>B) begin
        greater=1;
	equal=0;
	less=0;	
	end
	else if (A==B) begin
	greater=0;
	equal=1;
	less=0;	
	end
        else if(A<B)begin
        greater=0;
        equal=0;
        less=1;
        end
end
endmodule