module Flipflop_tb();
parameter FF_TYPE_tb="TFF"; 
reg d_tb,rstn_tb,clk_tb;
wire q_dut,qpar_dut;
Flipflop #(FF_TYPE_tb) dut(d_tb,rstn_tb,clk_tb,q_dut,qpar_dut);
    initial begin
        clk_tb=0;
        forever 
        #1 clk_tb=~clk_tb;	
    end
integer i;
    initial begin
        rstn_tb=0;
        d_tb=0;	
        @(negedge clk_tb);
        rstn_tb=1;
        for(i=0;i<99;i=i+1) begin	
            d_tb=$random;
            @(negedge clk_tb);
        end
$stop;
end
endmodule