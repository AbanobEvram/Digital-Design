module dff_en_pre_tb();
reg E_tb , D_tb ,clk_tb,pre_tb;
wire Q_dut;
dff_en_pre m0(E_tb,D_tb,Q_dut,clk_tb,pre_tb);
integer i=0 ;
initial begin
clk_tb=0;
forever
#1 clk_tb=~clk_tb;	
end
initial begin
pre_tb=0;
D_tb=0;
E_tb=0;
@(negedge clk_tb);
pre_tb=1;
for(i=0;i<1000;i=i+1)begin
D_tb=$random;
@(negedge clk_tb);	
end
E_tb=1;
for(i=0;i<8000;i=i+1)begin
D_tb=$random;
@(negedge clk_tb);
end
for(i=0;i<1000;i=i+1)begin
D_tb=$random;
E_tb=$random;
@(negedge clk_tb);
end
$stop;
end
endmodule