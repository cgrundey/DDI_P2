////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_counter6bit_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: Test bench for 6-bit counter implementation
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_counter6bit_cgrundey();

	reg        clk_enable;
	reg        ctr_enable;
	reg        ctr_clr;
	wire       clk_out;
	wire [5:0] count1;
	wire [5:0] count2;

// Instantiate the clock generator with a period of 100 ns
	clk #(100) clk1(clk_enable, clk_out);

// Intantiate two versions of the counter. ctr1 uses the default values.
// ctr2 overrides the default values of the parameters with #(20,30) ns.
	counter6bit_cgrundey          ctr1(clk_out, ctr_clr, ctr_enable, count1);
	counter6bit_cgrundey #(20,30) ctr2(clk_out, ctr_clr, ctr_enable, count2);

// Sequence the ENABLE and CLR signals
	initial begin
		clk_enable = 1;
		ctr_enable = 0;
		ctr_clr = 0;
		#10  ctr_clr = 1;
		#40  ctr_clr = 0;
		#50  ctr_enable = 1;
		#500 ctr_enable = 0;
		#200 ctr_enable = 1;
		#500 ctr_clr = 1;
		#100 ctr_clr = 0;
   end

endmodule
