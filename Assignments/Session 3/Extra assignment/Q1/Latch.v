module latch(aset,data,gate,aclr,q);
 parameter LAT_WIDTH=6;
 input aset,gate,aclr;
 input [LAT_WIDTH-1:0] data;
 output reg [LAT_WIDTH-1:0] q;
   always @(*) begin
      if(aclr)
       q<=0;
    else if (aset)
       q<={LAT_WIDTH{1'b1}};
    else if (gate) 
       q<=data;
   end
endmodule