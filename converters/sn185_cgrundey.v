////////////////////////////////////////////////////////////////////////////////
// Filename:    sn185_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: 6-bit Binary to BCD converter
////////////////////////////////////////////////////////////////////////////////

module sn185_cgrundey(g_n, bin_in, bcd_out);
	input g_n;
	input [5:0] bin_in;
	output [5:0] bcd_out;
	reg [5:0] bcd_out;
	reg [5:0] scratch;
	reg [5:0] tempout;

	always @(g_n or bin_in) begin
		if(g_n) begin
			bcd_out = 6'b111111;
		end
		else begin
			scratch = bin_in;
			tempout = 6'b000000;
			repeat(5) begin
				tempout = {tempout[4:0], scratch[5]};
				scratch = scratch << 1;
				if (scratch > 4) begin
					scratch = scratch + 3;
				end
			end
		end
	end

endmodule