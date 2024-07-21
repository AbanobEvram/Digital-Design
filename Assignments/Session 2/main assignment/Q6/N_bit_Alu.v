module  N_bit_Alu(A,B,Opcode,Result);
parameter N = 4 ;
input [N-1:0] A,B;
input [1:0] Opcode ;
output reg [N-1:0] Result ;
wire [N-1:0] Adder_result ;
N_bit_Adder #(N) m1(A,B,Adder_result);
always @(*) begin
	if (Opcode==0) 
Result=Adder_result;
	else if (Opcode==1)
Result=A|B;
    else if (Opcode==2)		
Result=A-B;
    else if (Opcode==3)
Result=A^B;    	
end
endmodule