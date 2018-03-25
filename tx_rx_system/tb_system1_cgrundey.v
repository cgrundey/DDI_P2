////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_system1_cgrundey.v
// Author:      Colin Grundey
// Date:        19 March 2018
// Version:     1
// Description: Test bench for system 1
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_system1_cgrundey();

  reg clk_en, ctr_clr, ctr_en, conv_en_n;
  wire valid, clk_out;
  wire [11:0] reg_out;

  clk #(100) C1(clk_en, clk_out);
  transmit_cgrundey U1(clk_out, ctr_clr, ctr_en, conv_en_n, reg_out);
  receive_cgrundey U2(clk_out, conv_en_n, reg_out, valid);

	initial begin
    clk_en = 1'b1; 			// enable clock
    conv_en_n = 1'b1; 	// disable converters
    ctr_en = 1'b0; 		// disable counter
    ctr_clr	 = 1'b0;
    #10 ctr_clr = 1'b1;  		// clear counter
    #40 ctr_clr = 1'b0;
    #50 ctr_en = 1'b1; 		// enable counter
    #50 conv_en_n = 1'b0; 	// enable converters
	end

endmodule
