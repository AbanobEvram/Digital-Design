module gray_counter_tb();
 reg clk_tb,rst_tb;
 wire [1:0] gray_out_dut;
 gray_counter dut(clk_tb,rst_tb,gray_out_dut);
 initial begin
 	clk_tb=0;
 	forever 
 	    #1 clk_tb=~clk_tb;
 end
 initial begin
 	rst_tb=1;
    @(negedge clk_tb);
    rst_tb=0;
    repeat(12)
    @(negedge clk_tb); 
    $stop;	
 end

endmodule