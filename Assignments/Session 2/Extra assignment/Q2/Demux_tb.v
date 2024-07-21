module Demux_tb();
reg D_tb;
reg [1:0] S_tb;
reg [3:0] Y_excpected;
wire [3:0] Y_dut;
Demux dut(D_tb,S_tb,Y_dut);
integer i,j;
initial begin 
    for(i=0;i<2;i=i+1) begin
D_tb=i;	
    for(j=0;j<4;j=j+1)begin
S_tb=j;
case(S_tb)    	
0:Y_excpected={3'b000,D_tb};
1:Y_excpected={2'b00,D_tb,1'b0};
2:Y_excpected={1'b0,D_tb,2'b00};
3:Y_excpected={D_tb,3'b000};
endcase
#10
if(Y_excpected!=Y_dut)begin
$display("Errror");
$stop;
end
    end
    end 
$stop;
end
initial begin
$monitor("D_tb=%d , Y_excpected=%b",D_tb,Y_excpected);	
end
endmodule