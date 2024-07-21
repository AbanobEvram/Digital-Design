module SSD_tb();
parameter N_SSD_tb = 4;
reg [N_SSD_tb-1:0] A_tb,B_tb;
reg [1:0] Opcode_tb;
reg Enable_tb,a,b,c,d,e,f,g; //a:g expected
wire a_dut,b_dut,c_dut,d_dut,e_dut,f_dut,g_dut;
SSD #(N_SSD_tb) S0(A_tb,B_tb,Opcode_tb,Enable_tb,
	               a_dut,b_dut,c_dut,d_dut,e_dut,f_dut,g_dut);
//Note OP=0:ADD,OP=1:OR,OP=2:SUB,OP=3:XOR
initial begin
#0 A_tb=10;B_tb=10;Opcode_tb=2;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1111110;//0
#10 A_tb=1;B_tb=0;Opcode_tb=1;Enable_tb=1;{a,b,c,d,e,f,g}=7'b0110000;//1
#10 A_tb=10;B_tb=8;Opcode_tb=3;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1101101;//2
#10 A_tb=1;B_tb=2;Opcode_tb=0;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1111001;//3
#10 A_tb=2;B_tb=2;Opcode_tb=0;Enable_tb=1;{a,b,c,d,e,f,g}=7'b0110011;//4
#10 A_tb=7;B_tb=2;Opcode_tb=2;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1011011;//5
#10 A_tb=8;B_tb=2;Opcode_tb=2;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1011111;//6
#10 A_tb=5;B_tb=2;Opcode_tb=1;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1110000;//7
#10 A_tb=15;B_tb=7;Opcode_tb=3;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1111111;//8
#10 A_tb=4;B_tb=5;Opcode_tb=0;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1111011;//9
#10 A_tb=5;B_tb=5;Opcode_tb=0;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1110111;//a
#10 A_tb=12;B_tb=1;Opcode_tb=2;Enable_tb=1;{a,b,c,d,e,f,g}=7'b0011111;//b
#10 A_tb=15;B_tb=3;Opcode_tb=2;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1001110;//c
#10 A_tb=5;B_tb=8;Opcode_tb=1;Enable_tb=1;{a,b,c,d,e,f,g}=7'b0111101;//d
#10 A_tb=7;B_tb=7;Opcode_tb=0;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1001111;//e
#10 A_tb=15;B_tb=0;Opcode_tb=2;Enable_tb=1;{a,b,c,d,e,f,g}=7'b1000111;//f
#10 A_tb=5;B_tb=5;Opcode_tb=0;Enable_tb=0;{a,b,c,d,e,f,g}=0;
#10
if({a_dut,b_dut,c_dut,d_dut,e_dut,f_dut,g_dut}!={a,b,c,d,e,f,g})begin
$display("Errrrror...");	
$stop;	
end
$stop;
end
initial begin
$monitor("A_tb=%d,B_tb=%d,Opcode_tb=%d,Enable_tb=%d,{a,b,c,d,e,f,g}=%b",
	    A_tb,B_tb,Opcode_tb,Enable_tb,{a,b,c,d,e,f,g});
end
endmodule