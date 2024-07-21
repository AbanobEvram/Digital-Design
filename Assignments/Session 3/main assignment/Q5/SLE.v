module SLE(D,CLK,EN,ALn,ADn,SLn,SD,LAT,Q);
 input D,CLK,EN,ALn,ADn,SLn,SD,LAT;
 output  Q;
 reg Q_ff,Q_latch;
    always @(posedge CLK or negedge ALn ) begin 
        if (~ALn)
            Q_ff<=~ADn;
        else if(EN&&~(LAT)) begin
            if (~SLn)
                Q_ff<=SD;
            else if(SLn)
                Q_ff<=D;
        end
    end
    always @(*) begin
        if(~ALn)
            Q_latch<=~ADn;
        if(LAT&&CLK&&EN) begin
            if (~SLn)
                Q_latch<=SD;
            else if(SLn)
                Q_latch<=D;       
        end       
    end
 assign Q = (LAT)?Q_latch:Q_ff;
endmodule