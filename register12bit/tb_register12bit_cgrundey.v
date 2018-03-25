////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_register12bit_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: Test bench for 12-bit register implementation
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_register12bit_cgrundey();
	reg [11:0] reg_in;
	reg enable;
	wire [11:0] reg_out;

	clk M1(enable, clk_out);
	register12bit_cgrundey M2(clk_out, reg_in, reg_out);

	initial begin
		enable = 1'b1;
		reg_in = 12'd160;
		#200 reg_in = 12'd250;
		#200 reg_in = 12'd54;
	end

endmodule
