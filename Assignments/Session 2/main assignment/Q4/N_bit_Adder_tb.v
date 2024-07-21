module N_bit_Adder_tb();
parameter N_tb =4 ;
reg [N_tb-1:0] A_tb,B_tb,C_expected;
wire[N_tb-1:0] C_dut;
N_bit_Adder #(N_tb) dut(A_tb,B_tb,C_dut);
integer i ;
initial begin
	for(i=0;i<99;i=i+1)begin 
A_tb=$random;
B_tb=$random;
C_expected=A_tb+B_tb;
#10
if(C_dut!=C_expected)begin
$display("Errror...");
$stop;	
end
	end
$stop;
end
initial begin
$monitor("A_tb=%d , B_tb=%d , C_expected=%d ,iteration=%d",A_tb,B_tb,C_expected,i);
end
endmodule