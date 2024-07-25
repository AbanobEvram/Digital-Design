module Shift_tb1();
 parameter SHIFT_DIRECTION_TB = "RIGHT" ; //LEFT OR RIGHT 
 parameter SHIFT_AMOUNT_TB = 2; //possible values 1:7
 reg clk_tb,rst_tb,load_tb;
 reg [7:0] load_value_tb;
 wire [7:0] po_dut;
 Shift_register #(SHIFT_DIRECTION_TB,SHIFT_AMOUNT_TB) dut( clk_tb,rst_tb,load_tb,load_value_tb,po_dut);
 initial begin
    clk_tb=0;
    forever 
        #1 clk_tb=~clk_tb;  
 end
 initial begin
    rst_tb=1;load_tb=0;load_value_tb=0;
    @(negedge clk_tb );
    rst_tb=0;load_tb=1;load_value_tb=$random;
    @(negedge clk_tb );
    load_tb=0;
    @(negedge clk_tb );
   load_tb=1;load_value_tb=$random;
   @(negedge clk_tb );
   load_tb=0;
   @(negedge clk_tb );
   $stop;
end
endmodule