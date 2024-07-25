module LFSR(clk,rst,set,out);
 input clk,rst,set;
 output [3:0] out;
 reg q1,q2,q3,q4;
 
 always @(posedge clk or posedge set) begin
     if (set) 
        q1<=1;
     else
        q1<=q4;    
 end
 always @(posedge clk or posedge rst) begin
     if (rst) begin
        q2<=0;
        q3<=0;
        q4<=0; 
     end
     else begin
         q2<=q4^q1;
         q3<=q2;
         q4<=q3;
     end
 end

 assign out = {q4,q3,q2,q1} ;

 endmodule