module  Extend_counter_tb();
 reg clk,set;
 wire [3:0] out_extend,out_structural;
 wire div_2_extend,div_4_extend,div_2_structural,div_4_structural;
 Ripple_counter golden(clk,set,out_structural);
 Extend_counter  dut(clk,set,out_extend,div_2_extend,div_4_extend);
 assign div_2_structural = out_structural[0];
 assign div_4_structural = out_structural[1] ; 
    initial begin
        clk=0;
        forever 
            #1 clk=~clk;	
    end
 integer i;
    initial begin
        set=0;
        @(negedge clk);
        if(out_extend!=out_structural) $display("Errrrorr in output");	
        if(div_2_extend!=div_2_structural) $display("Errrrorr in div_2");
        if(div_4_extend!=div_4_structural) $display("Errrrorr in div_4");
        set=1;
        for (i=0;i<50;i=i+1) begin
            @(negedge clk);	
            if(out_extend!=out_structural) $display("Errrrorr in output");	
            if(div_2_extend!=div_2_structural) $display("Errrrorr in div_2");
            if(div_4_extend!=div_4_structural) $display("Errrrorr in div_4");	
        end
        $stop;
    end
endmodule