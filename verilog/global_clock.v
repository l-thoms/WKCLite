/*
generate_pll global_clock -pll_type PLLVE -input_freq 8 -output_freqs { {36}} -fb_mode EXT_FEEDBACK -output_phases { {0}} -output_duties { {50}}
*/
`timescale 1ns/1ps
module global_clock(
   input clkin,
   input clkfb,
   input pfden,
   input resetn,
   input [2:0] phasecounterselect,
   input phaseupdown,
   input phasestep,
   input scanclk,
   input scanclkena,
   input scandata,
   input configupdate,
  output clkout0,
  output clkout1,
  output clkout2,
  output clkout3,
  output clkout4,
  output clkfbout,
  output lock,
  output scandataout,
  output scandone,
  output phasedone
);


alta_pllve global_clock(
  .clkin(clkin),
  .clkfb(clkfb),
  .pfden(pfden),
  .resetn(resetn),
  .phasecounterselect(phasecounterselect[2:0]),
  .phaseupdown(phaseupdown),
  .phasestep(phasestep),
  .scanclk(scanclk),
  .scanclkena(scanclkena),
  .scandata(scandata),
  .configupdate(configupdate),
  .clkout0(global_clock_clkout0),
  .clkout1(global_clock_clkout1),
  .clkout2(global_clock_clkout2),
  .clkout3(global_clock_clkout3),
  .clkout4(global_clock_clkout4),
  .clkfbout(global_clock_clkfbout),
  .lock(global_clock_lock),
  .scandataout(global_clock_scandataout),
  .scandone(global_clock_scandone),
  .phasedone(global_clock_phasedone)
);
defparam global_clock.CLKIN_BYPASS = 1'h1;
defparam global_clock.CLKIN_TRIM = 1'h0;
defparam global_clock.CLKIN_HIGH = 8'hFF;
defparam global_clock.CLKIN_LOW = 8'hFF;
defparam global_clock.CLKFB_BYPASS = 1'h0;
defparam global_clock.CLKFB_HIGH = 8'h39;
defparam global_clock.CLKFB_LOW = 8'h3A;
defparam global_clock.VCO_POST_DIV = 1'h0;
defparam global_clock.CLKDIV0_EN = 1'h1;
defparam global_clock.CLKOUT0_HIGH = 8'h0C;
defparam global_clock.CLKOUT0_LOW = 8'h0C;
defparam global_clock.CLKOUT0_BYPASS = 1'h0;
defparam global_clock.CLKOUT0_TRIM = 1'h0;
defparam global_clock.CLKOUT0_DEL = 8'h00;
defparam global_clock.CLKOUT0_PHASE = 3'h0;
defparam global_clock.CLKDIV1_EN = 1'h0;
defparam global_clock.CLKOUT1_HIGH = 8'hFF;
defparam global_clock.CLKOUT1_LOW = 8'hFF;
defparam global_clock.CLKOUT1_BYPASS = 1'h0;
defparam global_clock.CLKOUT1_TRIM = 1'h0;
defparam global_clock.CLKOUT1_DEL = 8'h00;
defparam global_clock.CLKOUT1_PHASE = 3'h0;
defparam global_clock.CLKOUT1_CASCADE = 1'h0;
defparam global_clock.CLKDIV2_EN = 1'h0;
defparam global_clock.CLKOUT2_HIGH = 8'hFF;
defparam global_clock.CLKOUT2_LOW = 8'hFF;
defparam global_clock.CLKOUT2_BYPASS = 1'h0;
defparam global_clock.CLKOUT2_TRIM = 1'h0;
defparam global_clock.CLKOUT2_DEL = 8'h00;
defparam global_clock.CLKOUT2_PHASE = 3'h0;
defparam global_clock.CLKOUT2_CASCADE = 1'h0;
defparam global_clock.CLKDIV3_EN = 1'h0;
defparam global_clock.CLKOUT3_HIGH = 8'hFF;
defparam global_clock.CLKOUT3_LOW = 8'hFF;
defparam global_clock.CLKOUT3_BYPASS = 1'h0;
defparam global_clock.CLKOUT3_TRIM = 1'h0;
defparam global_clock.CLKOUT3_DEL = 8'h00;
defparam global_clock.CLKOUT3_PHASE = 3'h0;
defparam global_clock.CLKOUT3_CASCADE = 1'h0;
defparam global_clock.CLKDIV4_EN = 1'h0;
defparam global_clock.CLKOUT4_HIGH = 8'hFF;
defparam global_clock.CLKOUT4_LOW = 8'hFF;
defparam global_clock.CLKOUT4_BYPASS = 1'h0;
defparam global_clock.CLKOUT4_TRIM = 1'h0;
defparam global_clock.CLKOUT4_DEL = 8'h00;
defparam global_clock.CLKOUT4_PHASE = 3'h0;
defparam global_clock.CLKOUT4_CASCADE = 1'h0;
defparam global_clock.CLKFB_TRIM = 1'h0;
defparam global_clock.CLKFB_DEL = 8'h00;
defparam global_clock.CLKFB_PHASE = 3'h0;
defparam global_clock.FEEDBACK_MODE = 3'h4;
defparam global_clock.FBDELAY_VAL = 3'h4;
defparam global_clock.PLLOUTP_EN = 1'h0;
defparam global_clock.PLLOUTN_EN = 1'h0;

assign clkout0 = global_clock_clkout0;
assign clkout1 = global_clock_clkout1;
assign clkout2 = global_clock_clkout2;
assign clkout3 = global_clock_clkout3;
assign clkout4 = global_clock_clkout4;
assign clkfbout = global_clock_clkfbout;
assign lock = global_clock_lock;
assign scandataout = global_clock_scandataout;
assign scandone = global_clock_scandone;
assign phasedone = global_clock_phasedone;

endmodule

