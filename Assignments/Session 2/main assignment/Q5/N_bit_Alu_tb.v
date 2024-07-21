module N_bit_Alu_tb();
parameter N_tb =4;
reg [N_tb-1:0] A_tb,B_tb,Result_expected;
reg [1:0] Opcode_tb;
wire [N_tb-1:0] Result_dut;
N_bit_Alu #(N_tb) dut(A_tb,B_tb,Opcode_tb,Result_dut);
integer i ;
initial begin
for(i=0;i<99;i=i+1)begin
A_tb=$random;	
B_tb=$random;
Opcode_tb=$random;
	case(Opcode_tb)
0:Result_expected=A_tb+B_tb;
1:Result_expected=A_tb|B_tb;
2:Result_expected=A_tb-B_tb;
3:Result_expected=A_tb^B_tb;
endcase
#10
if(Result_expected!=Result_dut)begin
$display ("Errror...");
$stop;	
end
end
$stop;
end 
initial begin
$monitor("A_tb=%d , B_tb=%d , Opcode_tb=%d , Result_expected=%d",A_tb,B_tb,Opcode_tb,Result_expected);	
end
endmodule