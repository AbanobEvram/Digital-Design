module Data_Latch_tb();
reg CLR_tb,G_tb,D_tb,Q_expected;
wire Q_dut;
Data_Latch m0(CLR_tb,D_tb,G_tb,Q_dut);
integer i;
    initial begin
    CLR_tb=0;
    G_tb=0;
    D_tb=0;	
    Q_expected=0;
    #10
    if(Q_expected!=Q_dut) begin
        $display("Errorrrr");
        $stop;	
    end
    for(i=0;i<99;i=i+1) begin
        CLR_tb=$random;	
        G_tb=$random;
        D_tb=$random;
        if (~CLR_tb)
          Q_expected=0;
        else if(G_tb)
          Q_expected=D_tb;
    #10
    if(Q_expected!=Q_dut) begin
        $display("Errorrrr");
        $stop;	
    end
   end
   $stop;
   end
endmodule