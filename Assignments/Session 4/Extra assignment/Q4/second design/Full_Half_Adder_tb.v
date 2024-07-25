module Full_Half_Adder_tb();
 parameter WIDTH_tb=5,PIPELINE_ENABLE_tb=1,USE_FULL_ADDER=1;
 reg clk_tb,cin_tb,rst_tb;
 reg [WIDTH_tb-1:0] a_tb,b_tb;
 wire [WIDTH_tb-1:0] sum_dut;
 wire cout_dut;
 Full_Half_Adder #(WIDTH_tb,PIPELINE_ENABLE_tb,USE_FULL_ADDER) dut(a_tb,b_tb,clk_tb,cin_tb,rst_tb,sum_dut,cout_dut); 
 initial begin
   clk_tb=0;
   forever 
    #1 clk_tb=~clk_tb;
 end
 integer i;
 initial begin
   a_tb=0;b_tb=0;cin_tb=0;rst_tb=1;
    @(negedge clk_tb);
    rst_tb=0;
    for (i=0;i<1000;i=i+1) begin
    a_tb=$random;
    b_tb=$random;
    cin_tb=$random;  
    @(negedge clk_tb);
    end
$stop;
 end
endmodule