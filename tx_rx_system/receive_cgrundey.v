////////////////////////////////////////////////////////////////////////////////
// Filename:    receive_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: Receive block implementation
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

module receive_cgrundey (clk, conv_en_n, reg_in, valid);
	input clk, conv_en_n;
	input [11:0] reg_in;
	output valid;
	reg valid;
	wire [11:0] reg_out;
	wire [5:0] conv_out;

	register12bit_cgrundey U1(clk, reg_in, reg_out);
	sn184_cgrundey U2(conv_en_n, reg_out[5:0], conv_out);

	always@( posedge clk ) begin
		valid = (conv_out == reg_out[11:6]);
	end


endmodule
