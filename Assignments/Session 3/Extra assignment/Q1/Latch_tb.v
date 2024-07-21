module latch_tb();
 parameter LATCH_WIDTH_tb = 6;
 reg aset_tb,gate_tb,aclr_tb;
 reg [LATCH_WIDTH_tb-1:0] data_tb,q_excpected;
 wire [LATCH_WIDTH_tb-1:0] q_dut;
 latch #(LATCH_WIDTH_tb) dut(aset_tb,data_tb,gate_tb,aclr_tb,q_dut);
 integer i;
   initial begin
      aset_tb=0;aclr_tb=1;data_tb=0;gate_tb=0;q_excpected=0;	
      if(q_dut!=q_excpected) begin
         $display("errorr");
         $stop;	
         end
      #10
      for (i=0;i<99;i=i+1) begin
         aset_tb=$random;
         aclr_tb=$random;
         gate_tb=$random;
         data_tb=$random;
         if(aclr_tb)
            q_excpected<=0;
         else if (aset_tb)
            q_excpected<={LATCH_WIDTH_tb{1'b1}};
         else if (gate_tb) 
            q_excpected<=data_tb;
         #10
         if(q_excpected!=q_dut)begin
	        $display("Errrror");
	        $stop;
         end
      end
         $stop;
   end
endmodule