module LFSR_tb();
 reg clk_tb,rst_tb,set_tb;
 wire [3:0] out_dut;
 LFSR  dut(clk_tb,rst_tb,set_tb,out_dut);
 initial begin
 	clk_tb=0;
 	forever
 	 #1 clk_tb=~clk_tb;
 end
 initial begin
    rst_tb=1;set_tb=1;
    @(negedge clk_tb);
    rst_tb=0;set_tb=0;
    repeat(35)
    @(negedge clk_tb);
    rst_tb=1;set_tb=1;
    @(negedge clk_tb);
    $stop;
 end 
endmodule