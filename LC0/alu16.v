//
// ALU func:
// 00 = add
// 01 = sub
// 10 = AND
// 11 = OR
//
module alu16 (
	input [1:0] func,
	input [15:0] in1,
	input [15:0] in2,
	output [15:0] out
);

	assign	out = (func == 2'd0) ?	in1 + in2	: 16'dZ;
	assign	out = (func == 2'd1) ?	in1 - in2	: 16'dZ;
	assign	out = (func == 2'd2) ?	in1 & in2	: 16'dZ;
	assign	out = (func == 2'd3) ?	in1 | in2	: 16'dZ;

endmodule
