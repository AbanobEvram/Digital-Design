module Param_Shif_tb;
 parameter SHIFT_WIDTH=8,LOAD_AVALUE =1,LOAD_SVALUE=1,SHIFT_DIRECTION="LEFT";
 reg sclr,sset,shiftin,load,clock,enable,aclr,aset;
 reg [SHIFT_WIDTH-1:0] data;
 wire shiftout;
 wire [SHIFT_WIDTH-1:0] q;
 Param_Shift_register #(SHIFT_WIDTH,LOAD_AVALUE,LOAD_SVALUE,SHIFT_DIRECTION) dut(sclr,sset,shiftin,load,data,clock,enable,aclr,aset,shiftout,q);
    initial begin 
        clock=0;
        forever
        #1 clock=~clock;
    end
    initial begin
        sclr=0;sset=0;shiftin=0;load=1;data=8'b11001100;//load the nubmber to register 
        enable=1;aclr=0;aset=0; @(negedge clock);
        load=0; @(negedge clock);//shift left with shiftin=0
        shiftin =1; @(negedge clock);//shift left with shiftin=1
        aclr=1; @(negedge clock);// asynchronouns clear
        aclr=0;aset=1; @(negedge clock);// asynchronouns set
        aset=0;sclr=1;sset=1; @(negedge clock);// synchronous clear
        sclr=0; @(negedge clock);// anchronous set
        $stop;
    end
endmodule
