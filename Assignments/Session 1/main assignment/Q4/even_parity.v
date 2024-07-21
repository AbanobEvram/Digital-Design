module evenparity(A,Out_with_parity);
input [7:0]A ;
output [8:0] Out_with_parity;
wire parity_bit;
assign parity_bit = ^A;
assign Out_with_parity ={A,parity_bit} ;
endmodule