module Param_Shift_register(sclr,sset,shiftin,load,data,clock,enable,aclr,aset,shiftout,q);
 parameter SHIFT_WIDTH=8,LOAD_AVALUE =1,LOAD_SVALUE=1,SHIFT_DIRECTION="LEFT";
 input sclr,sset,shiftin,load,clock,enable,aclr,aset ;
 input [SHIFT_WIDTH-1:0] data;
 output shiftout;
 output  [SHIFT_WIDTH-1:0] q;
 reg temp_shiftout;
 reg [SHIFT_WIDTH-1:0] temp_q;
    always @(posedge clock or posedge aclr or posedge aset) begin
	   if(aclr)
            temp_q <= 0;
       else if (aset)
            temp_q <=LOAD_AVALUE;
        else if (enable) begin
	            if(sclr)
                    temp_q<=0;
                else if(sset)
                    temp_q<=LOAD_SVALUE;
                else if(load)
                    temp_q<=data;
                else begin
                    if(SHIFT_DIRECTION=="Right")
                            {temp_q,temp_shiftout}<={shiftin,temp_q};
                    else
                            {temp_shiftout,temp_q}<={temp_q,shiftin};	
                end
        end
    end
 assign q = temp_q ;
 assign shiftout = temp_shiftout ;
endmodule