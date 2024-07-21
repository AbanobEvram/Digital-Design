module Qd_for_DFF();
parameter FF_TYPE_tb="DFF";  
reg d_tb,rstn_tb,clk_tb;
wire q_param,q_golden,qpar_param,qpar_golden;
D_Flipflop golden(d_tb,rstn_tb,clk_tb,q_golden,qpar_golden);
Flipflop #(FF_TYPE_tb) param(d_tb,rstn_tb,clk_tb,q_param,qpar_param);
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
        if((q_golden!=q_param)||(qpar_golden!=qpar_param))  $stop;
        for (i=0;i<1000;i=i+1) begin
            d_tb=$random;
            rstn_tb=$random;
            @(negedge clk_tb);	
        if((q_golden!=q_param)||(qpar_golden!=qpar_param))  $stop;
        end
        $stop;
    end
endmodule