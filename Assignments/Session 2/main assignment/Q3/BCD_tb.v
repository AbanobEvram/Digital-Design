module BCD_tb();
reg [9:0] D_tb;
reg [3:0] Y_expected;
wire [3:0] Y_dut;
BCD dut(D_tb,Y_dut);
integer i;
initial begin
	for(i=0;i<1000;i=i+1)begin
D_tb=$random;	
if (D_tb==2)Y_expected=1;
else if(D_tb==4)Y_expected=2;
else if(D_tb==8)Y_expected=3;
else if(D_tb==16)Y_expected=4;
else if(D_tb==32)Y_expected=5;
else if(D_tb==64)Y_expected=6;
else if(D_tb==128)Y_expected=7;
else if(D_tb==256)Y_expected=8;
else if(D_tb==512)Y_expected=9;
else Y_expected=0;
#10
if (Y_expected!=Y_dut) begin
$display("ERROR...");
$stop;	
end
	end
$stop;
end
initial begin
$monitor("Y_expected=%d , Y_dut=%d , iteration=%d",Y_expected,Y_dut,i);
end
endmodule