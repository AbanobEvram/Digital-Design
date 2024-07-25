module ALSU(A,B,opcode,cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B,clk,rst,out,leds);
 parameter INPUT_PRIORITY="A";//A OR B
 parameter FULL_ADDER="ON";//ON OR OFF
 input cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B,clk,rst;
 input [2:0] A,B,opcode;
 output reg [5:0] out ;
 output reg [15:0] leds;
 reg [2:0] Q_A,Q_B,Q_opcode; 
 reg Q_cin,Q_serial_in,Q_direction,Q_red_op_A,Q_red_op_B,Q_bypass_A,Q_bypass_B;
 
    always @(posedge clk or posedge rst) begin
    	if (rst) begin
    		Q_A<=0;
    		Q_B<=0;
    		Q_opcode<=0;
    		Q_cin<=0;
    		Q_serial_in<=0;
    		Q_direction<=0;
    		Q_red_op_A<=0;
    		Q_red_op_B<=0;
    		Q_bypass_A<=0;
    		Q_bypass_B<=0;
    	end
    	else begin
    		Q_A<=A;
    		Q_B<=B;
    		Q_opcode<=opcode;
    		Q_cin<=cin;
    		Q_serial_in<=serial_in;
    		Q_direction<=direction;
    		Q_red_op_A<=red_op_A;
    		Q_red_op_B<=red_op_B;
    		Q_bypass_A<=bypass_A;
    		Q_bypass_B<=bypass_B;    		
    	end
    end

    always @(posedge clk or posedge rst) begin
        if(rst) 
        	out<=0;
   
        else begin
            if(Q_bypass_A&&Q_bypass_B) begin
            	if(INPUT_PRIORITY=="B")
            	    out<=Q_B;
            	else //default : INPUT_PRIORITY = A
            	    out<=Q_A;    
            end
            else if(Q_bypass_A)
                out<=Q_A;
            else if(Q_bypass_B)
                out<=Q_B;
          
            else begin
            	case(Q_opcode)
                    0: begin //Operation: AND
                        if (Q_red_op_A&&Q_red_op_B) begin
                            if (INPUT_PRIORITY=="B") 
                                out<=&Q_B;
                            else         	
                                out<=&Q_A;       
                        end      
                        else if (Q_red_op_A)
                                out<=&Q_A;
                        else if (Q_red_op_B)
                                out<=&Q_B;
                        else 
                                out<=Q_A&Q_B;
                    end
                    1: begin //Operation: XOR
                        if (Q_red_op_A&&Q_red_op_B) begin
                            if (INPUT_PRIORITY=="B") 
                                out<=^Q_B;
                            else         	
                                out<=^Q_A;       
                        end      
                        else if (Q_red_op_A)
                                out<=^Q_A;
                        else if (Q_red_op_B)
                            out<=^Q_B;
                        else 
                            out<=Q_A^Q_B;
                    end
                    2: begin //Operation: Addition
                        if(Q_red_op_A||Q_red_op_B) 
                            out<=0;       
                        else if (FULL_ADDER=="OFF")	
                            out<=Q_A+Q_B;
                        else //default : FULL_ADDER= ON
                        	out<=Q_A+Q_B+Q_cin;                    
                    end
                    3: begin //Operation: Multiplication
                        if(Q_red_op_A||Q_red_op_B)
                            out<=0;    
                        else
                            out<=Q_A*Q_B;
                    end
                    4: begin //Operation: Shift output by 1 bit
                        if(Q_red_op_A||Q_red_op_B) 
                            out<=0;    
                        else begin
                            if (Q_direction) // if direction ==1 then shift left                    
                                out<={out[4:0],Q_serial_in};
                            else //shift right  
                                out<={Q_serial_in,out[5:1]};
                        end
                    end
                    5: begin //Operation: Rotate output by 1 bit
                        if(Q_red_op_A||Q_red_op_B) 
                            out<=0;    
                        else begin
                            if (Q_direction) // if direction ==1 then Rotate left                    
                                out<={out[4:0],out[5]};
                            else //Rotate right  
                                out<={out[0],out[5:1]};
                        end
                    end
                    default : out<=0;    
                endcase    
            end
        end
    end
    always @(posedge clk or posedge rst) begin
    	if (rst) 
    		leds<=0;
    	else if (Q_opcode==0||Q_opcode==1) 
    		leds<=0;
    	else if (Q_opcode==2||Q_opcode==3||Q_opcode==4||Q_opcode==5) begin
    	    if(Q_red_op_A||Q_red_op_B) begin
                leds<=~leds;
            end
            else
                leds<=0;
    	end
    	else begin
            leds<=~leds;		
    	end		
    end
endmodule