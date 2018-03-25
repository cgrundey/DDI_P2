////////////////////////////////////////////////////////////////////////////////
// Filename:    sn185_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: 6-bit Binary to BCD converter
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

module sn185_cgrundey(g_n, bin_in, bcd_out);
	input g_n;
	input [5:0] bin_in;
	output [5:0] bcd_out;
	reg [5:0] bcd_out;
	reg [5:0] scratch;
	reg [5:0] tempout;

	// Used max propagation delays from datasheet to test with critical path
	specify
		(g_n *> bcd_out) = (30, 35);
		(bin_in => bcd_out) = (40, 40);
	endspecify

	always @(g_n or bin_in) begin
		if(g_n) begin
			bcd_out = 6'b111111;
		end
		if (bin_in > 6'd39) begin
			bcd_out = 6'b111111;
		end
		else begin
			scratch = bin_in;
			tempout = 6'b000000;
			repeat(6) begin
				if (tempout[5:4] >= 5) begin
					tempout[5:4] = tempout[5:4] + 3;
				end
				if (tempout[3:0] >= 5) begin
					tempout[3:0] = tempout[3:0] + 3;
				end
				tempout = tempout << 1;
				tempout[0] = scratch[5];
				scratch = scratch << 1;
			end
			bcd_out = tempout;
		end
	end

endmodule
