module encoder_one_hot_tb();
parameter USE_GRAY_tb=0;
reg [2:0] A_tb ;
reg [6:0] B_expected;
wire  [6:0] B_dut;
encoder #(USE_GRAY_tb) dut(A_tb,B_dut);
integer i ;
  initial begin

     for(i=0;i<8;i=i+1)	begin
        A_tb = i;		
         case(A_tb)
            0:B_expected=0;
            1:B_expected=1;
            2:B_expected=2;
            3:B_expected=4;
            4:B_expected=8;
            5:B_expected=16;
            6:B_expected=32;
            7:B_expected=64;
         endcase
         #10
         if (B_expected!=B_dut) begin
         $display("Errror....");	
         $stop;	
         end
     end
    $stop;
    end
   initial begin
   $monitor("A_tb=%d,B_expected=%b",A_tb,B_expected);	
   end
endmodule