module DSP_block_tb ();
 parameter OPERATION_tb="ADD";
 reg [17:0] D_tb,B_tb,A_tb;
 reg  [47:0]C_tb;
 reg clk_tb,rst_n_tb;
 wire [47:0]P_dut;
 Simple_DSP2 #(OPERATION_tb) DUT(A_tb,B_tb,C_tb,D_tb,clk_tb,rst_n_tb,P_dut);
 initial begin
    clk_tb=0;
    forever 
        #1 clk_tb=~clk_tb;  
 end
 initial begin
    rst_n_tb=0;
    D_tb=0;B_tb=0;A_tb=0;C_tb=0;
    @(negedge clk_tb );

    rst_n_tb=1;D_tb=5;B_tb=5;A_tb=10;C_tb=10;//p=105
    @(negedge clk_tb );

    D_tb=5;B_tb=5;A_tb=5;C_tb=5;//p=55
    @(negedge clk_tb );

    D_tb=15;B_tb=15;A_tb=5;C_tb=5;//p=155
    @(negedge clk_tb );

    D_tb=20;B_tb=20;A_tb=5;C_tb=5;//p=205
    @(negedge clk_tb );

    D_tb=2;B_tb=5;A_tb=5;C_tb=5;//p=40
    @(negedge clk_tb );

    D_tb=3;B_tb=5;A_tb=5;C_tb=5;//p=45
    @(negedge clk_tb );

    D_tb=4;B_tb=5;A_tb=5;C_tb=5;//p=50
    @(negedge clk_tb );

    D_tb=15;B_tb=7;A_tb=2;C_tb=5;//p=49
    @(negedge clk_tb );


    D_tb=18;B_tb=2;A_tb=4;C_tb=5;//p=85
    @(negedge clk_tb );

    D_tb=8;B_tb=2;A_tb=9;C_tb=6;//p=96
    @(negedge clk_tb );
    D_tb=16;B_tb=1;A_tb=4;C_tb=7;//p=75
    repeat (5)
    @(negedge clk_tb );
    $stop;
    end
endmodule