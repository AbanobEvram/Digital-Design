module SLE_tb();
 reg D,CLK,EN,ALn,ADn,SLn,SD,LAT;
 wire 	Q_dut;			
 SLE   dut(D,CLK,EN,ALn,ADn,SLn,SD,LAT,Q_dut);
    initial begin
        CLK=0;
        forever
        #1 CLK=~CLK;	
        end
 integer i;       
    initial begin
        SD=1;ADn=0;LAT=0;ALn=0;//note SD&ADn&LAT are static
        D=0;EN=0;SLn=0;
        @(negedge CLK);
        ALn=1;            
        for(i=0;i<100;i=i+1)begin
            D=$random;
            EN=$random;
            SLn=$random;
            @(negedge CLK);
        end
        ALn=0;D=0;EN=0;SLn=0;// I will reset the values to change the LAT from 0to1 
        @(negedge CLK); 
        ALn=1;LAT=1;
        for(i=0;i<100;i=i+1)begin
            D=$random;
            EN=$random;
            SLn=$random;
            @(negedge CLK);
        end          
    $stop;
    end
endmodule