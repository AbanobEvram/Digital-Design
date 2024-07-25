module Counter_golden_tb();
 reg clk,set;
 wire [3:0] out_behavioral,out_structural;
 Ripple_counter golden(clk,set,out_structural);
 Counter  dut(clk,set,out_behavioral);
    initial begin
        clk=0;
        forever 
        #1 clk=~clk;	
        end
 integer i;
    initial begin
        set=0;
        @(negedge clk);
        if(out_behavioral!=out_structural)begin
            $display("Errrrorr");
            $stop;	
        end
        set=1;
        for(i=0;i<50;i=i+1)begin
            @(negedge clk);	
            if(out_behavioral!=out_structural)begin
            $display("Errrrorr");
            $stop;	
            end
        end
        $stop;
    end
endmodule