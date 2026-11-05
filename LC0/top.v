// test-harness module

module top(
	input clk
);

	reg		[15:0]	in1;
	reg		[15:0]	in2;
	reg		[1:0]	op;
	wire	[15:0]	alu_out;
	integer			cycle;

	//
	// instantiate the device under test
	//
	alu16 alu(
		.func	(op),
		.in1	(in1),
		.in2	(in2),
		.out	(alu_out));
	
	initial begin
		cycle = 0;
		in1 = 16'd235;
		in2 = 16'd9457;
		op = 0;
	end

	always @(posedge clk) begin
		cycle = cycle + 1;

		op <= op + 1;
		in1 <= (op == 2'd3) ? in1 + 4747 : in1;
		in2 <= (op == 2'd3) ? in2 + 47598 : in2;

		$display("op %d (%s) in1 %x (%d) in2 %x (%d) out %x (%d) [verify %x (%d)]", op,
			(op == 0) ? "+" : (op == 1) ? "-" : (op == 2) ? "&" : "|",
			in1, in1, in2, in2, alu_out, alu_out,
			(op == 0) ? in1+in2 : (op == 1) ? in1-in2 : (op == 2) ? in1&in2 : in1|in2,
			(op == 0) ? in1+in2 : (op == 1) ? in1-in2 : (op == 2) ? in1&in2 : in1|in2);

		if (cycle > 100) $finish;
	end

endmodule
