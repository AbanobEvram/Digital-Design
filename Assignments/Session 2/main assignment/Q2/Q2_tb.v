module Priority_encoder_tb();
reg [3:0] X_tb;
reg [1:0] Y_excpected;
wire [1:0] Y_dut;
Priority_encoder dut(X_tb,Y_dut);
integer i;
initial begin
	for(i=0;i<99;i=i+1)begin
X_tb=$random;	
casex(X_tb)
'b1xxx:Y_excpected=3;
'b01xx:Y_excpected=2;
'b001x:Y_excpected=1;
'b000x:Y_excpected=0;
endcase
#10
if(Y_excpected!=Y_dut)begin
$display("Error....");	
$stop;	
end
	end
$stop;
end
initial begin
$monitor ("Y_excpected=%d , Y_dut=%d",Y_excpected,Y_dut);
end
endmodule