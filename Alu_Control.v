/*
Thhis ALU supports I- and R-Type Instructions
*/

module Alu_Control(
	opcode,
	func_field,
	alu_control
    );
	 
input [5:0] opcode;//6 bits
input [5:0] func_field;//6 bits
output reg [2:0] alu_control;//3 bits
reg [2:0] func_code;

always @ (*)
begin
	case (func_field)
	6'h20: func_code = 3'h0;//ADD
	6'h22: func_code = 3'h1;//SUB
	6'h24: func_code = 3'h2;//AND
	6'h25: func_code = 3'h3;//OR
	6'h27: func_code = 3'h4;//NOR
	6'h2A: func_code = 3'h5;//SLT
	default: func_code = 3'h0;//AND
	endcase

	case (opcode)
	6'h00: alu_control = func_code;//for above
	6'h04: alu_control = 3'h1;//LW
	6'h23: alu_control = 3'h0;//SW
	6'h2B: alu_control = 3'h0;//BEQ
	default: alu_control = 3'h0;//func_code
	endcase
end
endmodule