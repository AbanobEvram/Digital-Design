module SSD(A,B,Opcode,Enable,a,b,c,d,e,f,g);
parameter N_SSD = 4;
input [N_SSD-1:0] A,B;  
input [1:0] Opcode;
input Enable ;
output reg a,b,c,d,e,f,g;
wire [N_SSD-1:0] Result_alu;
N_bit_Alu #(N_SSD) Alu(A,B,Opcode,Result_alu);
always @(*) begin
	case({Result_alu,Enable})
5'b00001:{a,b,c,d,e,f,g}=7'b1111110;//0
5'b00011:{a,b,c,d,e,f,g}=7'b0110000;//1
5'b00101:{a,b,c,d,e,f,g}=7'b1101101;//2
5'b00111:{a,b,c,d,e,f,g}=7'b1111001;//3
5'b01001:{a,b,c,d,e,f,g}=7'b0110011;//4
5'b01011:{a,b,c,d,e,f,g}=7'b1011011;//5
5'b01101:{a,b,c,d,e,f,g}=7'b1011111;//6
5'b01111:{a,b,c,d,e,f,g}=7'b1110000;//7
5'b10001:{a,b,c,d,e,f,g}=7'b1111111;//8
5'b10011:{a,b,c,d,e,f,g}=7'b1111011;//9
5'b10101:{a,b,c,d,e,f,g}=7'b1110111;//a
5'b10111:{a,b,c,d,e,f,g}=7'b0011111;//b
5'b11001:{a,b,c,d,e,f,g}=7'b1001110;//c
5'b11011:{a,b,c,d,e,f,g}=7'b0111101;//d
5'b11101:{a,b,c,d,e,f,g}=7'b1001111;//e
5'b11111:{a,b,c,d,e,f,g}=7'b1000111;//f
default : {a,b,c,d,e,f,g}=0;
endcase
end
endmodule