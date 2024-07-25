module gray_counter(clk,rst,gray_out);
 input clk,rst;
 output [1:0] gray_out;
 reg [1:0] bin_count;
 always @(posedge clk) begin
 	if (rst) 
        bin_count<=0;
 	else 
 	    bin_count<=bin_count+1;
 end
 assign gray_out[1] = bin_count[1];
 assign gray_out[0] = ^bin_count;
endmodule