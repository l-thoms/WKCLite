/*
generate_memory i2s_osd_buffer -mem_type BRAM9K -data_widths { {2} {2}} -address_depths { {400} {400}} -port_dirs { {input} {output}} -clk_mode read_write -write_modes { {normal} {normal}} -output_regs { {no} {yes}} -byte_enables { {no} {no}} -init_port a -input_clkens { {yes} {yes}} -input_rstens { {no} {yes}} -output_clkens { {yes} {yes}} -output_rstens { {yes} {yes}}
Dimension: ((1,1) - (1,1))
*/
`timescale 1ns/1ps
module i2s_osd_buffer(
   input Clk0,
   input Clk1,
   input ClkEn0,
   input ClkEn1,
   input AsyncReset0,
   input AsyncReset1,
   input WeA,
   input ReB,
   input [1:0] DataInA,
   input [8:0] AddressA,
   input [8:0] AddressB,
  output [1:0] DataOutB
);

wire [1:0] output_muxB_Dout;
wire [1:0] i2s_osd_buffer_0_DataOutB;

i2s_osd_bufferA_Decoder0to1 write_decoderA(
  .Enable(WeA),
  .Din(),
  .Dout(write_decoderA_Dout)
);

i2s_osd_bufferB_Decoder0to1 write_decoderB(
  .Enable(1'b1),
  .Din(),
  .Dout(write_decoderB_Dout)
);

i2s_osd_bufferB_Mux2to2 output_muxB(
  .Select(),
  .Din(i2s_osd_buffer_0_DataOutB[1:0]),
  .Dout(output_muxB_Dout)
);

i2s_osd_bufferB_Register0 registersB0(
  .Clk(Clk1),
  .ClkEn(read_andB_Dout),
  .AsyncReset(AsyncReset1),
  .Din(),
  .Qout()
);

i2s_osd_bufferB_Register0 registersB1(
  .Clk(Clk1),
  .ClkEn(ClkEn1),
  .AsyncReset(AsyncReset1),
  .Din(),
  .Qout()
);

i2s_osd_bufferreadAndBand2 read_andB(
  .Din({ ClkEn1, ReB }),
  .Dout(read_andB_Dout)
);

/*
Instance: X0, Y0
*/
alta_ram9k i2s_osd_buffer_0(
  .Clk0(Clk0),
  .Clk1(Clk1),
  .ClkEn0(ClkEn0),
  .ClkEn1(ClkEn1),
  .AsyncReset0(AsyncReset0),
  .AsyncReset1(AsyncReset1),
  .AddressA({ 1'b0, 1'b0, 1'b0, AddressA[8:0] }),
  .DataInA(DataInA[1:0]),
  .ByteEnA(),
  .AddressB({ 1'b0, 1'b0, 1'b0, AddressB[8:0] }),
  .DataInB(~2'b0),
  .ByteEnB(),
  .WeA(write_decoderA_Dout),
  .ReA(1'd0),
  .WeB(1'd0),
  .ReB(ReB),
  .AddressStallA(1'd0),
  .AddressStallB(1'd0),
  .DataOutA(),
  .DataOutB(i2s_osd_buffer_0_DataOutB)
);
defparam i2s_osd_buffer_0.CLKMODE = "read_write";
defparam i2s_osd_buffer_0.DATA_WIDTH_A = 2;
defparam i2s_osd_buffer_0.ADDR_WIDTH_A = 12;
defparam i2s_osd_buffer_0.BYTE_WIDTH_A = 0;
defparam i2s_osd_buffer_0.PORTA_WRITEMODE = "normal";
defparam i2s_osd_buffer_0.PORTA_OUTREG = "no";
defparam i2s_osd_buffer_0.PORTA_CLKIN_EN = "yes";
defparam i2s_osd_buffer_0.PORTA_RSTIN_EN = "no";
defparam i2s_osd_buffer_0.PORTA_CLKOUT_EN = "yes";
defparam i2s_osd_buffer_0.PORTA_RSTOUT_EN = "yes";
defparam i2s_osd_buffer_0.DATA_WIDTH_B = 2;
defparam i2s_osd_buffer_0.ADDR_WIDTH_B = 12;
defparam i2s_osd_buffer_0.BYTE_WIDTH_B = 0;
defparam i2s_osd_buffer_0.PORTB_WRITEMODE = "normal";
defparam i2s_osd_buffer_0.PORTB_OUTREG = "yes";
defparam i2s_osd_buffer_0.PORTB_CLKIN_EN = "yes";
defparam i2s_osd_buffer_0.PORTB_RSTIN_EN = "yes";
defparam i2s_osd_buffer_0.PORTB_CLKOUT_EN = "yes";
defparam i2s_osd_buffer_0.PORTB_RSTOUT_EN = "yes";
defparam i2s_osd_buffer_0.OPERATION_MODE = "dual_port";
defparam i2s_osd_buffer_0.INIT_PORT = "a";
defparam i2s_osd_buffer_0.INIT_VAL = 8192'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

assign DataOutB = output_muxB_Dout[1:0];

endmodule

`timescale 1ns/1ps
module i2s_osd_bufferA_Decoder0to1(
   input Enable,
   input Din,
  output Dout
);
assign Dout = Enable;
endmodule

`timescale 1ns/1ps
module i2s_osd_bufferB_Decoder0to1(
   input Enable,
   input Din,
  output Dout
);
assign Dout = Enable;
endmodule

`timescale 1ns/1ps
module i2s_osd_bufferB_Mux2to2(
   input [1:0] Din,
   input Select,
  output reg [1:0] Dout
);
always @ (*)
  Dout = Din;
endmodule

`timescale 1ns/1ps
module i2s_osd_bufferB_Register0(
   input Clk,
   input ClkEn,
   input AsyncReset,
   input Din,
  output reg Qout
);
endmodule

`timescale 1ns/1ps
module i2s_osd_bufferreadAndBand2(
   input [1:0] Din,
  output Dout
);
and (Dout, Din[0], Din[1]);
endmodule

