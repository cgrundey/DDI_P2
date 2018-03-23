////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_clk.v
// Author:      T. Martin
// Date:        10/3/2013
// Version:     3
// Description: This module provides a testbench for the clk.v circuit. This
//              module serves a a simple testbench for the CLK module.  Two CLKs
//              are instantiated, and are stimulated with a simple sequence.
//
//              There are no inputs or outputs to this module.
//
// Modification History:
// Date        By   Version  Change Description
// =============================================
// 09/07/2004  TLM  1        Original
// 08/24/2005  PMA  2        Restructured for Fall 2005
// 10/03/2013  TLM  3        Revised for Fall 2013 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_clk();
	reg  enable1;	// Clock enable for CLK circuit M1
	reg  enable2;	// Clock enable for CLK circuit M2
	wire clk_out1;	// Clock output for M1
	wire clk_out2;	// Clock output for M2

// Instantiate two versions of the clk module. The first will use the default
// period of 50 ns. The second will have a period of 100 ns.
	clk        M1(enable1, clk_out1);
	clk #(100) M2(enable2, clk_out2);

// Sequence the ENABLE signals
	initial begin
		enable1 = 0;
		enable2 = 0;
		#100 enable1 = 1;
		#100 enable2 = 1;
		#600 enable1 = 0;
		#100 enable2 = 0;
		#100 enable1 = 1;
		#100 enable2 = 1;
	end

endmodule 
