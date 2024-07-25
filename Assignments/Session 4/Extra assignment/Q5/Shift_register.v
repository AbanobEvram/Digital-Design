module Shift_register(clk,rst,load,load_value,po);
 parameter SHIFT_DIRECTION = "LEFT" ; //LEFT OR RI-GHT 
 parameter SHIFT_AMOUNT = 1; //possible values 1:7
 input clk,rst,load;
 input [7:0] load_value;
 output reg [7:0] po;
 always @(posedge clk or posedge rst) begin
 	if (rst) 
 		po<=0;
    else if (load) 
  	    po<=load_value;
    else begin
        if(SHIFT_DIRECTION=="RIGHT") 
        	po<=po>>SHIFT_AMOUNT;//another way po<={SHIFT_AMOUNT{1'b0},po[7:SHIFT_AMOUNT]}
        else 
            po<=po<<SHIFT_AMOUNT;//another way po<={po[7-SHIFT_AMOUNT:0],SHIFT_AMOUNT{1'b0}}
    end
 end
endmodule