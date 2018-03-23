////////////////////////////////////////////////////////////////////////////////
// Filename:    counter4bit.v
// Author:      T. Martin
// Date:        09/07/04
// Version:     4
// Description: This module is a behavioral description of a simple four-bit
//              counter with enable and asynchronous clear.
//
//              This module has three inputs:
//              - clock:  The system clock.
//              - clear:  An asynchronous active-high clear.
//              - enable: An active-high signal that allows count to advance.
//
//              This module has one output:
//              - count:  The 4-bit counter value.
//
//              This module has three parameters:
//              - CLRDEL: Delay from clear asserted to output valid.
//              - CLKDEL: Delay from clock rising esdge to output valid.
//              - MAXVAL: The counter's maximum value.
//                        Count should return to zero on the next clock edge.
//
//              This module is intended for modeling ONLY. It SHOULD NOT be used
//              as a template for a synthesizable counter module without further
//              guidance. 
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 09/07/2004  TLM  1        Original
// 08/24/2005  PMA  2        Restructured for Fall 2005
// 10/03/2013  TLM  3        Revised for DD 1, Fall 2013
// 09/28/2015  JST  4        Revised for greater synthesizability
// 03/13/2018  JST  5        Parameterized maximum value
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module counter4bit(clock, clear, enable, count);
	input        clock;		// System clock
	input        clear;		// Asynchronous active-high clear
	input        enable;		// Active-high counter enable.
	output [3:0] count;		// 4-bit counter output
	reg    [3:0] count;		// Variable count is defined procedurally.

   parameter CLRDEL = 10;		// Delay from clear to valid output.
   parameter CLKDEL = 15;		// Delay from clock to valid output.
   parameter MAXVAL = 4'd15;	// Counter max value

// Build behavioral 4-bit up-counter with asynchronous clear
	always @(posedge clock or posedge clear) begin
		if(clear)
			count <= #CLRDEL 4'b0;
		else if(enable) begin
			if(count == MAXVAL)
				count <= #CLKDEL 4'b0;
			else
				count <= #CLKDEL count + 4'd1;
		end
	end

endmodule
