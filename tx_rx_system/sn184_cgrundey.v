////////////////////////////////////////////////////////////////////////////////
// Filename:    sn184_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: 6-bit BCD to Binary converter
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

module sn184_cgrundey(g_n, bcd_in, bin_out);
	input g_n;
	input [5:0] bcd_in;
	output [5:0] bin_out;
	reg [5:0] bin_out;
	reg [5:0] scratch;
	reg [5:0] tempout;

	// Used max propagation delays from datasheet to test with critical path
	specify
		(g_n *> bin_out) = (30, 35);
		(bcd_in => bin_out) = (40, 40);
	endspecify

	always@(g_n or bcd_in) begin
		if (g_n) begin
			bin_out = 6'b111111;
		end
		else if (bcd_in[3:0] > 4'b1001) begin
			bin_out = 6'b111111;
		end
		else begin
			scratch = bcd_in;
			tempout = 6'b000000;
			repeat(6) begin
				tempout = {scratch[0], tempout[5:1]};
				scratch = scratch >> 1;
				if (scratch[3:0] > 7) begin
					scratch = scratch - 3;
				end
			end
			bin_out = tempout;
		end
	end


endmodule
