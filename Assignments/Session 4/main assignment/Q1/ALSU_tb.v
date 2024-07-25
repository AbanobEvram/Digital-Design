module ALSU_tb();
 parameter INPUT_PRIORITY_TB="A";//A OR B
 parameter FULL_ADDER_TB="ON";//ON OR OFF
 reg cin_tb,serial_in_tb,direction_tb,red_op_A_tb,red_op_B_tb,bypass_A_tb,bypass_B_tb,clk_tb,rst_tb;
 reg [2:0] A_tb,B_tb,opcode_tb;
 wire [5:0] out_dut;
 wire [15:0] leds_dut;
 
 ALSU #(INPUT_PRIORITY_TB,FULL_ADDER_TB) dut(A_tb,B_tb,opcode_tb,cin_tb,serial_in_tb,direction_tb,red_op_A_tb,red_op_B_tb,bypass_A_tb,bypass_B_tb,clk_tb,rst_tb,out_dut,leds_dut);
 integer i;
    initial begin
    	clk_tb=0;
    	forever
    	    #1 clk_tb=~clk_tb;
    end
    initial begin
        rst_tb=1;cin_tb=0;serial_in_tb=0;direction_tb=0;red_op_A_tb=0;red_op_B_tb=0;bypass_A_tb=0;bypass_B_tb=0; // test if rst = 1
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	opcode_tb=$random;
        	@(negedge clk_tb);
        end
        rst_tb=0;bypass_A_tb=1;bypass_B_tb=1; //test if bypass A&B =1
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	opcode_tb=$random;
        	@(negedge clk_tb);
        end
        bypass_B_tb=0; //test if bypass A=1
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	opcode_tb=$random;
        	@(negedge clk_tb);
        end
        bypass_B_tb=1;bypass_A_tb=0; //test if bypass B=1
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	opcode_tb=$random;
        	@(negedge clk_tb);
        end

        bypass_B_tb=0;red_op_A_tb=1;red_op_B_tb=1;opcode_tb=0; //test AND if red_op_A&B=1 :(INPUT_PRIORITY=A)
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end        
        red_op_A_tb=0;//test AND if red_op_B=1
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end            
        red_op_B_tb=0;//test AND if red_op_B=0&red_op_B=0
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end

        red_op_A_tb=1;red_op_B_tb=1;opcode_tb=1; //test XOR if red_op_A&B=1 :(INPUT_PRIORITY=A)
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end        
        red_op_A_tb=0;//test XOR if red_op_B=1
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end            
        red_op_B_tb=0;//test XOR if red_op_B=0&red_op_B=0
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end
        
        opcode_tb=2; //test addition
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	cin_tb=$random;
        	@(negedge clk_tb);
        end

        opcode_tb=3; //test multiplication
        for(i=0;i<30;i=i+1) begin
        	A_tb=$random;
        	B_tb=$random;
        	@(negedge clk_tb);
        end

        opcode_tb=4;direction_tb=1;//test shift left 
        for(i=0;i<30;i=i+1) begin
            serial_in_tb=$random;
        	@(negedge clk_tb);
        end
        direction_tb=0; //test shift right
        for(i=0;i<30;i=i+1) begin
            serial_in_tb=$random;
        	@(negedge clk_tb);
        end

        opcode_tb=5;//test rotate right  
        for(i=0;i<30;i=i+1) begin
            serial_in_tb=$random;
        	@(negedge clk_tb);
        end
        direction_tb=1;//test rotate left
        for(i=0;i<30;i=i+1) begin
            serial_in_tb=$random;
        	@(negedge clk_tb);
        end
        red_op_A_tb=1;red_op_B_tb=1;// test some invalid cases
        for(i=0;i<100;i=i+1) begin
            A_tb=$random;
            B_tb=$random;
            opcode_tb=$urandom_range(2,7);
        	@(negedge clk_tb);
        end        
    $stop;
    end 
endmodule