////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_converters_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: Test bench for BCD <-> Binary convereters
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_converters_cgrundey();
	reg enable;
	reg ctr_enable;
	reg ctr_clear;
	reg conv_enable_n;
	wire clk_out;
	wire [5:0] counter_out, out184, out185;

	clk M1(enable, clk_out);
	counter6bit_cgrundey U1(clk_out, ctr_clear, ctr_enable, counter_out);
	sn184_cgrundey U2(conv_enable_n, counter_out, out184);
	sn185_cgrundey U3(conv_enable_n, counter_out, out185);

	initial begin
		enable = 1'b1; 			// enable clock
		conv_enable_n = 1'b1; 	// disable converters
		ctr_enable = 1'b0; 		// disable counter
		ctr_clear	 = 1'b0;
		#10 ctr_clear = 1'b1;  		// clear counter
		#40 ctr_clear = 1'b0;
		#50 ctr_enable = 1'b1; 		// enable counter
		#50 conv_enable_n = 1'b0; 	// enable converters

	end

endmodule
