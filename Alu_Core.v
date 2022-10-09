/*
Performs the desired operation from control signal.  
*/

module Alu_Core(
	A,
	B,
	alu_control,
	result,
	zero
    );

input [31:0] A;//32 bits
input [31:0] B;//32 bits
input [2:0] alu_control;//3 bits
output reg [31:0] result;
output wire zero;//computed output

assign zero = !(|result);

always @ (*)
begin
	case(alu_control)
	3'h0: result = A + B;//ADD
	3'h1: result = A - B;//SUB
	3'h2: result = A & B;//AND
	3'h3: result = A | B;//OR
	3'h4: result = ~(A | B);//NOR
	3'h5: result = (A < B);//LESS THAN
	default: result = A + B;//ADD
	endcase
end
endmodule