module Ripple_counter_tb();
reg clk_tb,rstn_tb;
wire [3:0] out_dut;
Ripple_counter dut(clk_tb,rstn_tb,out_dut);
    initial begin
       clk_tb=0;	
        forever
        #1 clk_tb=~clk_tb;
    end
    initial begin
        rstn_tb=0;
        @(negedge clk_tb);
        rstn_tb=1;
        #200
        $stop;
    end
endmodule