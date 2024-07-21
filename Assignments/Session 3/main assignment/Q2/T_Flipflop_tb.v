module T_Flipflop_tb();
reg t_tb,rstn_tb,clk_tb,q_expected;
wire q_dut,qpar_dut;
T_Flipflop dut(t_tb,rstn_tb,clk_tb,q_dut,qpar_dut);
    initial begin
        clk_tb=0;	
        forever
        #1 clk_tb=~clk_tb;
    end
    integer i;
    initial begin
        rstn_tb=0;
        t_tb=0;
        q_expected=0;
        @(negedge clk_tb);
        if(q_expected!=q_dut) $stop;
        
        rstn_tb=1;	
        for(i=0;i<1000;i=i+1)begin
            t_tb=$random;
            @(posedge clk_tb);
            if(t_tb)   q_expected=~q_expected;
            @(negedge clk_tb);
            if (q_expected!=q_dut) $stop;
            end
$stop;
end
endmodule