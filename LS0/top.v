// test-harness module

module top(
	input clk
);

	reg				reset;
	wire	[31:0]	ctr_out;
	integer			cycle;

	//
	// instantiate the device under test
	//
	counter32 ctr(
		.clk	(clk),
		.reset	(reset),
		.out	(ctr_out));
	
	initial begin
		reset = 1;
		cycle = 0;
	end

	always @(posedge clk) begin
		cycle = cycle + 1;
		reset <= (cycle > 0) ? 0 : 1;

		$display("cycle %04d - res %d ctr %0d", cycle, reset, ctr_out);

		if (cycle > 100) $finish;
	end

endmodule
