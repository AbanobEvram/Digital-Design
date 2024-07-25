module Full_Half_Adder(a,b,clk,cin,rst,sum,cout);
 parameter WIDTH=5;
 parameter PIPELINE_ENABLE=1;//if high (sequential) , low (combinational)
 parameter USE_FULL_ADDER=1;//if high use cin , low ignore cin
 input [WIDTH-1:0] a,b;
 input clk,cin,rst;
 output reg cout;
 output reg [WIDTH-1:0] sum;
 wire [WIDTH-1:0] full_sum_c,half_sum_c;
 wire full_cout_c,half_cout_c; 
 reg [WIDTH-1:0] full_sum_s,half_sum_s;
 reg full_cout_s,half_cout_s; 

 assign {full_cout_c,full_sum_c} = a+b+cin ;
 assign {half_cout_c,half_sum_c} = a+b ;
 
 always @(*) begin
 	if (PIPELINE_ENABLE==0) begin
 	    if (USE_FULL_ADDER==0) begin
 	        sum = half_sum_c;
 	        cout = half_cout_c;	
 	    end
 	    else begin
 		    sum = full_sum_c;
 		    cout = full_cout_c; 	
 		end 
 	end
 	else begin
 	    if (USE_FULL_ADDER==0) begin
 	        sum = half_sum_s;
 	        cout = half_cout_s;	
 	    end
 	    else begin
 		    sum = full_sum_s;
 		    cout = full_cout_s; 			
 	    end
 	end    
 end
 
 always @(posedge clk ) begin
 	if (rst) begin
 	    full_sum_s  <= 0;
 	    full_cout_s <= 0;
 		half_sum_s  <= 0;
 		half_cout_s <= 0;
 	end
 	else begin
 	{full_cout_s,full_sum_s} <= a+b+cin;
 	{half_cout_s,half_sum_s} <= a+b;	
 	end
 end
endmodule