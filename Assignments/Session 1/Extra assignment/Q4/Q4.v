module prime(A,Out);
input [2:0] A ;
output reg Out;
always @(*) begin
	case (A)
	2 :Out =1;
	3 :Out =1;
	5 :Out =1;
	7 :Out =1;
	default: Out=0;
endcase
end
endmodule