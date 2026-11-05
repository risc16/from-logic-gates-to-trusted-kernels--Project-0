
module counter32 (
	input clk,
	input reset,
	output [31:0] out
);

	reg		[31:0]	counter;
	wire	[31:0]	adder = counter + 1;

	assign out = counter;

	always @ (posedge clk) begin
		counter <= (reset) ? 32'd0 : adder;
	end

endmodule
