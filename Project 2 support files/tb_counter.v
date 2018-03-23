////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_counter.v
// Author:      T. Martin
// Date:        10/3/2013
// Version:     4
// Description: This module serves as a simple testbench for the counter module.
//              Two counters are instantiated and stimulated with a simple
//              sequence.
//
//              There are no inputs or outputs to this module.
//
// Modification History:
// Date        By   Version  Change Description
// ============================================
// 09/07/2004  TLM  1        Original
// 08/24/2005  PMA  2        Restructured for Fall 2005
// 10/03/2013  TLM  3        Revised for DD 1, Fall 2013
// 09/28/2015  JST  4        Revised to conform with counter revision
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_counter();

// Declare local wires and regs
   reg        clk_enable;	// Locally-created clock enable signal
   reg        ctr_enable;	// Locally-created counter enable signal
   reg        ctr_clr;		// Locally-created counter clear signal
   wire       clk_out;		// Clock produced by the clk module
   wire [3:0] count1;		// Output for counter having default timing
	wire [3:0] count2;		// Output for counter having defined timing

// Instantiate the clock generator with a period of 100 ns
	clk #(100) clk1(clk_enable, clk_out);

// Intantiate two versions of the counter. ctr1 uses the default values.
// ctr2 overrides the default values of the parameters with #(20,30) ns.
	counter4bit          ctr1(clk_out, ctr_clr, ctr_enable, count1);
	counter4bit #(20,30) ctr2(clk_out, ctr_clr, ctr_enable, count2);

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
