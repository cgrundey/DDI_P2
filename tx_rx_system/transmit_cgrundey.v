////////////////////////////////////////////////////////////////////////////////
// Filename:    transmit_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: Transmit block implementation
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

module transmit_cgrundey (clk, clear, ctr_en, conv_en_n, reg_out);
	input clk, clear, ctr_en, conv_en_n;
	output [11:0] reg_out;
	wire [5:0] counter_out, conv_out;
	reg [5:0] reg_buf;

	counter6bit_cgrundey U1(clk, clear, ctr_en, counter_out);
	sn185_cgrundey U2(conv_en_n, counter_out, conv_out);
	register12bit_cgrundey U3(clk, {reg_buf, conv_out}, reg_out);

	always @ ( * ) begin
		reg_buf <= counter_out;
	end

endmodule
