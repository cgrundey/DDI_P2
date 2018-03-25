////////////////////////////////////////////////////////////////////////////////
// Filename:    register12bit_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: 12-bit register implementation
////////////////////////////////////////////////////////////////////////////////

module register12bit_cgrundey(clk, d_in, q_out);
	input clk;
	input  [11:0] d_in;
	output [11:0] q_out;
	reg    [11:0] q_out;

	always @(posedge clk) begin
		q_out <= d_in;
	end

endmodule
