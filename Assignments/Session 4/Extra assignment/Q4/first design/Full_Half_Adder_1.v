module Full_Half_Adder(a,b,clk,cin,rst,sum,cout);
 parameter WIDTH=5;
 parameter PIPELINE_ENABLE=1;//if high (sequential) , low (combinational)
 parameter USE_FULL_ADDER=1;//if high use cin , low ignore cin
 input [WIDTH-1:0] a,b;
 input clk,cin,rst;
 output reg cout;
 output reg [WIDTH-1:0] sum;
 reg [WIDTH:0] total ;//sum and cout
 always @(posedge clk) begin
    if(PIPELINE_ENABLE!=0) begin
 	    if (rst) begin
 	    	sum<=0;
 	    	cout<=0;
 	    end
 	    else begin
 	    	if (USE_FULL_ADDER==0) 
 	    	   total<=a+b;	
 	    	else 
 	    		total<=a+b+cin;
 	    end
    end 
 end
 always @(*) begin
    if(PIPELINE_ENABLE==0) begin
 	    	if (USE_FULL_ADDER==0) 
 	    	   total=a+b;	
 	    	else 
 	    	   total=a+b+cin;
    end 
 end
 assign {cout,sum} = total ;
endmodule