////////////////////////////////////////////////////////////////////////////////
// Filename:    counter6bit_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: 6-bit counter with enable and clear
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module counter6bit_cgrundey(clock, clear, enable, count);
	input        clock;
	input        clear;
	input        enable;
	output [5:0] count;
	reg    [5:0] count;

	parameter CLRDEL = 10;
	parameter CLKDEL = 15;
	parameter MAXVAL = 6'd63;
	always @(posedge clock or posedge clear) begin
		if(clear)
			count <= #CLRDEL 6'b0;
		else if(enable) begin
			if(count == MAXVAL)
				count <= #CLKDEL 6'b0;
			else
				count <= #CLKDEL count + 6'd1;
		end
	end

endmodule
