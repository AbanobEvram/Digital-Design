module Q1_tb_randomized();
reg [2:0] D_tb;
reg A_tb,B_tb,C_tb,Sel_tb,Out_excpected,Out_bar_excpected;
wire Out_dut,Out_bar_dut;
Q1 Dut(D_tb,A_tb,B_tb,C_tb,Sel_tb,Out_dut,Out_bar_dut);
integer i ;
initial begin
	for (i=0;i<99;i=i+1)begin
A_tb=$random;		
B_tb=$random;
C_tb=$random;
D_tb=$random;
Sel_tb=$random;
Out_excpected=(Sel_tb==1)?(~(A_tb^B_tb^C_tb)):
((D_tb[0]&D_tb[1])|(D_tb[2]));
Out_bar_excpected =~(Out_excpected);
#10
if(Out_excpected!=Out_dut)begin
$display("Error...");
$stop;
end
	end
$stop;	
end
initial begin
$monitor("Out_excpected =%d , Out_dut=%d",Out_excpected,Out_dut);
end
endmodule 