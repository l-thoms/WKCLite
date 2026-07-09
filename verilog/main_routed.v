`timescale 1 ps/ 1 ps

module main(
	CLKOSC,
	BPO1,
	CO1,
	BPO2,
	CO2,
	BCLK1,
	I2S1,
	BCLK2,
	I2S2,
	Q11,
	Q12,
	Q21,
	Q22,
	SCL,
	SDA,
	STDBY,
	CHRG,
	PWDN,
	DISP,
	LOCKA,
	LOCKB,
	BRIP,
	BRIN,
	CSEL1,
	CSEL2);
input	CLKOSC;
input	BPO1;
input	CO1;
input	BPO2;
input	CO2;
input	BCLK1;
input	I2S1;
input	BCLK2;
input	I2S2;
output	Q11;
output	Q12;
output	Q21;
output	Q22;
input	SCL;
inout	SDA;
input	STDBY;
input	CHRG;
output	PWDN;
input	DISP;
output	LOCKA;
output	LOCKB;
output	BRIP;
output	BRIN;
output	CSEL1;
output	CSEL2;

//wire	gnd;
//wire	vcc;
//wire	unknown;
wire	AsyncReset_X10001_Y10001_GND;
wire	AsyncReset_X10001_Y10002_GND;
wire	AsyncReset_X10001_Y10003_GND;
wire	AsyncReset_X10002_Y10001_GND;
wire	AsyncReset_X10002_Y10002_GND;
wire	AsyncReset_X10002_Y10003_GND;
wire	AsyncReset_X10003_Y10002_GND;
wire	AsyncReset_X10003_Y10003_GND;
wire	AsyncReset_X10004_Y10001_GND;
wire	AsyncReset_X10004_Y10002_GND;
wire	AsyncReset_X10004_Y10003_GND;
wire	AsyncReset_X10005_Y10001_GND;
wire	AsyncReset_X10005_Y10002_GND;
wire	AsyncReset_X10005_Y10003_GND;
wire	AsyncReset_X10006_Y10001_GND;
wire	AsyncReset_X10006_Y10002_GND;
wire	AsyncReset_X10006_Y10003_GND;
wire	AsyncReset_X10007_Y10001_GND;
wire	AsyncReset_X10007_Y10002_GND;
wire	AsyncReset_X10007_Y10003_GND;
wire	AsyncReset_X10008_Y10001_GND;
wire	AsyncReset_X10008_Y10002_GND;
wire	AsyncReset_X10008_Y10003_GND;
wire	AsyncReset_X10009_Y10001_GND;
wire	AsyncReset_X10009_Y10002_GND;
wire	AsyncReset_X10009_Y10003_GND;
wire	AsyncReset_X10010_Y10001_GND;
wire	AsyncReset_X10010_Y10002_GND;
wire	AsyncReset_X10010_Y10003_GND;
wire	AsyncReset_X10011_Y10002_GND;
wire	AsyncReset_X10011_Y10003_GND;
wire	AsyncReset_X10012_Y10001_GND;
wire	AsyncReset_X10012_Y10002_GND;
wire	AsyncReset_X10012_Y10003_GND;
wire	AsyncReset_X10014_Y10001_GND;
wire	AsyncReset_X10014_Y10002_GND;
wire	AsyncReset_X10014_Y10003_GND;
wire	AsyncReset_X10015_Y10001_GND;
wire	AsyncReset_X10015_Y10002_GND;
wire	AsyncReset_X10015_Y10003_GND;
wire	AsyncReset_X10016_Y10001_GND;
wire	AsyncReset_X10016_Y10002_GND;
wire	AsyncReset_X10016_Y10003_GND;
wire	AsyncReset_X10017_Y10001_GND;
wire	AsyncReset_X10017_Y10002_GND;
wire	AsyncReset_X10017_Y10003_GND;
wire	AsyncReset_X10018_Y10001_GND;
wire	AsyncReset_X10018_Y10002_GND;
wire	AsyncReset_X10018_Y10003_GND;
wire	AsyncReset_X10019_Y10001_GND;
wire	AsyncReset_X10019_Y10002_GND;
wire	AsyncReset_X10019_Y10003_GND;
wire	AsyncReset_X10020_Y10001_GND;
wire	AsyncReset_X10020_Y10002_GND;
wire	AsyncReset_X10020_Y10003_GND;
wire	AsyncReset_X5017_Y5012_GND;
wire	AsyncReset_X5019_Y5012_GND;
reg	BCLK1_clk_1_q;
reg	BCLK1_clk_q;
wire	[1:0] BCLK1_clk_q_dataa_combout;
//wire	BCLK1_clk_q_dataa_combout[0];
//wire	BCLK1_clk_q_dataa_combout[1];
wire	BCLK1_i_o;
wire	BCLK1_i_o_X10004_Y10001_SIG_VCC;
wire	BCLK1_i_o_X10019_Y10003_SIG_VCC;
wire	BCLK1_i_o_int;
reg	BCLK2_clk_1_q;
reg	BCLK2_clk_q;
wire	[1:0] BCLK2_clk_q_dataa_combout;
//wire	BCLK2_clk_q_dataa_combout[0];
//wire	BCLK2_clk_q_dataa_combout[1];
wire	BCLK2_i_o;
wire	BCLK2_i_o_X10004_Y10001_SIG_VCC;
wire	BCLK2_i_o_X10014_Y10003_SIG_VCC;
wire	BCLK2_i_o_X10019_Y10003_SIG_VCC;
wire	[3:0] CHRG_i_o;
//wire	CHRG_i_o[0];
//wire	CHRG_i_o[1];
//wire	CHRG_i_o[2];
//wire	CHRG_i_o[3];
wire	CLKFB;
reg	CLKOSC_clk_10_q;
wire	CLKOSC_clk_10_q_A_Y_B_Y;
reg	CLKOSC_clk_11_q;
wire	CLKOSC_clk_11_q_A_Y_A_Y;
wire	[3:0] CLKOSC_clk_11_q_dataa_combout;
//wire	CLKOSC_clk_11_q_dataa_combout[0];
//wire	CLKOSC_clk_11_q_dataa_combout[1];
//wire	CLKOSC_clk_11_q_dataa_combout[2];
//wire	CLKOSC_clk_11_q_dataa_combout[3];
reg	CLKOSC_clk_12_q;
reg	CLKOSC_clk_13_q;
reg	CLKOSC_clk_14_q;
reg	CLKOSC_clk_15_q;
reg	CLKOSC_clk_16_q;
wire	[2:0] CLKOSC_clk_16_q_dataa_combout;
//wire	CLKOSC_clk_16_q_dataa_combout[0];
//wire	CLKOSC_clk_16_q_dataa_combout[1];
//wire	CLKOSC_clk_16_q_dataa_combout[2];
reg	CLKOSC_clk_17_q;
reg	CLKOSC_clk_18_q;
reg	CLKOSC_clk_19_q;
reg	CLKOSC_clk_1_q;
wire	CLKOSC_clk_1_q_A_1_Y_A_Y;
wire	[3:0] CLKOSC_clk_1_q_dataa_1_combout;
//wire	CLKOSC_clk_1_q_dataa_1_combout[0];
//wire	CLKOSC_clk_1_q_dataa_1_combout[1];
//wire	CLKOSC_clk_1_q_dataa_1_combout[2];
//wire	CLKOSC_clk_1_q_dataa_1_combout[3];
wire	[3:0] CLKOSC_clk_1_q_dataa_2_combout;
//wire	CLKOSC_clk_1_q_dataa_2_combout[0];
//wire	CLKOSC_clk_1_q_dataa_2_combout[1];
//wire	CLKOSC_clk_1_q_dataa_2_combout[2];
//wire	CLKOSC_clk_1_q_dataa_2_combout[3];
wire	[3:0] CLKOSC_clk_1_q_dataa_3_combout;
//wire	CLKOSC_clk_1_q_dataa_3_combout[0];
//wire	CLKOSC_clk_1_q_dataa_3_combout[1];
//wire	CLKOSC_clk_1_q_dataa_3_combout[2];
//wire	CLKOSC_clk_1_q_dataa_3_combout[3];
wire	[3:0] CLKOSC_clk_1_q_dataa_combout;
//wire	CLKOSC_clk_1_q_dataa_combout[0];
//wire	CLKOSC_clk_1_q_dataa_combout[1];
//wire	CLKOSC_clk_1_q_dataa_combout[2];
//wire	CLKOSC_clk_1_q_dataa_combout[3];
wire	[3:0] CLKOSC_clk_1_q_datab_1_combout;
//wire	CLKOSC_clk_1_q_datab_1_combout[0];
//wire	CLKOSC_clk_1_q_datab_1_combout[1];
//wire	CLKOSC_clk_1_q_datab_1_combout[2];
//wire	CLKOSC_clk_1_q_datab_1_combout[3];
reg	CLKOSC_clk_20_q;
wire	CLKOSC_clk_20_q_A_Y_B_Y;
reg	CLKOSC_clk_21_q;
wire	CLKOSC_clk_2__feeder__LutOut;
reg	CLKOSC_clk_2_q;
wire	CLKOSC_clk_2_q_A_1_Y;
wire	CLKOSC_clk_2_q_A_1_Y__SyncLoad_X10016_Y10003_SIG;
wire	CLKOSC_clk_2_q_A_1_Y__SyncLoad_X10019_Y10002_SIG;
wire	CLKOSC_clk_2_q_A_2_Y;
wire	CLKOSC_clk_2_q_A_2_Y__SyncLoad_X10016_Y10002_SIG;
wire	CLKOSC_clk_2_q_A_3_Y;
wire	CLKOSC_clk_2_q_A_3_Y__SyncLoad_X10009_Y10002_SIG;
wire	[2:0] CLKOSC_clk_2_q_A_3_Y_dataa_1_combout;
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_1_combout[0];
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_1_combout[1];
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_1_combout[2];
wire	[3:0] CLKOSC_clk_2_q_A_3_Y_dataa_combout;
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_combout[0];
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_combout[1];
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_combout[2];
//wire	CLKOSC_clk_2_q_A_3_Y_dataa_combout[3];
wire	CLKOSC_clk_2_q_A_Y;
wire	CLKOSC_clk_2_q_A_Y__SyncLoad_X10015_Y10002_SIG;
wire	[3:0] CLKOSC_clk_2_q_dataa_combout;
//wire	CLKOSC_clk_2_q_dataa_combout[0];
//wire	CLKOSC_clk_2_q_dataa_combout[1];
//wire	CLKOSC_clk_2_q_dataa_combout[2];
//wire	CLKOSC_clk_2_q_dataa_combout[3];
wire	[3:0] CLKOSC_clk_2_q_datab_combout;
//wire	CLKOSC_clk_2_q_datab_combout[0];
//wire	CLKOSC_clk_2_q_datab_combout[1];
//wire	CLKOSC_clk_2_q_datab_combout[2];
//wire	CLKOSC_clk_2_q_datab_combout[3];
wire	CLKOSC_clk_3__feeder__LutOut;
reg	CLKOSC_clk_3_q;
wire	CLKOSC_clk_3_q_A_Y_B_Y_B_Y;
wire	CLKOSC_clk_4__feeder__LutOut;
reg	CLKOSC_clk_4_q;
wire	CLKOSC_clk_5__feeder__LutOut;
reg	CLKOSC_clk_5_q;
wire	CLKOSC_clk_6__feeder__LutOut;
reg	CLKOSC_clk_6_q;
wire	[3:0] CLKOSC_clk_6_q_dataa_combout;
//wire	CLKOSC_clk_6_q_dataa_combout[0];
//wire	CLKOSC_clk_6_q_dataa_combout[1];
//wire	CLKOSC_clk_6_q_dataa_combout[2];
//wire	CLKOSC_clk_6_q_dataa_combout[3];
wire	CLKOSC_clk_7__feeder__LutOut;
reg	CLKOSC_clk_7_q;
wire	CLKOSC_clk_8__feeder__LutOut;
reg	CLKOSC_clk_8_q;
wire	[3:0] CLKOSC_clk_8_q_datac_combout;
//wire	CLKOSC_clk_8_q_datac_combout[0];
//wire	CLKOSC_clk_8_q_datac_combout[1];
//wire	CLKOSC_clk_8_q_datac_combout[2];
//wire	CLKOSC_clk_8_q_datac_combout[3];
reg	CLKOSC_clk_9_q;
wire	CLKOSC_clk_9_q_A_Y_B_Y;
wire	[3:0] CLKOSC_clk_9_q_dataa_combout;
//wire	CLKOSC_clk_9_q_dataa_combout[0];
//wire	CLKOSC_clk_9_q_dataa_combout[1];
//wire	CLKOSC_clk_9_q_dataa_combout[2];
//wire	CLKOSC_clk_9_q_dataa_combout[3];
wire	[3:0] CLKOSC_clk_9_q_dataa_combout_datac_2_combout;
//wire	CLKOSC_clk_9_q_dataa_combout_datac_2_combout[0];
//wire	CLKOSC_clk_9_q_dataa_combout_datac_2_combout[1];
//wire	CLKOSC_clk_9_q_dataa_combout_datac_2_combout[2];
//wire	CLKOSC_clk_9_q_dataa_combout_datac_2_combout[3];
reg	CLKOSC_clk_q;
wire	CLKOSC_clk_q_dataa_1_combout;
wire	[1:0] CLKOSC_clk_q_dataa_combout;
//wire	CLKOSC_clk_q_dataa_combout[0];
//wire	CLKOSC_clk_q_dataa_combout[1];
wire	CLKOSC_i_o;
wire	CLKOSC_i_o_X10005_Y10001_SIG_VCC;
wire	CLKOSC_i_o_X10005_Y10002_SIG_VCC;
wire	CLKOSC_i_o_X10006_Y10003_SIG_VCC;
wire	CLKOSC_i_o_X10010_Y10001_SIG_VCC;
wire	CLKOSC_i_o_X10010_Y10003_SIG_VCC;
wire	CLKOSC_i_o_X10011_Y10002_SIG_VCC;
wire	CLKOSC_i_o_X10017_Y10003_SIG_VCC;
wire	CLKOSC_i_o_X10018_Y10001_SIG_VCC;
wire	\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10001_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10006_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10009_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10001_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10002_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10009_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10014_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10015_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10016_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10016_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10020_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10001_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10002_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10009_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10014_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10015_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10016_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10019_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10020_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10010_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10005_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10007_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10015_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10016_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10019_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10003_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10005_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10008_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10012_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10015_Y10003_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10020_Y10001_SIG_SIG ;
wire	\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10020_Y10003_SIG_SIG ;
wire	CLKOSC_i_o_int;
wire	[3:0] CO1_i_o;
//wire	CO1_i_o[0];
//wire	CO1_i_o[1];
//wire	CO1_i_o[2];
//wire	CO1_i_o[3];
wire	[3:0] CO2_i_o;
//wire	CO2_i_o[0];
//wire	CO2_i_o[1];
//wire	CO2_i_o[2];
//wire	CO2_i_o[3];
wire	CSEL1_A_Y_A_Y_B_Y;
wire	[3:0] CSEL1_q_1;
//wire	CSEL1_q_1[0];
//wire	CSEL1_q_1[1];
//wire	CSEL1_q_1[2];
//wire	CSEL1_q_1[3];
wire	CSEL2_A_Y_B_Y_A_Y;
wire	[3:0] CSEL2_q_1;
//wire	CSEL2_q_1[0];
//wire	CSEL2_q_1[1];
//wire	CSEL2_q_1[2];
//wire	CSEL2_q_1[3];
wire	[1:0] DISP_i_o;
//wire	DISP_i_o[0];
//wire	DISP_i_o[1];
wire	GCLK;
wire	GCLK_X10001_Y10002_SIG_VCC;
wire	GCLK_X10012_Y10002_SIG_VCC;
wire	GCLK_X10014_Y10001_SIG_VCC;
wire	GCLK_X10015_Y10001_SIG_VCC;
wire	GCLK_X10016_Y10003_SIG_VCC;
wire	GCLK_X10019_Y10001_SIG_VCC;
wire	\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ;
wire	\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ;
wire	\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ;
wire	\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ;
wire	\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ;
wire	\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ;
wire	GCLK_int;
reg	I2S1_d_q;
wire	[3:0] I2S1_i_o;
//wire	I2S1_i_o[0];
//wire	I2S1_i_o[1];
//wire	I2S1_i_o[2];
//wire	I2S1_i_o[3];
reg	I2S2_d_q;
wire	[3:0] I2S2_i_o;
//wire	I2S2_i_o[0];
//wire	I2S2_i_o[1];
//wire	I2S2_i_o[2];
//wire	I2S2_i_o[3];
wire	SCL_i_o;
wire	SDA_i_o;
wire	[3:0] STDBY_i_o;
//wire	STDBY_i_o[0];
//wire	STDBY_i_o[1];
//wire	STDBY_i_o[2];
//wire	STDBY_i_o[3];
wire	SyncLoad_X10001_Y10002_GND;
wire	SyncLoad_X10002_Y10001_GND;
wire	SyncLoad_X10002_Y10003_GND;
wire	SyncLoad_X10003_Y10002_GND;
wire	SyncLoad_X10004_Y10001_VCC;
wire	SyncLoad_X10004_Y10002_GND;
wire	SyncLoad_X10004_Y10003_GND;
wire	SyncLoad_X10005_Y10001_GND;
wire	SyncLoad_X10006_Y10001_GND;
wire	SyncLoad_X10007_Y10001_GND;
wire	SyncLoad_X10007_Y10002_GND;
wire	SyncLoad_X10007_Y10003_GND;
wire	SyncLoad_X10008_Y10001_GND;
wire	SyncLoad_X10009_Y10001_GND;
wire	SyncLoad_X10009_Y10003_GND;
wire	SyncLoad_X10010_Y10001_GND;
wire	SyncLoad_X10012_Y10001_GND;
wire	SyncLoad_X10012_Y10002_VCC;
wire	SyncLoad_X10016_Y10001_VCC;
wire	SyncLoad_X10017_Y10001_VCC;
wire	SyncLoad_X10017_Y10002_GND;
wire	SyncLoad_X10017_Y10003_VCC;
wire	SyncLoad_X10018_Y10001_VCC;
wire	SyncLoad_X10018_Y10002_GND;
wire	SyncLoad_X10019_Y10001_GND;
wire	SyncLoad_X10019_Y10003_VCC;
wire	SyncReset_X10001_Y10001_GND;
wire	SyncReset_X10001_Y10003_GND;
wire	SyncReset_X10002_Y10002_GND;
wire	SyncReset_X10004_Y10001_GND;
wire	SyncReset_X10006_Y10002_GND;
wire	SyncReset_X10006_Y10003_GND;
wire	SyncReset_X10008_Y10002_GND;
wire	SyncReset_X10009_Y10002_GND;
wire	SyncReset_X10010_Y10002_GND;
wire	SyncReset_X10010_Y10003_GND;
wire	SyncReset_X10011_Y10002_GND;
wire	SyncReset_X10011_Y10003_GND;
wire	SyncReset_X10012_Y10002_GND;
wire	SyncReset_X10014_Y10001_GND;
wire	SyncReset_X10014_Y10002_GND;
wire	SyncReset_X10014_Y10003_GND;
wire	SyncReset_X10015_Y10001_GND;
wire	SyncReset_X10015_Y10002_GND;
wire	SyncReset_X10016_Y10001_GND;
wire	SyncReset_X10016_Y10002_GND;
wire	SyncReset_X10016_Y10003_GND;
wire	SyncReset_X10017_Y10001_GND;
wire	SyncReset_X10017_Y10003_GND;
wire	SyncReset_X10018_Y10001_GND;
wire	SyncReset_X10018_Y10003_GND;
wire	SyncReset_X10019_Y10002_GND;
wire	SyncReset_X10019_Y10003_GND;
wire	SyncReset_X10020_Y10002_GND;
wire	\gclk|clkout1 ;
wire	\gclk|clkout2 ;
wire	\gclk|clkout3 ;
wire	\gclk|clkout4 ;
wire	\gclk|global_clock_lock ;
wire	\gclk|global_clock_phasedone ;
wire	\gclk|global_clock_scandataout ;
wire	\gclk|global_clock_scandone ;
wire	\gnd~I_int ;
reg	[7:0] \i2c_device|OFFSET_PRIMARY ;
//reg	\i2c_device|OFFSET_PRIMARY [0];
//reg	\i2c_device|OFFSET_PRIMARY [1];
//reg	\i2c_device|OFFSET_PRIMARY [2];
//reg	\i2c_device|OFFSET_PRIMARY [3];
//reg	\i2c_device|OFFSET_PRIMARY [4];
//reg	\i2c_device|OFFSET_PRIMARY [5];
//reg	\i2c_device|OFFSET_PRIMARY [6];
//reg	\i2c_device|OFFSET_PRIMARY [7];
wire	\i2c_device|OFFSET_PRIMARY_A_2_Y_B_Y_B_Y ;
wire	\i2c_device|OFFSET_PRIMARY_A_3_Y_B_Y_B_Y ;
wire	\i2c_device|OFFSET_PRIMARY_A_4_Y_A_Y ;
wire	\i2c_device|OFFSET_PRIMARY_A_5_Y_B_Y ;
wire	\i2c_device|OFFSET_PRIMARY_A_6_Y_B_Y ;
wire	\i2c_device|OFFSET_PRIMARY_A_7_Y_B_Y ;
wire	[7:0] \i2c_device|OFFSET_PRIMARY_datab_0_combout ;
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [0];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [1];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [2];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [3];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [4];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [5];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [6];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_combout [7];
wire	[8:0] \i2c_device|OFFSET_PRIMARY_datab_0_cout ;
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [0];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [1];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [2];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [3];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [4];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [5];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [6];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [7];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout [8];
wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout ;
wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y ;
wire	[2:0] \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout ;
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [0];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [1];
//wire	\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [2];
wire	\i2c_device|OFFSET_PRIMARY_q_4__feeder__LutOut ;
reg	[7:0] \i2c_device|OFFSET_SECONDARY ;
//reg	\i2c_device|OFFSET_SECONDARY [0];
//reg	\i2c_device|OFFSET_SECONDARY [1];
//reg	\i2c_device|OFFSET_SECONDARY [2];
//reg	\i2c_device|OFFSET_SECONDARY [3];
//reg	\i2c_device|OFFSET_SECONDARY [4];
//reg	\i2c_device|OFFSET_SECONDARY [5];
//reg	\i2c_device|OFFSET_SECONDARY [6];
//reg	\i2c_device|OFFSET_SECONDARY [7];
wire	[3:0] \i2c_device|OFFSET_SECONDARY_dataa_1_combout ;
//wire	\i2c_device|OFFSET_SECONDARY_dataa_1_combout [0];
//wire	\i2c_device|OFFSET_SECONDARY_dataa_1_combout [1];
//wire	\i2c_device|OFFSET_SECONDARY_dataa_1_combout [2];
//wire	\i2c_device|OFFSET_SECONDARY_dataa_1_combout [3];
wire	[7:0] \i2c_device|OFFSET_SECONDARY_datab_0_combout ;
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [0];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [1];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [2];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [3];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [4];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [5];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [6];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_combout [7];
wire	[8:0] \i2c_device|OFFSET_SECONDARY_datab_0_cout ;
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [0];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [1];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [2];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [3];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [4];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [5];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [6];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [7];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout [8];
wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout ;
wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y ;
wire	[2:0] \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout ;
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [0];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [1];
//wire	\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [2];
wire	[2:0] \i2c_device|bit_pos ;
//wire	\i2c_device|bit_pos [0];
//wire	\i2c_device|bit_pos [1];
//wire	\i2c_device|bit_pos [2];
wire	\i2c_device|bit_pos_A_2_1_Y ;
wire	\i2c_device|bit_pos_A_2_1_Y__SyncLoad_X10014_Y10002_SIG ;
wire	\i2c_device|bit_pos_A_2_2_Y ;
wire	\i2c_device|bit_pos_A_2_2_Y__SyncLoad_X10020_Y10002_SIG ;
wire	\i2c_device|bit_pos_A_2_3_Y ;
wire	\i2c_device|bit_pos_A_2_3_Y__SyncLoad_X10002_Y10002_SIG ;
wire	\i2c_device|bit_pos_A_2_Y ;
wire	\i2c_device|bit_pos_A_2_Y__SyncLoad_X10001_Y10003_SIG ;
wire	\i2c_device|bit_pos_dataa_0_combout ;
wire	\i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y ;
wire	\i2c_device|bit_pos_dataa_0_combout_A_Y ;
wire	\i2c_device|bit_pos_dataa_0_combout_A_Y__SyncLoad_X10020_Y10001_SIG ;
wire	\i2c_device|bit_pos_dataa_0_combout_B_Y ;
wire	\i2c_device|bit_pos_dataa_0_combout_B_Y__SyncLoad_X10008_Y10003_SIG ;
wire	[3:0] \i2c_device|bit_pos_dataa_0_combout_datab_combout ;
//wire	\i2c_device|bit_pos_dataa_0_combout_datab_combout [0];
//wire	\i2c_device|bit_pos_dataa_0_combout_datab_combout [1];
//wire	\i2c_device|bit_pos_dataa_0_combout_datab_combout [2];
//wire	\i2c_device|bit_pos_dataa_0_combout_datab_combout [3];
wire	[4:0] \i2c_device|bit_pos_dataa_0_cout ;
//wire	\i2c_device|bit_pos_dataa_0_cout [0];
//wire	\i2c_device|bit_pos_dataa_0_cout [1];
//wire	\i2c_device|bit_pos_dataa_0_cout [2];
//wire	\i2c_device|bit_pos_dataa_0_cout [3];
//wire	\i2c_device|bit_pos_dataa_0_cout [4];
wire	\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ;
wire	\i2c_device|bit_pos_dataa_1_combout ;
wire	\i2c_device|bit_pos_dataa_1_combout_A_Y ;
wire	\i2c_device|bit_pos_dataa_1_combout_A_Y__SyncLoad_X10012_Y10003_SIG ;
wire	\i2c_device|bit_pos_dataa_1_combout_B_Y ;
wire	\i2c_device|bit_pos_dataa_1_combout_B_Y__SyncLoad_X10003_Y10003_SIG ;
wire	[3:0] \i2c_device|bit_pos_dataa_1_combout_datab_combout ;
//wire	\i2c_device|bit_pos_dataa_1_combout_datab_combout [0];
//wire	\i2c_device|bit_pos_dataa_1_combout_datab_combout [1];
//wire	\i2c_device|bit_pos_dataa_1_combout_datab_combout [2];
//wire	\i2c_device|bit_pos_dataa_1_combout_datab_combout [3];
wire	\i2c_device|bit_pos_dataa_2_combout ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y__SyncLoad_X10020_Y10003_SIG ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y__SyncLoad_X10005_Y10003_SIG ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y ;
wire	\i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y__SyncLoad_X10015_Y10003_SIG ;
wire	[3:0] \i2c_device|bit_pos_dataa_2_combout_datab_combout ;
//wire	\i2c_device|bit_pos_dataa_2_combout_datab_combout [0];
//wire	\i2c_device|bit_pos_dataa_2_combout_datab_combout [1];
//wire	\i2c_device|bit_pos_dataa_2_combout_datab_combout [2];
//wire	\i2c_device|bit_pos_dataa_2_combout_datab_combout [3];
reg	[22:0] \i2c_device|brin_cnt ;
//reg	\i2c_device|brin_cnt [0];
//reg	\i2c_device|brin_cnt [10];
wire	\i2c_device|brin_cnt[10]_reg__feeder__LutOut ;
//reg	\i2c_device|brin_cnt [11];
//reg	\i2c_device|brin_cnt [12];
//reg	\i2c_device|brin_cnt [13];
wire	\i2c_device|brin_cnt[13]_reg__feeder__LutOut ;
//reg	\i2c_device|brin_cnt [14];
//reg	\i2c_device|brin_cnt [15];
//reg	\i2c_device|brin_cnt [16];
//reg	\i2c_device|brin_cnt [17];
//reg	\i2c_device|brin_cnt [18];
wire	\i2c_device|brin_cnt[18]_reg__feeder__LutOut ;
//reg	\i2c_device|brin_cnt [19];
//reg	\i2c_device|brin_cnt [1];
//reg	\i2c_device|brin_cnt [20];
wire	\i2c_device|brin_cnt[20]_reg__feeder__LutOut ;
//reg	\i2c_device|brin_cnt [21];
wire	\i2c_device|brin_cnt[21]_reg__feeder__LutOut ;
//reg	\i2c_device|brin_cnt [22];
wire	\i2c_device|brin_cnt[22]_reg__feeder__LutOut ;
//reg	\i2c_device|brin_cnt [2];
//reg	\i2c_device|brin_cnt [3];
//reg	\i2c_device|brin_cnt [4];
//reg	\i2c_device|brin_cnt [5];
//reg	\i2c_device|brin_cnt [6];
//reg	\i2c_device|brin_cnt [7];
//reg	\i2c_device|brin_cnt [8];
//reg	\i2c_device|brin_cnt [9];
wire	\i2c_device|brin_cnt_dataa_0_combout ;
wire	[23:0] \i2c_device|brin_cnt_dataa_0_cout ;
//wire	\i2c_device|brin_cnt_dataa_0_cout [0];
//wire	\i2c_device|brin_cnt_dataa_0_cout [10];
//wire	\i2c_device|brin_cnt_dataa_0_cout [11];
//wire	\i2c_device|brin_cnt_dataa_0_cout [12];
//wire	\i2c_device|brin_cnt_dataa_0_cout [13];
//wire	\i2c_device|brin_cnt_dataa_0_cout [14];
//wire	\i2c_device|brin_cnt_dataa_0_cout [15];
//wire	\i2c_device|brin_cnt_dataa_0_cout [16];
//wire	\i2c_device|brin_cnt_dataa_0_cout [17];
//wire	\i2c_device|brin_cnt_dataa_0_cout [18];
//wire	\i2c_device|brin_cnt_dataa_0_cout [19];
//wire	\i2c_device|brin_cnt_dataa_0_cout [1];
//wire	\i2c_device|brin_cnt_dataa_0_cout [20];
//wire	\i2c_device|brin_cnt_dataa_0_cout [21];
//wire	\i2c_device|brin_cnt_dataa_0_cout [22];
//wire	\i2c_device|brin_cnt_dataa_0_cout [23];
//wire	\i2c_device|brin_cnt_dataa_0_cout [2];
//wire	\i2c_device|brin_cnt_dataa_0_cout [3];
//wire	\i2c_device|brin_cnt_dataa_0_cout [4];
//wire	\i2c_device|brin_cnt_dataa_0_cout [5];
//wire	\i2c_device|brin_cnt_dataa_0_cout [6];
//wire	\i2c_device|brin_cnt_dataa_0_cout [7];
//wire	\i2c_device|brin_cnt_dataa_0_cout [8];
//wire	\i2c_device|brin_cnt_dataa_0_cout [9];
wire	[22:0] \i2c_device|brin_cnt_dataa_10_combout ;
//wire	\i2c_device|brin_cnt_dataa_10_combout [0];
//wire	\i2c_device|brin_cnt_dataa_10_combout [10];
//wire	\i2c_device|brin_cnt_dataa_10_combout [11];
//wire	\i2c_device|brin_cnt_dataa_10_combout [12];
//wire	\i2c_device|brin_cnt_dataa_10_combout [13];
//wire	\i2c_device|brin_cnt_dataa_10_combout [14];
//wire	\i2c_device|brin_cnt_dataa_10_combout [15];
//wire	\i2c_device|brin_cnt_dataa_10_combout [16];
//wire	\i2c_device|brin_cnt_dataa_10_combout [17];
//wire	\i2c_device|brin_cnt_dataa_10_combout [18];
//wire	\i2c_device|brin_cnt_dataa_10_combout [19];
//wire	\i2c_device|brin_cnt_dataa_10_combout [1];
//wire	\i2c_device|brin_cnt_dataa_10_combout [20];
//wire	\i2c_device|brin_cnt_dataa_10_combout [21];
//wire	\i2c_device|brin_cnt_dataa_10_combout [22];
//wire	\i2c_device|brin_cnt_dataa_10_combout [2];
//wire	\i2c_device|brin_cnt_dataa_10_combout [3];
//wire	\i2c_device|brin_cnt_dataa_10_combout [4];
//wire	\i2c_device|brin_cnt_dataa_10_combout [5];
//wire	\i2c_device|brin_cnt_dataa_10_combout [6];
//wire	\i2c_device|brin_cnt_dataa_10_combout [7];
//wire	\i2c_device|brin_cnt_dataa_10_combout [8];
//wire	\i2c_device|brin_cnt_dataa_10_combout [9];
wire	\i2c_device|brin_cnt_dataa_11_combout ;
wire	\i2c_device|brin_cnt_dataa_12_combout ;
wire	\i2c_device|brin_cnt_dataa_14_combout ;
wire	\i2c_device|brin_cnt_dataa_15_combout ;
wire	\i2c_device|brin_cnt_dataa_16_combout ;
wire	\i2c_device|brin_cnt_dataa_17_combout ;
wire	\i2c_device|brin_cnt_dataa_19_combout ;
wire	\i2c_device|brin_cnt_dataa_1_combout ;
wire	\i2c_device|brin_cnt_dataa_2_combout ;
wire	\i2c_device|brin_cnt_dataa_3_combout ;
wire	\i2c_device|brin_cnt_dataa_4_combout ;
wire	\i2c_device|brin_cnt_dataa_5_combout ;
wire	\i2c_device|brin_cnt_dataa_6_combout ;
wire	\i2c_device|brin_cnt_dataa_7_combout ;
wire	[14:0] \i2c_device|brin_cnt_dataa_8_1_combout ;
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [0];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [10];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [11];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [12];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [13];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [14];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [1];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [2];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [3];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [4];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [5];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [6];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [7];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [8];
//wire	\i2c_device|brin_cnt_dataa_8_1_combout [9];
wire	[15:0] \i2c_device|brin_cnt_dataa_8_1_cout ;
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [0];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [10];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [11];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [12];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [13];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [14];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [15];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [1];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [2];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [3];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [4];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [5];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [6];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [7];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [8];
//wire	\i2c_device|brin_cnt_dataa_8_1_cout [9];
wire	\i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout ;
wire	\i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y ;
wire	[2:0] \i2c_device|brin_cnt_dataa_8_2_combout ;
//wire	\i2c_device|brin_cnt_dataa_8_2_combout [0];
//wire	\i2c_device|brin_cnt_dataa_8_2_combout [1];
//wire	\i2c_device|brin_cnt_dataa_8_2_combout [2];
wire	\i2c_device|brin_cnt_dataa_8_combout ;
wire	[3:0] \i2c_device|brin_cnt_dataa_9_2_combout ;
//wire	\i2c_device|brin_cnt_dataa_9_2_combout [0];
//wire	\i2c_device|brin_cnt_dataa_9_2_combout [1];
//wire	\i2c_device|brin_cnt_dataa_9_2_combout [2];
//wire	\i2c_device|brin_cnt_dataa_9_2_combout [3];
wire	\i2c_device|brin_cnt_dataa_9_combout ;
wire	[3:0] \i2c_device|brin_cnt_datad_6_combout ;
//wire	\i2c_device|brin_cnt_datad_6_combout [0];
//wire	\i2c_device|brin_cnt_datad_6_combout [1];
//wire	\i2c_device|brin_cnt_datad_6_combout [2];
//wire	\i2c_device|brin_cnt_datad_6_combout [3];
wire	[1:0] \i2c_device|brin_rec ;
//wire	\i2c_device|brin_rec [0];
//wire	\i2c_device|brin_rec [1];
wire	\i2c_device|brin_rec_A_0_1_Y ;
wire	\i2c_device|brin_rec_A_0_Y ;
wire	\i2c_device|brin_rec_A_0_Y_B_Y ;
wire	\i2c_device|brin_rec_A_0_Y__SyncLoad_X10001_Y10001_SIG ;
wire	\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ;
wire	\i2c_device|brin_rec_A_0_Y__SyncReset_X10006_Y10001_SIG ;
wire	\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ;
reg	\i2c_device|brin_rec_d_0_q ;
reg	[22:0] \i2c_device|brip_cnt ;
//reg	\i2c_device|brip_cnt [0];
//reg	\i2c_device|brip_cnt [10];
wire	\i2c_device|brip_cnt[10]_reg__feeder__LutOut ;
//reg	\i2c_device|brip_cnt [11];
//reg	\i2c_device|brip_cnt [12];
//reg	\i2c_device|brip_cnt [13];
wire	\i2c_device|brip_cnt[13]_reg__feeder__LutOut ;
//reg	\i2c_device|brip_cnt [14];
//reg	\i2c_device|brip_cnt [15];
//reg	\i2c_device|brip_cnt [16];
//reg	\i2c_device|brip_cnt [17];
//reg	\i2c_device|brip_cnt [18];
wire	\i2c_device|brip_cnt[18]_reg__feeder__LutOut ;
//reg	\i2c_device|brip_cnt [19];
//reg	\i2c_device|brip_cnt [1];
//reg	\i2c_device|brip_cnt [20];
wire	\i2c_device|brip_cnt[20]_reg__feeder__LutOut ;
//reg	\i2c_device|brip_cnt [21];
wire	\i2c_device|brip_cnt[21]_reg__feeder__LutOut ;
//reg	\i2c_device|brip_cnt [22];
wire	\i2c_device|brip_cnt[22]_reg__feeder__LutOut ;
//reg	\i2c_device|brip_cnt [2];
//reg	\i2c_device|brip_cnt [3];
//reg	\i2c_device|brip_cnt [4];
//reg	\i2c_device|brip_cnt [5];
//reg	\i2c_device|brip_cnt [6];
//reg	\i2c_device|brip_cnt [7];
//reg	\i2c_device|brip_cnt [8];
//reg	\i2c_device|brip_cnt [9];
wire	\i2c_device|brip_cnt_dataa_0_combout ;
wire	[23:0] \i2c_device|brip_cnt_dataa_0_cout ;
//wire	\i2c_device|brip_cnt_dataa_0_cout [0];
//wire	\i2c_device|brip_cnt_dataa_0_cout [10];
//wire	\i2c_device|brip_cnt_dataa_0_cout [11];
//wire	\i2c_device|brip_cnt_dataa_0_cout [12];
//wire	\i2c_device|brip_cnt_dataa_0_cout [13];
//wire	\i2c_device|brip_cnt_dataa_0_cout [14];
//wire	\i2c_device|brip_cnt_dataa_0_cout [15];
//wire	\i2c_device|brip_cnt_dataa_0_cout [16];
//wire	\i2c_device|brip_cnt_dataa_0_cout [17];
//wire	\i2c_device|brip_cnt_dataa_0_cout [18];
//wire	\i2c_device|brip_cnt_dataa_0_cout [19];
//wire	\i2c_device|brip_cnt_dataa_0_cout [1];
//wire	\i2c_device|brip_cnt_dataa_0_cout [20];
//wire	\i2c_device|brip_cnt_dataa_0_cout [21];
//wire	\i2c_device|brip_cnt_dataa_0_cout [22];
//wire	\i2c_device|brip_cnt_dataa_0_cout [23];
//wire	\i2c_device|brip_cnt_dataa_0_cout [2];
//wire	\i2c_device|brip_cnt_dataa_0_cout [3];
//wire	\i2c_device|brip_cnt_dataa_0_cout [4];
//wire	\i2c_device|brip_cnt_dataa_0_cout [5];
//wire	\i2c_device|brip_cnt_dataa_0_cout [6];
//wire	\i2c_device|brip_cnt_dataa_0_cout [7];
//wire	\i2c_device|brip_cnt_dataa_0_cout [8];
//wire	\i2c_device|brip_cnt_dataa_0_cout [9];
wire	[22:0] \i2c_device|brip_cnt_dataa_10_combout ;
//wire	\i2c_device|brip_cnt_dataa_10_combout [0];
//wire	\i2c_device|brip_cnt_dataa_10_combout [10];
//wire	\i2c_device|brip_cnt_dataa_10_combout [11];
//wire	\i2c_device|brip_cnt_dataa_10_combout [12];
//wire	\i2c_device|brip_cnt_dataa_10_combout [13];
//wire	\i2c_device|brip_cnt_dataa_10_combout [14];
//wire	\i2c_device|brip_cnt_dataa_10_combout [15];
//wire	\i2c_device|brip_cnt_dataa_10_combout [16];
//wire	\i2c_device|brip_cnt_dataa_10_combout [17];
//wire	\i2c_device|brip_cnt_dataa_10_combout [18];
//wire	\i2c_device|brip_cnt_dataa_10_combout [19];
//wire	\i2c_device|brip_cnt_dataa_10_combout [1];
//wire	\i2c_device|brip_cnt_dataa_10_combout [20];
//wire	\i2c_device|brip_cnt_dataa_10_combout [21];
//wire	\i2c_device|brip_cnt_dataa_10_combout [22];
//wire	\i2c_device|brip_cnt_dataa_10_combout [2];
//wire	\i2c_device|brip_cnt_dataa_10_combout [3];
//wire	\i2c_device|brip_cnt_dataa_10_combout [4];
//wire	\i2c_device|brip_cnt_dataa_10_combout [5];
//wire	\i2c_device|brip_cnt_dataa_10_combout [6];
//wire	\i2c_device|brip_cnt_dataa_10_combout [7];
//wire	\i2c_device|brip_cnt_dataa_10_combout [8];
//wire	\i2c_device|brip_cnt_dataa_10_combout [9];
wire	\i2c_device|brip_cnt_dataa_11_combout ;
wire	\i2c_device|brip_cnt_dataa_12_combout ;
wire	\i2c_device|brip_cnt_dataa_14_combout ;
wire	\i2c_device|brip_cnt_dataa_15_combout ;
wire	\i2c_device|brip_cnt_dataa_16_combout ;
wire	\i2c_device|brip_cnt_dataa_17_combout ;
wire	\i2c_device|brip_cnt_dataa_19_combout ;
wire	\i2c_device|brip_cnt_dataa_1_combout ;
wire	\i2c_device|brip_cnt_dataa_2_combout ;
wire	\i2c_device|brip_cnt_dataa_3_combout ;
wire	\i2c_device|brip_cnt_dataa_4_combout ;
wire	\i2c_device|brip_cnt_dataa_5_combout ;
wire	\i2c_device|brip_cnt_dataa_6_combout ;
wire	\i2c_device|brip_cnt_dataa_7_combout ;
wire	[14:0] \i2c_device|brip_cnt_dataa_8_1_combout ;
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [0];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [10];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [11];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [12];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [13];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [14];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [1];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [2];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [3];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [4];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [5];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [6];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [7];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [8];
//wire	\i2c_device|brip_cnt_dataa_8_1_combout [9];
wire	[15:0] \i2c_device|brip_cnt_dataa_8_1_cout ;
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [0];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [10];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [11];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [12];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [13];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [14];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [15];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [1];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [2];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [3];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [4];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [5];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [6];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [7];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [8];
//wire	\i2c_device|brip_cnt_dataa_8_1_cout [9];
wire	\i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout ;
wire	\i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y ;
wire	\i2c_device|brip_cnt_dataa_8_combout ;
wire	[3:0] \i2c_device|brip_cnt_dataa_9_2_combout ;
//wire	\i2c_device|brip_cnt_dataa_9_2_combout [0];
//wire	\i2c_device|brip_cnt_dataa_9_2_combout [1];
//wire	\i2c_device|brip_cnt_dataa_9_2_combout [2];
//wire	\i2c_device|brip_cnt_dataa_9_2_combout [3];
wire	[2:0] \i2c_device|brip_cnt_dataa_9_3_combout ;
//wire	\i2c_device|brip_cnt_dataa_9_3_combout [0];
//wire	\i2c_device|brip_cnt_dataa_9_3_combout [1];
//wire	\i2c_device|brip_cnt_dataa_9_3_combout [2];
wire	\i2c_device|brip_cnt_dataa_9_combout ;
wire	[3:0] \i2c_device|brip_cnt_datad_6_combout ;
//wire	\i2c_device|brip_cnt_datad_6_combout [0];
//wire	\i2c_device|brip_cnt_datad_6_combout [1];
//wire	\i2c_device|brip_cnt_datad_6_combout [2];
//wire	\i2c_device|brip_cnt_datad_6_combout [3];
wire	[1:0] \i2c_device|brip_rec ;
//wire	\i2c_device|brip_rec [0];
//wire	\i2c_device|brip_rec [1];
wire	\i2c_device|brip_rec_A_0_1_Y ;
wire	\i2c_device|brip_rec_A_0_Y ;
wire	\i2c_device|brip_rec_A_0_Y_B_Y ;
wire	\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ;
wire	\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ;
wire	\i2c_device|brip_rec_A_0_Y__SyncReset_X10009_Y10001_SIG ;
reg	\i2c_device|brip_rec_d_0_q ;
wire	[2:0] \i2c_device|i2c_state ;
//wire	\i2c_device|i2c_state [0];
//wire	\i2c_device|i2c_state [1];
//wire	\i2c_device|i2c_state [2];
wire	\i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y ;
wire	\i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y__SyncLoad_X10006_Y10003_SIG ;
wire	\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y ;
wire	\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y__SyncLoad_X10005_Y10002_SIG ;
wire	\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ;
wire	\i2c_device|i2c_state_A_0_2_Y_A_2_Y_B_Y ;
wire	\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ;
wire	[1:0] \i2c_device|i2c_state_dataa_0_combout ;
//wire	\i2c_device|i2c_state_dataa_0_combout [0];
//wire	\i2c_device|i2c_state_dataa_0_combout [1];
wire	[1:0] \i2c_device|i2c_state_datab_0_1_combout ;
//wire	\i2c_device|i2c_state_datab_0_1_combout [0];
//wire	\i2c_device|i2c_state_datab_0_1_combout [1];
wire	[2:0] \i2c_device|i2c_state_datac_0_1_combout ;
//wire	\i2c_device|i2c_state_datac_0_1_combout [0];
//wire	\i2c_device|i2c_state_datac_0_1_combout [1];
//wire	\i2c_device|i2c_state_datac_0_1_combout [2];
reg	[22:0] \i2c_device|locka_cnt ;
//reg	\i2c_device|locka_cnt [0];
//reg	\i2c_device|locka_cnt [10];
//reg	\i2c_device|locka_cnt [11];
//reg	\i2c_device|locka_cnt [12];
wire	\i2c_device|locka_cnt[12]_reg__feeder__LutOut ;
//reg	\i2c_device|locka_cnt [13];
//reg	\i2c_device|locka_cnt [14];
//reg	\i2c_device|locka_cnt [15];
//reg	\i2c_device|locka_cnt [16];
//reg	\i2c_device|locka_cnt [17];
wire	\i2c_device|locka_cnt[17]_reg__feeder__LutOut ;
//reg	\i2c_device|locka_cnt [18];
//reg	\i2c_device|locka_cnt [19];
wire	\i2c_device|locka_cnt[19]_reg__feeder__LutOut ;
//reg	\i2c_device|locka_cnt [1];
//reg	\i2c_device|locka_cnt [20];
wire	\i2c_device|locka_cnt[20]_reg__feeder__LutOut ;
//reg	\i2c_device|locka_cnt [21];
wire	\i2c_device|locka_cnt[21]_reg__feeder__LutOut ;
//reg	\i2c_device|locka_cnt [22];
wire	\i2c_device|locka_cnt[22]_reg__feeder__LutOut ;
//reg	\i2c_device|locka_cnt [2];
//reg	\i2c_device|locka_cnt [3];
//reg	\i2c_device|locka_cnt [4];
//reg	\i2c_device|locka_cnt [5];
//reg	\i2c_device|locka_cnt [6];
//reg	\i2c_device|locka_cnt [7];
//reg	\i2c_device|locka_cnt [8];
//reg	\i2c_device|locka_cnt [9];
wire	\i2c_device|locka_cnt[9]_reg__feeder__LutOut ;
wire	\i2c_device|locka_cnt_dataa_0_combout ;
wire	[23:0] \i2c_device|locka_cnt_dataa_0_cout ;
//wire	\i2c_device|locka_cnt_dataa_0_cout [0];
//wire	\i2c_device|locka_cnt_dataa_0_cout [10];
//wire	\i2c_device|locka_cnt_dataa_0_cout [11];
//wire	\i2c_device|locka_cnt_dataa_0_cout [12];
//wire	\i2c_device|locka_cnt_dataa_0_cout [13];
//wire	\i2c_device|locka_cnt_dataa_0_cout [14];
//wire	\i2c_device|locka_cnt_dataa_0_cout [15];
//wire	\i2c_device|locka_cnt_dataa_0_cout [16];
//wire	\i2c_device|locka_cnt_dataa_0_cout [17];
//wire	\i2c_device|locka_cnt_dataa_0_cout [18];
//wire	\i2c_device|locka_cnt_dataa_0_cout [19];
//wire	\i2c_device|locka_cnt_dataa_0_cout [1];
//wire	\i2c_device|locka_cnt_dataa_0_cout [20];
//wire	\i2c_device|locka_cnt_dataa_0_cout [21];
//wire	\i2c_device|locka_cnt_dataa_0_cout [22];
//wire	\i2c_device|locka_cnt_dataa_0_cout [23];
//wire	\i2c_device|locka_cnt_dataa_0_cout [2];
//wire	\i2c_device|locka_cnt_dataa_0_cout [3];
//wire	\i2c_device|locka_cnt_dataa_0_cout [4];
//wire	\i2c_device|locka_cnt_dataa_0_cout [5];
//wire	\i2c_device|locka_cnt_dataa_0_cout [6];
//wire	\i2c_device|locka_cnt_dataa_0_cout [7];
//wire	\i2c_device|locka_cnt_dataa_0_cout [8];
//wire	\i2c_device|locka_cnt_dataa_0_cout [9];
wire	\i2c_device|locka_cnt_dataa_10_combout ;
wire	\i2c_device|locka_cnt_dataa_11_combout ;
wire	\i2c_device|locka_cnt_dataa_13_combout ;
wire	\i2c_device|locka_cnt_dataa_14_combout ;
wire	\i2c_device|locka_cnt_dataa_15_combout ;
wire	\i2c_device|locka_cnt_dataa_16_combout ;
wire	\i2c_device|locka_cnt_dataa_18_combout ;
wire	\i2c_device|locka_cnt_dataa_1_combout ;
wire	[3:0] \i2c_device|locka_cnt_dataa_22_2_combout ;
//wire	\i2c_device|locka_cnt_dataa_22_2_combout [0];
//wire	\i2c_device|locka_cnt_dataa_22_2_combout [1];
//wire	\i2c_device|locka_cnt_dataa_22_2_combout [2];
//wire	\i2c_device|locka_cnt_dataa_22_2_combout [3];
wire	\i2c_device|locka_cnt_dataa_2_combout ;
wire	\i2c_device|locka_cnt_dataa_3_combout ;
wire	\i2c_device|locka_cnt_dataa_4_combout ;
wire	\i2c_device|locka_cnt_dataa_5_combout ;
wire	[16:0] \i2c_device|locka_cnt_dataa_6_1_combout ;
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [0];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [10];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [11];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [12];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [13];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [14];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [15];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [16];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [1];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [2];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [3];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [4];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [5];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [6];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [7];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [8];
//wire	\i2c_device|locka_cnt_dataa_6_1_combout [9];
wire	[17:0] \i2c_device|locka_cnt_dataa_6_1_cout ;
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [0];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [10];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [11];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [12];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [13];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [14];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [15];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [16];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [17];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [1];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [2];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [3];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [4];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [5];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [6];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [7];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [8];
//wire	\i2c_device|locka_cnt_dataa_6_1_cout [9];
wire	\i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout ;
wire	\i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab_combout ;
wire	\i2c_device|locka_cnt_dataa_6_combout ;
wire	\i2c_device|locka_cnt_dataa_7_combout ;
wire	[3:0] \i2c_device|locka_cnt_dataa_8_3_combout ;
//wire	\i2c_device|locka_cnt_dataa_8_3_combout [0];
//wire	\i2c_device|locka_cnt_dataa_8_3_combout [1];
//wire	\i2c_device|locka_cnt_dataa_8_3_combout [2];
//wire	\i2c_device|locka_cnt_dataa_8_3_combout [3];
wire	[3:0] \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout ;
//wire	\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [0];
//wire	\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [1];
//wire	\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [2];
//wire	\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [3];
wire	\i2c_device|locka_cnt_dataa_8_combout ;
wire	[22:0] \i2c_device|locka_cnt_dataa_9_combout ;
//wire	\i2c_device|locka_cnt_dataa_9_combout [0];
//wire	\i2c_device|locka_cnt_dataa_9_combout [10];
//wire	\i2c_device|locka_cnt_dataa_9_combout [11];
//wire	\i2c_device|locka_cnt_dataa_9_combout [12];
//wire	\i2c_device|locka_cnt_dataa_9_combout [13];
//wire	\i2c_device|locka_cnt_dataa_9_combout [14];
//wire	\i2c_device|locka_cnt_dataa_9_combout [15];
//wire	\i2c_device|locka_cnt_dataa_9_combout [16];
//wire	\i2c_device|locka_cnt_dataa_9_combout [17];
//wire	\i2c_device|locka_cnt_dataa_9_combout [18];
//wire	\i2c_device|locka_cnt_dataa_9_combout [19];
//wire	\i2c_device|locka_cnt_dataa_9_combout [1];
//wire	\i2c_device|locka_cnt_dataa_9_combout [20];
//wire	\i2c_device|locka_cnt_dataa_9_combout [21];
//wire	\i2c_device|locka_cnt_dataa_9_combout [22];
//wire	\i2c_device|locka_cnt_dataa_9_combout [2];
//wire	\i2c_device|locka_cnt_dataa_9_combout [3];
//wire	\i2c_device|locka_cnt_dataa_9_combout [4];
//wire	\i2c_device|locka_cnt_dataa_9_combout [5];
//wire	\i2c_device|locka_cnt_dataa_9_combout [6];
//wire	\i2c_device|locka_cnt_dataa_9_combout [7];
//wire	\i2c_device|locka_cnt_dataa_9_combout [8];
//wire	\i2c_device|locka_cnt_dataa_9_combout [9];
wire	[3:0] \i2c_device|locka_cnt_datab_21_combout ;
//wire	\i2c_device|locka_cnt_datab_21_combout [0];
//wire	\i2c_device|locka_cnt_datab_21_combout [1];
//wire	\i2c_device|locka_cnt_datab_21_combout [2];
//wire	\i2c_device|locka_cnt_datab_21_combout [3];
wire	[1:0] \i2c_device|locka_cnt_datab_21_combout_datab_1_combout ;
//wire	\i2c_device|locka_cnt_datab_21_combout_datab_1_combout [0];
//wire	\i2c_device|locka_cnt_datab_21_combout_datab_1_combout [1];
wire	[1:0] \i2c_device|locka_cnt_datac_0_combout ;
//wire	\i2c_device|locka_cnt_datac_0_combout [0];
//wire	\i2c_device|locka_cnt_datac_0_combout [1];
wire	[1:0] \i2c_device|locka_rec ;
//wire	\i2c_device|locka_rec [0];
//wire	\i2c_device|locka_rec [1];
wire	\i2c_device|locka_rec_A_0_1_Y ;
wire	\i2c_device|locka_rec_A_0_Y ;
wire	\i2c_device|locka_rec_A_0_Y_B_Y ;
wire	\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ;
wire	\i2c_device|locka_rec_A_0_Y__SyncReset_X10010_Y10001_SIG ;
wire	\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ;
reg	\i2c_device|locka_rec_d_0_q ;
reg	[22:0] \i2c_device|lockb_cnt ;
//reg	\i2c_device|lockb_cnt [0];
//reg	\i2c_device|lockb_cnt [10];
//reg	\i2c_device|lockb_cnt [11];
//reg	\i2c_device|lockb_cnt [12];
wire	\i2c_device|lockb_cnt[12]_reg__feeder__LutOut ;
//reg	\i2c_device|lockb_cnt [13];
//reg	\i2c_device|lockb_cnt [14];
//reg	\i2c_device|lockb_cnt [15];
//reg	\i2c_device|lockb_cnt [16];
//reg	\i2c_device|lockb_cnt [17];
wire	\i2c_device|lockb_cnt[17]_reg__feeder__LutOut ;
//reg	\i2c_device|lockb_cnt [18];
//reg	\i2c_device|lockb_cnt [19];
wire	\i2c_device|lockb_cnt[19]_reg__feeder__LutOut ;
//reg	\i2c_device|lockb_cnt [1];
//reg	\i2c_device|lockb_cnt [20];
wire	\i2c_device|lockb_cnt[20]_reg__feeder__LutOut ;
//reg	\i2c_device|lockb_cnt [21];
wire	\i2c_device|lockb_cnt[21]_reg__feeder__LutOut ;
//reg	\i2c_device|lockb_cnt [22];
wire	\i2c_device|lockb_cnt[22]_reg__feeder__LutOut ;
//reg	\i2c_device|lockb_cnt [2];
//reg	\i2c_device|lockb_cnt [3];
//reg	\i2c_device|lockb_cnt [4];
//reg	\i2c_device|lockb_cnt [5];
//reg	\i2c_device|lockb_cnt [6];
//reg	\i2c_device|lockb_cnt [7];
//reg	\i2c_device|lockb_cnt [8];
//reg	\i2c_device|lockb_cnt [9];
wire	\i2c_device|lockb_cnt[9]_reg__feeder__LutOut ;
wire	\i2c_device|lockb_cnt_dataa_0_combout ;
wire	[23:0] \i2c_device|lockb_cnt_dataa_0_cout ;
//wire	\i2c_device|lockb_cnt_dataa_0_cout [0];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [10];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [11];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [12];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [13];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [14];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [15];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [16];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [17];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [18];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [19];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [1];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [20];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [21];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [22];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [23];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [2];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [3];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [4];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [5];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [6];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [7];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [8];
//wire	\i2c_device|lockb_cnt_dataa_0_cout [9];
wire	\i2c_device|lockb_cnt_dataa_10_combout ;
wire	[1:0] \i2c_device|lockb_cnt_dataa_11_2_combout ;
//wire	\i2c_device|lockb_cnt_dataa_11_2_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_11_2_combout [1];
wire	[3:0] \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout ;
//wire	\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [1];
//wire	\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [2];
//wire	\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [3];
wire	\i2c_device|lockb_cnt_dataa_11_combout ;
wire	\i2c_device|lockb_cnt_dataa_13_combout ;
wire	\i2c_device|lockb_cnt_dataa_14_combout ;
wire	\i2c_device|lockb_cnt_dataa_15_combout ;
wire	\i2c_device|lockb_cnt_dataa_16_combout ;
wire	\i2c_device|lockb_cnt_dataa_18_combout ;
wire	\i2c_device|lockb_cnt_dataa_1_combout ;
wire	\i2c_device|lockb_cnt_dataa_2_combout ;
wire	\i2c_device|lockb_cnt_dataa_3_combout ;
wire	\i2c_device|lockb_cnt_dataa_4_combout ;
wire	\i2c_device|lockb_cnt_dataa_5_combout ;
wire	\i2c_device|lockb_cnt_dataa_6_combout ;
wire	\i2c_device|lockb_cnt_dataa_7_combout ;
wire	[14:0] \i2c_device|lockb_cnt_dataa_8_1_combout ;
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [10];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [11];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [12];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [13];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [14];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [1];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [2];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [3];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [4];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [5];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [6];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [7];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [8];
//wire	\i2c_device|lockb_cnt_dataa_8_1_combout [9];
wire	[15:0] \i2c_device|lockb_cnt_dataa_8_1_cout ;
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [0];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [10];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [11];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [12];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [13];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [14];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [15];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [1];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [2];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [3];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [4];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [5];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [6];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [7];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [8];
//wire	\i2c_device|lockb_cnt_dataa_8_1_cout [9];
wire	\i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout ;
wire	\i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac_combout ;
wire	[3:0] \i2c_device|lockb_cnt_dataa_8_2_combout ;
//wire	\i2c_device|lockb_cnt_dataa_8_2_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_8_2_combout [1];
//wire	\i2c_device|lockb_cnt_dataa_8_2_combout [2];
//wire	\i2c_device|lockb_cnt_dataa_8_2_combout [3];
wire	[3:0] \i2c_device|lockb_cnt_dataa_8_3_combout ;
//wire	\i2c_device|lockb_cnt_dataa_8_3_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_8_3_combout [1];
//wire	\i2c_device|lockb_cnt_dataa_8_3_combout [2];
//wire	\i2c_device|lockb_cnt_dataa_8_3_combout [3];
wire	\i2c_device|lockb_cnt_dataa_8_combout ;
wire	[3:0] \i2c_device|lockb_cnt_dataa_9_2_combout ;
//wire	\i2c_device|lockb_cnt_dataa_9_2_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_9_2_combout [1];
//wire	\i2c_device|lockb_cnt_dataa_9_2_combout [2];
//wire	\i2c_device|lockb_cnt_dataa_9_2_combout [3];
wire	[22:0] \i2c_device|lockb_cnt_dataa_9_combout ;
//wire	\i2c_device|lockb_cnt_dataa_9_combout [0];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [10];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [11];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [12];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [13];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [14];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [15];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [16];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [17];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [18];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [19];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [1];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [20];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [21];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [22];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [2];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [3];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [4];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [5];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [6];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [7];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [8];
//wire	\i2c_device|lockb_cnt_dataa_9_combout [9];
wire	[2:0] \i2c_device|lockb_cnt_datab_11_combout ;
//wire	\i2c_device|lockb_cnt_datab_11_combout [0];
//wire	\i2c_device|lockb_cnt_datab_11_combout [1];
//wire	\i2c_device|lockb_cnt_datab_11_combout [2];
wire	[1:0] \i2c_device|lockb_rec ;
//wire	\i2c_device|lockb_rec [0];
//wire	\i2c_device|lockb_rec [1];
wire	\i2c_device|lockb_rec_A_0_1_Y ;
wire	\i2c_device|lockb_rec_A_0_Y ;
wire	\i2c_device|lockb_rec_A_0_Y_B_Y ;
wire	\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ;
wire	\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ;
wire	\i2c_device|lockb_rec_A_0_Y__SyncReset_X10005_Y10001_SIG ;
wire	\i2c_device|lockb_rec_d_0__feeder__LutOut ;
reg	\i2c_device|lockb_rec_d_0_q ;
wire	[2:0] \i2c_device|scl ;
//wire	\i2c_device|scl [0];
//wire	\i2c_device|scl [1];
//wire	\i2c_device|scl [2];
wire	\i2c_device|scl_asdata_0__feeder__LutOut ;
reg	\i2c_device|scl_asdata_0_q ;
wire	[1:0] \i2c_device|scl_asdata_0_q_dataa_combout ;
//wire	\i2c_device|scl_asdata_0_q_dataa_combout [0];
//wire	\i2c_device|scl_asdata_0_q_dataa_combout [1];
wire	[1:0] \i2c_device|scl_asdata_0_q_datad_1_combout ;
//wire	\i2c_device|scl_asdata_0_q_datad_1_combout [0];
//wire	\i2c_device|scl_asdata_0_q_datad_1_combout [1];
reg	\i2c_device|scl_d_0_q ;
wire	[3:0] \i2c_device|scl_d_0_q_datab_combout ;
//wire	\i2c_device|scl_d_0_q_datab_combout [0];
//wire	\i2c_device|scl_d_0_q_datab_combout [1];
//wire	\i2c_device|scl_d_0_q_datab_combout [2];
//wire	\i2c_device|scl_d_0_q_datab_combout [3];
wire	[2:0] \i2c_device|sda ;
//wire	\i2c_device|sda [0];
//wire	\i2c_device|sda [1];
//wire	\i2c_device|sda [2];
wire	\i2c_device|sda_A_0_1_Y_B_Y_B_Y ;
wire	\i2c_device|sda_A_0_1_Y_B_Y_B_Y__SyncLoad_X10011_Y10002_SIG ;
wire	\i2c_device|sda_A_0_Y ;
wire	\i2c_device|sda_d_0_10__feeder__LutOut ;
reg	\i2c_device|sda_d_0_10_q ;
wire	\i2c_device|sda_d_0_11__feeder__LutOut ;
reg	\i2c_device|sda_d_0_11_q ;
wire	\i2c_device|sda_d_0_11_q_A_Y_B_Y ;
wire	\i2c_device|sda_d_0_11_q_B_Y_A_Y ;
wire	\i2c_device|sda_d_0_12__feeder__LutOut ;
reg	\i2c_device|sda_d_0_12_q ;
wire	[3:0] \i2c_device|sda_d_0_12_q_dataa_combout ;
//wire	\i2c_device|sda_d_0_12_q_dataa_combout [0];
//wire	\i2c_device|sda_d_0_12_q_dataa_combout [1];
//wire	\i2c_device|sda_d_0_12_q_dataa_combout [2];
//wire	\i2c_device|sda_d_0_12_q_dataa_combout [3];
wire	\i2c_device|sda_d_0_1__feeder__LutOut ;
reg	\i2c_device|sda_d_0_1_q ;
wire	\i2c_device|sda_d_0_2__feeder__LutOut ;
reg	\i2c_device|sda_d_0_2_q ;
wire	\i2c_device|sda_d_0_3__feeder__LutOut ;
reg	\i2c_device|sda_d_0_3_q ;
wire	\i2c_device|sda_d_0_4__feeder__LutOut ;
reg	\i2c_device|sda_d_0_4_q ;
wire	\i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y ;
wire	[1:0] \i2c_device|sda_d_0_4_q_dataa_combout ;
//wire	\i2c_device|sda_d_0_4_q_dataa_combout [0];
//wire	\i2c_device|sda_d_0_4_q_dataa_combout [1];
wire	[3:0] \i2c_device|sda_d_0_4_q_datac_combout ;
//wire	\i2c_device|sda_d_0_4_q_datac_combout [0];
//wire	\i2c_device|sda_d_0_4_q_datac_combout [1];
//wire	\i2c_device|sda_d_0_4_q_datac_combout [2];
//wire	\i2c_device|sda_d_0_4_q_datac_combout [3];
wire	[1:0] \i2c_device|sda_d_0_4_q_datad_combout ;
//wire	\i2c_device|sda_d_0_4_q_datad_combout [0];
//wire	\i2c_device|sda_d_0_4_q_datad_combout [1];
wire	\i2c_device|sda_d_0_5__feeder__LutOut ;
reg	\i2c_device|sda_d_0_5_q ;
wire	[2:0] \i2c_device|sda_d_0_5_q_dataa_combout ;
//wire	\i2c_device|sda_d_0_5_q_dataa_combout [0];
//wire	\i2c_device|sda_d_0_5_q_dataa_combout [1];
//wire	\i2c_device|sda_d_0_5_q_dataa_combout [2];
wire	\i2c_device|sda_d_0_6__feeder__LutOut ;
reg	\i2c_device|sda_d_0_6_q ;
wire	\i2c_device|sda_d_0_7__feeder__LutOut ;
reg	\i2c_device|sda_d_0_7_q ;
wire	\i2c_device|sda_d_0_8__feeder__LutOut ;
reg	\i2c_device|sda_d_0_8_q ;
wire	\i2c_device|sda_d_0_9__feeder__LutOut ;
reg	\i2c_device|sda_d_0_9_q ;
wire	\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y ;
wire	\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ;
wire	\i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y ;
wire	[2:0] \i2c_device|sda_d_0_9_q_dataa_1_combout ;
//wire	\i2c_device|sda_d_0_9_q_dataa_1_combout [0];
//wire	\i2c_device|sda_d_0_9_q_dataa_1_combout [1];
//wire	\i2c_device|sda_d_0_9_q_dataa_1_combout [2];
wire	[2:0] \i2c_device|sda_d_0_9_q_dataa_3_combout ;
//wire	\i2c_device|sda_d_0_9_q_dataa_3_combout [0];
//wire	\i2c_device|sda_d_0_9_q_dataa_3_combout [1];
//wire	\i2c_device|sda_d_0_9_q_dataa_3_combout [2];
wire	[2:0] \i2c_device|sda_d_0_9_q_dataa_combout ;
//wire	\i2c_device|sda_d_0_9_q_dataa_combout [0];
//wire	\i2c_device|sda_d_0_9_q_dataa_combout [1];
//wire	\i2c_device|sda_d_0_9_q_dataa_combout [2];
reg	\i2c_device|sda_d_0_q ;
wire	[3:0] \i2c_device|sda_d_0_q_datab_combout ;
//wire	\i2c_device|sda_d_0_q_datab_combout [0];
//wire	\i2c_device|sda_d_0_q_datab_combout [1];
//wire	\i2c_device|sda_d_0_q_datab_combout [2];
//wire	\i2c_device|sda_d_0_q_datab_combout [3];
wire	[1:0] \i2c_device|start ;
//wire	\i2c_device|start [0];
//wire	\i2c_device|start [1];
wire	\i2c_device|start_A_0_Y ;
wire	\i2c_device|start_B_0_Y ;
wire	\i2c_device|start_B_0_Y_A_Y ;
wire	\i2c_device|start_B_0_Y__SyncLoad_X10010_Y10003_SIG ;
reg	\i2c_device|start_d_0_q ;
wire	[1:0] \i2c_device|stop ;
//wire	\i2c_device|stop [0];
//wire	\i2c_device|stop [1];
wire	\i2c_device|stop_A_0_Y ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10003_Y10003_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10002_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10003_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10008_Y10003_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10012_Y10003_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10015_Y10003_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10020_Y10001_SIG ;
wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10020_Y10003_SIG ;
wire	[1:0] \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout ;
//wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0];
//wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [1];
wire	[3:0] \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout ;
//wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [0];
//wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [1];
//wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [2];
//wire	\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [3];
wire	\i2c_device|stop_B_0_Y_B_Y_A_Y ;
wire	\i2c_device|stop_asdata_0__feeder__LutOut ;
reg	\i2c_device|stop_asdata_0_q ;
reg	[7:0] \i2c_device|write_value ;
//reg	\i2c_device|write_value [0];
//reg	\i2c_device|write_value [1];
//reg	\i2c_device|write_value [2];
wire	\i2c_device|write_value[2]_inv ;
//reg	\i2c_device|write_value [3];
//reg	\i2c_device|write_value [4];
//reg	\i2c_device|write_value [5];
//reg	\i2c_device|write_value [6];
//reg	\i2c_device|write_value [7];
wire	\i2c_device|write_value_d_3__feeder__LutOut ;
reg	\i2c_device|write_value_d_3_q ;
wire	[1:0] \i2c_device|write_value_d_3_q_datab_combout ;
//wire	\i2c_device|write_value_d_3_q_datab_combout [0];
//wire	\i2c_device|write_value_d_3_q_datab_combout [1];
reg	\i2c_device|write_value_d_4_q ;
wire	[2:0] \i2c_device|write_value_d_4_q_dataa_combout ;
//wire	\i2c_device|write_value_d_4_q_dataa_combout [0];
//wire	\i2c_device|write_value_d_4_q_dataa_combout [1];
//wire	\i2c_device|write_value_d_4_q_dataa_combout [2];
wire	[3:0] \i2c_device|write_value_dataa_1_combout ;
//wire	\i2c_device|write_value_dataa_1_combout [0];
//wire	\i2c_device|write_value_dataa_1_combout [1];
//wire	\i2c_device|write_value_dataa_1_combout [2];
//wire	\i2c_device|write_value_dataa_1_combout [3];
wire	[3:0] \i2c_device|write_value_dataa_2_combout ;
//wire	\i2c_device|write_value_dataa_2_combout [0];
//wire	\i2c_device|write_value_dataa_2_combout [1];
//wire	\i2c_device|write_value_dataa_2_combout [2];
//wire	\i2c_device|write_value_dataa_2_combout [3];
wire	[3:0] \i2c_device|write_value_dataa_2_combout_datad_3_combout ;
//wire	\i2c_device|write_value_dataa_2_combout_datad_3_combout [0];
//wire	\i2c_device|write_value_dataa_2_combout_datad_3_combout [1];
//wire	\i2c_device|write_value_dataa_2_combout_datad_3_combout [2];
//wire	\i2c_device|write_value_dataa_2_combout_datad_3_combout [3];
wire	\i2c_device|write_value_q_0__feeder__LutOut ;
wire	\i2c_device|write_value_q_1__feeder__LutOut ;
wire	\i2c_device|write_value_q_2__feeder__LutOut ;
wire	\i2c_device|write_value_q_3__feeder__LutOut ;
wire	\i2c_device|write_value_q_4__feeder__LutOut ;
wire	\i2c_device|write_value_q_5__feeder__LutOut ;
wire	\i2c_device|write_value_q_6__feeder__LutOut ;
wire	\i2c_device|write_value_q_7__feeder__LutOut ;
reg	\i2s_osd_select_1|BCLKD ;
wire	\i2s_osd_select_1|BCLKD_X10008_Y10002_INV_VCC ;
wire	\i2s_osd_select_1|BCLKD_X5017_Y5012_INV_VCC ;
wire	\i2s_osd_select_1|BCLKD_X5017_Y5012_SIG_VCC ;
wire	\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ;
wire	\i2s_osd_select_1|BCLKD_int ;
reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg__feeder__LutOut ;
reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg__feeder__LutOut ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|WS_INV_A_Y ;
reg	[8:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [1];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [2];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [3];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [4];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [5];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [6];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [7];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [8];
wire	[8:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [8];
wire	[9:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [8];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [9];
reg	[8:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [1];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [2];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [3];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [4];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [5];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [6];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [7];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [8];
wire	[8:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [8];
wire	[9:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [8];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [9];
reg	[2:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [1];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [2];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_1_Y_B_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_2_Y_A_1_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10014_Y10001_SIG ;
wire	[1:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1];
reg	[1:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1];
wire	[17:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [10];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [11];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [12];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [13];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [14];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [15];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [16];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [17];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [8];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [9];
wire	[17:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [10];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [11];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [12];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [13];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [14];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [15];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [16];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [17];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [8];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [9];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y ;
wire	[7:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [0];
reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [7];
reg	[7:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [1];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [2];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [3];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [4];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [5];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [6];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [7];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ;
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout [3];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_combout ;
wire	[8:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [8];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_1_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_2_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_3_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_4_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_5_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_6_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_7_combout ;
wire	[1:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout [1];
wire	[1:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [1];
wire	[2:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1_combout [2];
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout [3];
reg	[7:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [1];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [2];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [3];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [4];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [5];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [6];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [7];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_combout ;
wire	[8:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [8];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_1_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_2_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_3_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_4_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_5_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_6_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_7_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg__feeder__LutOut ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg__feeder__LutOut ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg__feeder__LutOut ;
reg	[11:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de ;
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [0];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [10];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [11];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [1];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [2];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [3];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [4];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [5];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [6];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [7];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [8];
//reg	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [9];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y ;
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout [3];
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [3];
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [3];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_combout ;
wire	[12:0] \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [10];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [11];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [12];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [3];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [4];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [5];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [6];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [7];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [8];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [9];
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_10_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_11_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_1_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_2_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_3_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_5_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_6_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_7_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_8_combout ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_9_combout ;
reg	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ;
reg	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_inv ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg__feeder__LutOut ;
reg	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW ;
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [3];
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg__feeder__LutOut ;
reg	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y ;
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10008_Y10002_INV ;
wire	[3:0] \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout ;
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [0];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [1];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [2];
//wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [3];
wire	\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg__feeder__LutOut ;
reg	\i2s_osd_select_2|BCLKD ;
wire	\i2s_osd_select_2|BCLKD_X10006_Y10002_INV_VCC ;
wire	\i2s_osd_select_2|BCLKD_X5019_Y5012_INV_VCC ;
wire	\i2s_osd_select_2|BCLKD_X5019_Y5012_SIG_VCC ;
wire	\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ;
wire	\i2s_osd_select_2|BCLKD_int ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg__feeder__LutOut ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg__feeder__LutOut ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|WS_INV_A_Y ;
reg	[8:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [1];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [2];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [3];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [4];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [5];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [6];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [7];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [8];
wire	[8:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [8];
wire	[9:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [8];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [9];
reg	[8:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [1];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [2];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [3];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [4];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [5];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [6];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [7];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [8];
wire	[8:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [8];
wire	[9:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [8];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [9];
reg	[2:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [1];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [2];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_1_Y_B_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_2_Y_A_1_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10015_Y10001_SIG ;
wire	[1:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1];
reg	[1:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1];
wire	[17:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [10];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [11];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [12];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [13];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [14];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [15];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [16];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [17];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [8];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [9];
wire	[17:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [10];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [11];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [12];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [13];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [14];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [15];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [16];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [17];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [8];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [9];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y ;
wire	[7:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [0];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg__feeder__LutOut ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ;
wire	[2:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1_combout [2];
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [7];
reg	[7:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [2];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [3];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [4];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [5];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [6];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [7];
wire	[2:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7_combout [2];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_combout ;
wire	[8:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [8];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_1_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_2_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_3_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_4_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_5_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_6_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_7_combout ;
wire	[1:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1_combout [1];
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [3];
wire	[1:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [1];
reg	[7:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [1];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [2];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [3];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [4];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [5];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [6];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [7];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_combout ;
wire	[8:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [8];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_1_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_2_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_3_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_4_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_5_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_6_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_7_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg__feeder__LutOut ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg__feeder__LutOut ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg__feeder__LutOut ;
reg	[11:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de ;
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [0];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [10];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [11];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [1];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [2];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [3];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [4];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [5];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [6];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [7];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [8];
//reg	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [9];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y ;
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout [3];
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [3];
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [3];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_combout ;
wire	[12:0] \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [10];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [11];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [12];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [3];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [4];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [5];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [6];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [7];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [8];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [9];
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_10_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_11_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_1_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_2_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_3_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_5_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_6_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_7_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_8_combout ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_9_combout ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg__feeder__LutOut ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW ;
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [3];
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg__feeder__LutOut ;
reg	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y ;
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10006_Y10002_SIG ;
wire	[3:0] \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout ;
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [0];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [1];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [2];
//wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [3];
wire	\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg__feeder__LutOut ;

wire vcc;
wire gnd;
assign vcc = 1'b1;
assign gnd = 1'b0;
wire unknown;
assign unknown = 1'bx;

alta_slice BCLK1_clk(
	.A(vcc),
	.B(\i2c_device|lockb_cnt [10]),
	.C(BCLK1_clk_1_q),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [2]),
	.Qin(BCLK1_clk_q),
	.Clk(BCLK1_i_o_X10004_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10004_Y10001_GND),
	.SyncReset(SyncReset_X10004_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10001_VCC),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [2]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [3]),
	.Q(BCLK1_clk_q));
defparam BCLK1_clk.coord_x = 19;
defparam BCLK1_clk.coord_y = 7;
defparam BCLK1_clk.coord_z = 2;
defparam BCLK1_clk.mask = 16'h96E8;
defparam BCLK1_clk.modeMux = 1'b1;
defparam BCLK1_clk.FeedbackMux = 1'b0;
defparam BCLK1_clk.ShiftMux = 1'b0;
defparam BCLK1_clk.BypassEn = 1'b1;
defparam BCLK1_clk.CarryEnb = 1'b0;

alta_slice BCLK1_clk_1(
	.A(BCLK1_clk_q),
	.B(I2S1_d_q),
	.C(I2S1_d_q),
	.D(I2S1_i_o[3]),
	.Cin(),
	.Qin(BCLK1_clk_1_q),
	.Clk(BCLK1_i_o_X10019_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10003_GND),
	.SyncReset(SyncReset_X10019_Y10003_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10003_VCC),
	.LutOut(BCLK1_clk_q_dataa_combout[0]),
	.Cout(),
	.Q(BCLK1_clk_1_q));
defparam BCLK1_clk_1.coord_x = 20;
defparam BCLK1_clk_1.coord_y = 7;
defparam BCLK1_clk_1.coord_z = 1;
defparam BCLK1_clk_1.mask = 16'h0100;
defparam BCLK1_clk_1.modeMux = 1'b0;
defparam BCLK1_clk_1.FeedbackMux = 1'b1;
defparam BCLK1_clk_1.ShiftMux = 1'b0;
defparam BCLK1_clk_1.BypassEn = 1'b1;
defparam BCLK1_clk_1.CarryEnb = 1'b1;

alta_rio BCLK1_i(
	.padio(BCLK1),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(BCLK1_i_o_int),
	.regout());
defparam BCLK1_i.coord_x = 0;
defparam BCLK1_i.coord_y = 4;
defparam BCLK1_i.coord_z = 2;
defparam BCLK1_i.IN_ASYNC_MODE = 1'b0;
defparam BCLK1_i.IN_SYNC_MODE = 1'b0;
defparam BCLK1_i.IN_POWERUP = 1'b0;
defparam BCLK1_i.OUT_REG_MODE = 1'b0;
defparam BCLK1_i.OUT_ASYNC_MODE = 1'b0;
defparam BCLK1_i.OUT_SYNC_MODE = 1'b0;
defparam BCLK1_i.OUT_POWERUP = 1'b0;
defparam BCLK1_i.OE_REG_MODE = 1'b0;
defparam BCLK1_i.OE_ASYNC_MODE = 1'b0;
defparam BCLK1_i.OE_SYNC_MODE = 1'b0;
defparam BCLK1_i.OE_POWERUP = 1'b0;
defparam BCLK1_i.CFG_TRI_INPUT = 1'b0;
defparam BCLK1_i.CFG_INPUT_EN = 1'b1;
defparam BCLK1_i.CFG_PULL_UP = 1'b0;
defparam BCLK1_i.CFG_SLR = 1'b0;
defparam BCLK1_i.CFG_OPEN_DRAIN = 1'b0;
defparam BCLK1_i.CFG_PDRCTRL = 4'b0100;
defparam BCLK1_i.CFG_KEEP = 2'b00;
defparam BCLK1_i.CFG_LVDS_OUT_EN = 1'b0;
defparam BCLK1_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam BCLK1_i.CFG_LVDS_IREF = 10'b0110000000;
defparam BCLK1_i.CFG_LVDS_IN_EN = 1'b0;
defparam BCLK1_i.DPCLK_DELAY = 4'b0000;
defparam BCLK1_i.OUT_DELAY = 1'b0;
defparam BCLK1_i.IN_DATA_DELAY = 3'b000;
defparam BCLK1_i.IN_REG_DELAY = 3'b000;

alta_io_gclk \BCLK1_i|o~ALTA_GCLK (
	.inclk(BCLK1_i_o_int),
	.outclk(BCLK1_i_o));
defparam \BCLK1_i|o~ALTA_GCLK .coord_x = 22;
defparam \BCLK1_i|o~ALTA_GCLK .coord_y = 4;
defparam \BCLK1_i|o~ALTA_GCLK .coord_z = 1;

alta_slice BCLK2_clk(
	.A(vcc),
	.B(\i2c_device|lockb_cnt [8]),
	.C(BCLK2_clk_1_q),
	.D(vcc),
	.Cin(),
	.Qin(BCLK2_clk_q),
	.Clk(BCLK2_i_o_X10004_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10004_Y10001_GND),
	.SyncReset(SyncReset_X10004_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10001_VCC),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [0]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [1]),
	.Q(BCLK2_clk_q));
defparam BCLK2_clk.coord_x = 19;
defparam BCLK2_clk.coord_y = 7;
defparam BCLK2_clk.coord_z = 0;
defparam BCLK2_clk.mask = 16'h66DD;
defparam BCLK2_clk.modeMux = 1'b1;
defparam BCLK2_clk.FeedbackMux = 1'b0;
defparam BCLK2_clk.ShiftMux = 1'b0;
defparam BCLK2_clk.BypassEn = 1'b1;
defparam BCLK2_clk.CarryEnb = 1'b0;

alta_slice BCLK2_clk_1(
	.A(BCLK2_clk_q),
	.B(I2S2_d_q),
	.C(I2S2_d_q),
	.D(I2S2_i_o[3]),
	.Cin(),
	.Qin(BCLK2_clk_1_q),
	.Clk(BCLK2_i_o_X10019_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10003_GND),
	.SyncReset(SyncReset_X10019_Y10003_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10003_VCC),
	.LutOut(BCLK2_clk_q_dataa_combout[0]),
	.Cout(),
	.Q(BCLK2_clk_1_q));
defparam BCLK2_clk_1.coord_x = 20;
defparam BCLK2_clk_1.coord_y = 7;
defparam BCLK2_clk_1.coord_z = 2;
defparam BCLK2_clk_1.mask = 16'h0100;
defparam BCLK2_clk_1.modeMux = 1'b0;
defparam BCLK2_clk_1.FeedbackMux = 1'b1;
defparam BCLK2_clk_1.ShiftMux = 1'b0;
defparam BCLK2_clk_1.BypassEn = 1'b1;
defparam BCLK2_clk_1.CarryEnb = 1'b1;

alta_rio BCLK2_i(
	.padio(BCLK2),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(BCLK2_i_o),
	.regout());
defparam BCLK2_i.coord_x = 18;
defparam BCLK2_i.coord_y = 13;
defparam BCLK2_i.coord_z = 3;
defparam BCLK2_i.IN_ASYNC_MODE = 1'b0;
defparam BCLK2_i.IN_SYNC_MODE = 1'b0;
defparam BCLK2_i.IN_POWERUP = 1'b0;
defparam BCLK2_i.OUT_REG_MODE = 1'b0;
defparam BCLK2_i.OUT_ASYNC_MODE = 1'b0;
defparam BCLK2_i.OUT_SYNC_MODE = 1'b0;
defparam BCLK2_i.OUT_POWERUP = 1'b0;
defparam BCLK2_i.OE_REG_MODE = 1'b0;
defparam BCLK2_i.OE_ASYNC_MODE = 1'b0;
defparam BCLK2_i.OE_SYNC_MODE = 1'b0;
defparam BCLK2_i.OE_POWERUP = 1'b0;
defparam BCLK2_i.CFG_TRI_INPUT = 1'b0;
defparam BCLK2_i.CFG_INPUT_EN = 1'b1;
defparam BCLK2_i.CFG_PULL_UP = 1'b0;
defparam BCLK2_i.CFG_SLR = 1'b0;
defparam BCLK2_i.CFG_OPEN_DRAIN = 1'b0;
defparam BCLK2_i.CFG_PDRCTRL = 4'b0100;
defparam BCLK2_i.CFG_KEEP = 2'b00;
defparam BCLK2_i.CFG_LVDS_OUT_EN = 1'b0;
defparam BCLK2_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam BCLK2_i.CFG_LVDS_IREF = 10'b0110000000;
defparam BCLK2_i.CFG_LVDS_IN_EN = 1'b0;
defparam BCLK2_i.DPCLK_DELAY = 4'b0000;
defparam BCLK2_i.OUT_DELAY = 1'b0;
defparam BCLK2_i.IN_DATA_DELAY = 3'b000;
defparam BCLK2_i.IN_REG_DELAY = 3'b000;

alta_rio BPO1_i(
	.padio(BPO1),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(CO1_i_o[0]),
	.regout());
defparam BPO1_i.coord_x = 0;
defparam BPO1_i.coord_y = 1;
defparam BPO1_i.coord_z = 3;
defparam BPO1_i.IN_ASYNC_MODE = 1'b0;
defparam BPO1_i.IN_SYNC_MODE = 1'b0;
defparam BPO1_i.IN_POWERUP = 1'b0;
defparam BPO1_i.OUT_REG_MODE = 1'b0;
defparam BPO1_i.OUT_ASYNC_MODE = 1'b0;
defparam BPO1_i.OUT_SYNC_MODE = 1'b0;
defparam BPO1_i.OUT_POWERUP = 1'b0;
defparam BPO1_i.OE_REG_MODE = 1'b0;
defparam BPO1_i.OE_ASYNC_MODE = 1'b0;
defparam BPO1_i.OE_SYNC_MODE = 1'b0;
defparam BPO1_i.OE_POWERUP = 1'b0;
defparam BPO1_i.CFG_TRI_INPUT = 1'b0;
defparam BPO1_i.CFG_INPUT_EN = 1'b1;
defparam BPO1_i.CFG_PULL_UP = 1'b0;
defparam BPO1_i.CFG_SLR = 1'b0;
defparam BPO1_i.CFG_OPEN_DRAIN = 1'b0;
defparam BPO1_i.CFG_PDRCTRL = 4'b0100;
defparam BPO1_i.CFG_KEEP = 2'b00;
defparam BPO1_i.CFG_LVDS_OUT_EN = 1'b0;
defparam BPO1_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam BPO1_i.CFG_LVDS_IREF = 10'b0110000000;
defparam BPO1_i.CFG_LVDS_IN_EN = 1'b0;
defparam BPO1_i.DPCLK_DELAY = 4'b0000;
defparam BPO1_i.OUT_DELAY = 1'b0;
defparam BPO1_i.IN_DATA_DELAY = 3'b000;
defparam BPO1_i.IN_REG_DELAY = 3'b000;

alta_rio BPO2_i(
	.padio(BPO2),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(CO2_i_o[0]),
	.regout());
defparam BPO2_i.coord_x = 1;
defparam BPO2_i.coord_y = 0;
defparam BPO2_i.coord_z = 1;
defparam BPO2_i.IN_ASYNC_MODE = 1'b0;
defparam BPO2_i.IN_SYNC_MODE = 1'b0;
defparam BPO2_i.IN_POWERUP = 1'b0;
defparam BPO2_i.OUT_REG_MODE = 1'b0;
defparam BPO2_i.OUT_ASYNC_MODE = 1'b0;
defparam BPO2_i.OUT_SYNC_MODE = 1'b0;
defparam BPO2_i.OUT_POWERUP = 1'b0;
defparam BPO2_i.OE_REG_MODE = 1'b0;
defparam BPO2_i.OE_ASYNC_MODE = 1'b0;
defparam BPO2_i.OE_SYNC_MODE = 1'b0;
defparam BPO2_i.OE_POWERUP = 1'b0;
defparam BPO2_i.CFG_TRI_INPUT = 1'b0;
defparam BPO2_i.CFG_INPUT_EN = 1'b1;
defparam BPO2_i.CFG_PULL_UP = 1'b0;
defparam BPO2_i.CFG_SLR = 1'b0;
defparam BPO2_i.CFG_OPEN_DRAIN = 1'b0;
defparam BPO2_i.CFG_PDRCTRL = 4'b0100;
defparam BPO2_i.CFG_KEEP = 2'b00;
defparam BPO2_i.CFG_LVDS_OUT_EN = 1'b0;
defparam BPO2_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam BPO2_i.CFG_LVDS_IREF = 10'b0110000000;
defparam BPO2_i.CFG_LVDS_IN_EN = 1'b0;
defparam BPO2_i.DPCLK_DELAY = 4'b0000;
defparam BPO2_i.OUT_DELAY = 1'b0;
defparam BPO2_i.IN_DATA_DELAY = 3'b000;
defparam BPO2_i.IN_REG_DELAY = 3'b000;

alta_rio BRIN_o(
	.padio(BRIN),
	.datain(gnd),
	.oe(\i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam BRIN_o.coord_x = 22;
defparam BRIN_o.coord_y = 3;
defparam BRIN_o.coord_z = 3;
defparam BRIN_o.IN_ASYNC_MODE = 1'b0;
defparam BRIN_o.IN_SYNC_MODE = 1'b0;
defparam BRIN_o.IN_POWERUP = 1'b0;
defparam BRIN_o.OUT_REG_MODE = 1'b0;
defparam BRIN_o.OUT_ASYNC_MODE = 1'b0;
defparam BRIN_o.OUT_SYNC_MODE = 1'b0;
defparam BRIN_o.OUT_POWERUP = 1'b0;
defparam BRIN_o.OE_REG_MODE = 1'b0;
defparam BRIN_o.OE_ASYNC_MODE = 1'b0;
defparam BRIN_o.OE_SYNC_MODE = 1'b0;
defparam BRIN_o.OE_POWERUP = 1'b0;
defparam BRIN_o.CFG_TRI_INPUT = 1'b0;
defparam BRIN_o.CFG_INPUT_EN = 1'b0;
defparam BRIN_o.CFG_PULL_UP = 1'b0;
defparam BRIN_o.CFG_SLR = 1'b0;
defparam BRIN_o.CFG_OPEN_DRAIN = 1'b0;
defparam BRIN_o.CFG_PDRCTRL = 4'b0100;
defparam BRIN_o.CFG_KEEP = 2'b00;
defparam BRIN_o.CFG_LVDS_OUT_EN = 1'b0;
defparam BRIN_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam BRIN_o.CFG_LVDS_IREF = 10'b0110000000;
defparam BRIN_o.CFG_LVDS_IN_EN = 1'b0;
defparam BRIN_o.DPCLK_DELAY = 4'b0000;
defparam BRIN_o.OUT_DELAY = 1'b0;
defparam BRIN_o.IN_DATA_DELAY = 3'b000;
defparam BRIN_o.IN_REG_DELAY = 3'b000;

alta_rio BRIP_o(
	.padio(BRIP),
	.datain(gnd),
	.oe(\i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam BRIP_o.coord_x = 22;
defparam BRIP_o.coord_y = 3;
defparam BRIP_o.coord_z = 0;
defparam BRIP_o.IN_ASYNC_MODE = 1'b0;
defparam BRIP_o.IN_SYNC_MODE = 1'b0;
defparam BRIP_o.IN_POWERUP = 1'b0;
defparam BRIP_o.OUT_REG_MODE = 1'b0;
defparam BRIP_o.OUT_ASYNC_MODE = 1'b0;
defparam BRIP_o.OUT_SYNC_MODE = 1'b0;
defparam BRIP_o.OUT_POWERUP = 1'b0;
defparam BRIP_o.OE_REG_MODE = 1'b0;
defparam BRIP_o.OE_ASYNC_MODE = 1'b0;
defparam BRIP_o.OE_SYNC_MODE = 1'b0;
defparam BRIP_o.OE_POWERUP = 1'b0;
defparam BRIP_o.CFG_TRI_INPUT = 1'b0;
defparam BRIP_o.CFG_INPUT_EN = 1'b0;
defparam BRIP_o.CFG_PULL_UP = 1'b0;
defparam BRIP_o.CFG_SLR = 1'b0;
defparam BRIP_o.CFG_OPEN_DRAIN = 1'b0;
defparam BRIP_o.CFG_PDRCTRL = 4'b0100;
defparam BRIP_o.CFG_KEEP = 2'b00;
defparam BRIP_o.CFG_LVDS_OUT_EN = 1'b0;
defparam BRIP_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam BRIP_o.CFG_LVDS_IREF = 10'b0110000000;
defparam BRIP_o.CFG_LVDS_IN_EN = 1'b0;
defparam BRIP_o.DPCLK_DELAY = 4'b0000;
defparam BRIP_o.OUT_DELAY = 1'b0;
defparam BRIP_o.IN_DATA_DELAY = 3'b000;
defparam BRIP_o.IN_REG_DELAY = 3'b000;

alta_rio CHRG_i(
	.padio(CHRG),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(CHRG_i_o[3]),
	.regout());
defparam CHRG_i.coord_x = 0;
defparam CHRG_i.coord_y = 2;
defparam CHRG_i.coord_z = 5;
defparam CHRG_i.IN_ASYNC_MODE = 1'b0;
defparam CHRG_i.IN_SYNC_MODE = 1'b0;
defparam CHRG_i.IN_POWERUP = 1'b0;
defparam CHRG_i.OUT_REG_MODE = 1'b0;
defparam CHRG_i.OUT_ASYNC_MODE = 1'b0;
defparam CHRG_i.OUT_SYNC_MODE = 1'b0;
defparam CHRG_i.OUT_POWERUP = 1'b0;
defparam CHRG_i.OE_REG_MODE = 1'b0;
defparam CHRG_i.OE_ASYNC_MODE = 1'b0;
defparam CHRG_i.OE_SYNC_MODE = 1'b0;
defparam CHRG_i.OE_POWERUP = 1'b0;
defparam CHRG_i.CFG_TRI_INPUT = 1'b0;
defparam CHRG_i.CFG_INPUT_EN = 1'b1;
defparam CHRG_i.CFG_PULL_UP = 1'b0;
defparam CHRG_i.CFG_SLR = 1'b0;
defparam CHRG_i.CFG_OPEN_DRAIN = 1'b0;
defparam CHRG_i.CFG_PDRCTRL = 4'b0100;
defparam CHRG_i.CFG_KEEP = 2'b00;
defparam CHRG_i.CFG_LVDS_OUT_EN = 1'b0;
defparam CHRG_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam CHRG_i.CFG_LVDS_IREF = 10'b0110000000;
defparam CHRG_i.CFG_LVDS_IN_EN = 1'b0;
defparam CHRG_i.DPCLK_DELAY = 4'b0000;
defparam CHRG_i.OUT_DELAY = 1'b0;
defparam CHRG_i.IN_DATA_DELAY = 3'b000;
defparam CHRG_i.IN_REG_DELAY = 3'b000;

alta_slice CLKOSC_clk(
	.A(),
	.B(),
	.C(),
	.D(\i2c_device|write_value [2]),
	.Cin(),
	.Qin(CLKOSC_clk_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10019_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10019_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value[2]_inv ),
	.Cout(),
	.Q(CLKOSC_clk_q));
defparam CLKOSC_clk.coord_x = 15;
defparam CLKOSC_clk.coord_y = 1;
defparam CLKOSC_clk.coord_z = 13;
defparam CLKOSC_clk.mask = 16'h00FF;
defparam CLKOSC_clk.modeMux = 1'b0;
defparam CLKOSC_clk.FeedbackMux = 1'b0;
defparam CLKOSC_clk.ShiftMux = 1'b0;
defparam CLKOSC_clk.BypassEn = 1'b0;
defparam CLKOSC_clk.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1(
	.A(CLKOSC_clk_2_q_A_3_Y_dataa_combout[2]),
	.B(CLKOSC_clk_2_q_A_3_Y_dataa_combout[0]),
	.C(vcc),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(CLKOSC_clk_1_q),
	.Clk(CLKOSC_i_o_X10005_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_A_1_Y_A_Y),
	.Cout(),
	.Q(CLKOSC_clk_1_q));
defparam CLKOSC_clk_1.coord_x = 11;
defparam CLKOSC_clk_1.coord_y = 3;
defparam CLKOSC_clk_1.coord_z = 11;
defparam CLKOSC_clk_1.mask = 16'h70FA;
defparam CLKOSC_clk_1.modeMux = 1'b0;
defparam CLKOSC_clk_1.FeedbackMux = 1'b1;
defparam CLKOSC_clk_1.ShiftMux = 1'b0;
defparam CLKOSC_clk_1.BypassEn = 1'b0;
defparam CLKOSC_clk_1.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_10(
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.B(CLKOSC_clk_9_q_dataa_combout_datac_2_combout[3]),
	.C(vcc),
	.D(CLKOSC_clk_9_q_dataa_combout_datac_2_combout[1]),
	.Cin(),
	.Qin(CLKOSC_clk_10_q),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_10_q_A_Y_B_Y),
	.Cout(),
	.Q(CLKOSC_clk_10_q));
defparam CLKOSC_clk_10.coord_x = 10;
defparam CLKOSC_clk_10.coord_y = 4;
defparam CLKOSC_clk_10.coord_z = 10;
defparam CLKOSC_clk_10.mask = 16'h1054;
defparam CLKOSC_clk_10.modeMux = 1'b0;
defparam CLKOSC_clk_10.FeedbackMux = 1'b1;
defparam CLKOSC_clk_10.ShiftMux = 1'b0;
defparam CLKOSC_clk_10.BypassEn = 1'b0;
defparam CLKOSC_clk_10.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_10_q_dataa(
	.A(vcc),
	.B(vcc),
	.C(CLKOSC_clk_10_q),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_9_q_dataa_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_10_q_dataa.coord_x = 11;
defparam CLKOSC_clk_10_q_dataa.coord_y = 4;
defparam CLKOSC_clk_10_q_dataa.coord_z = 3;
defparam CLKOSC_clk_10_q_dataa.mask = 16'h0F00;
defparam CLKOSC_clk_10_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_10_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_10_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_10_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_10_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_11(
	.A(\i2c_device|sda_d_0_4_q_datad_combout [0]),
	.B(vcc),
	.C(vcc),
	.D(CLKOSC_clk_2_q_A_3_Y_dataa_1_combout[2]),
	.Cin(),
	.Qin(CLKOSC_clk_11_q),
	.Clk(CLKOSC_i_o_X10005_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_11_q_A_Y_A_Y),
	.Cout(),
	.Q(CLKOSC_clk_11_q));
defparam CLKOSC_clk_11.coord_x = 11;
defparam CLKOSC_clk_11.coord_y = 3;
defparam CLKOSC_clk_11.coord_z = 0;
defparam CLKOSC_clk_11.mask = 16'hFF50;
defparam CLKOSC_clk_11.modeMux = 1'b0;
defparam CLKOSC_clk_11.FeedbackMux = 1'b1;
defparam CLKOSC_clk_11.ShiftMux = 1'b0;
defparam CLKOSC_clk_11.BypassEn = 1'b0;
defparam CLKOSC_clk_11.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_11_q_dataa(
	.A(CLKOSC_clk_2_q_dataa_combout[2]),
	.B(CLKOSC_clk_2_q_dataa_combout[1]),
	.C(CLKOSC_clk_11_q),
	.D(CLKOSC_clk_2_q_dataa_combout[3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_11_q_dataa_combout[1]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_11_q_dataa.coord_x = 11;
defparam CLKOSC_clk_11_q_dataa.coord_y = 3;
defparam CLKOSC_clk_11_q_dataa.coord_z = 15;
defparam CLKOSC_clk_11_q_dataa.mask = 16'h005D;
defparam CLKOSC_clk_11_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_11_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_11_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_11_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_11_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_11_q_dataa_combout_combout_2(
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|i2c_state_dataa_0_combout [0]),
	.D(\i2c_device|i2c_state_dataa_0_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_11_q_dataa_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.coord_x = 11;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.coord_y = 3;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.coord_z = 12;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.mask = 16'h000F;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.modeMux = 1'b0;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.FeedbackMux = 1'b0;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.ShiftMux = 1'b0;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.BypassEn = 1'b0;
defparam CLKOSC_clk_11_q_dataa_combout_combout_2.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_12(
	.A(CSEL2_q_1[1]),
	.B(\i2c_device|OFFSET_SECONDARY [7]),
	.C(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.D(\i2c_device|OFFSET_PRIMARY [7]),
	.Cin(),
	.Qin(CLKOSC_clk_12_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(\i2c_device|OFFSET_PRIMARY_A_7_Y_B_Y ),
	.Cout(),
	.Q(CLKOSC_clk_12_q));
defparam CLKOSC_clk_12.coord_x = 16;
defparam CLKOSC_clk_12.coord_y = 2;
defparam CLKOSC_clk_12.coord_z = 2;
defparam CLKOSC_clk_12.mask = 16'hEAC0;
defparam CLKOSC_clk_12.modeMux = 1'b0;
defparam CLKOSC_clk_12.FeedbackMux = 1'b0;
defparam CLKOSC_clk_12.ShiftMux = 1'b0;
defparam CLKOSC_clk_12.BypassEn = 1'b1;
defparam CLKOSC_clk_12.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_12_q_dataa(
	.A(CLKOSC_clk_12_q),
	.B(CLKOSC_clk_14_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_datab_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_12_q_dataa.coord_x = 16;
defparam CLKOSC_clk_12_q_dataa.coord_y = 2;
defparam CLKOSC_clk_12_q_dataa.coord_z = 8;
defparam CLKOSC_clk_12_q_dataa.mask = 16'hFF35;
defparam CLKOSC_clk_12_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_12_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_12_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_12_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_12_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_13(
	.A(CSEL2_q_1[1]),
	.B(\i2c_device|OFFSET_PRIMARY [6]),
	.C(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.D(\i2c_device|OFFSET_SECONDARY [6]),
	.Cin(),
	.Qin(CLKOSC_clk_13_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(\i2c_device|OFFSET_PRIMARY_A_6_Y_B_Y ),
	.Cout(),
	.Q(CLKOSC_clk_13_q));
defparam CLKOSC_clk_13.coord_x = 16;
defparam CLKOSC_clk_13.coord_y = 2;
defparam CLKOSC_clk_13.coord_z = 14;
defparam CLKOSC_clk_13.mask = 16'hF888;
defparam CLKOSC_clk_13.modeMux = 1'b0;
defparam CLKOSC_clk_13.FeedbackMux = 1'b0;
defparam CLKOSC_clk_13.ShiftMux = 1'b0;
defparam CLKOSC_clk_13.BypassEn = 1'b1;
defparam CLKOSC_clk_13.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_13_q_dataa(
	.A(CLKOSC_clk_13_q),
	.B(CLKOSC_clk_15_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_datab_combout[1]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_13_q_dataa.coord_x = 16;
defparam CLKOSC_clk_13_q_dataa.coord_y = 2;
defparam CLKOSC_clk_13_q_dataa.coord_z = 3;
defparam CLKOSC_clk_13_q_dataa.mask = 16'h35FF;
defparam CLKOSC_clk_13_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_13_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_13_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_13_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_13_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_14(
	.A(\i2c_device|OFFSET_SECONDARY [5]),
	.B(\i2c_device|OFFSET_PRIMARY [5]),
	.C(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.D(CSEL2_q_1[1]),
	.Cin(),
	.Qin(CLKOSC_clk_14_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(\i2c_device|OFFSET_PRIMARY_A_5_Y_B_Y ),
	.Cout(),
	.Q(CLKOSC_clk_14_q));
defparam CLKOSC_clk_14.coord_x = 16;
defparam CLKOSC_clk_14.coord_y = 2;
defparam CLKOSC_clk_14.coord_z = 9;
defparam CLKOSC_clk_14.mask = 16'hECA0;
defparam CLKOSC_clk_14.modeMux = 1'b0;
defparam CLKOSC_clk_14.FeedbackMux = 1'b0;
defparam CLKOSC_clk_14.ShiftMux = 1'b0;
defparam CLKOSC_clk_14.BypassEn = 1'b1;
defparam CLKOSC_clk_14.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_15(
	.A(vcc),
	.B(CSEL2_q_1[1]),
	.C(\i2c_device|write_value_d_4_q_dataa_combout [2]),
	.D(\i2c_device|OFFSET_PRIMARY [4]),
	.Cin(),
	.Qin(CLKOSC_clk_15_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(\i2c_device|OFFSET_PRIMARY_A_4_Y_A_Y ),
	.Cout(),
	.Q(CLKOSC_clk_15_q));
defparam CLKOSC_clk_15.coord_x = 16;
defparam CLKOSC_clk_15.coord_y = 2;
defparam CLKOSC_clk_15.coord_z = 11;
defparam CLKOSC_clk_15.mask = 16'hCF0F;
defparam CLKOSC_clk_15.modeMux = 1'b0;
defparam CLKOSC_clk_15.FeedbackMux = 1'b0;
defparam CLKOSC_clk_15.ShiftMux = 1'b0;
defparam CLKOSC_clk_15.BypassEn = 1'b1;
defparam CLKOSC_clk_15.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_16(
	.A(vcc),
	.B(\i2c_device|write_value_d_3_q_datab_combout [0]),
	.C(vcc),
	.D(\i2c_device|write_value_d_3_q_datab_combout [1]),
	.Cin(),
	.Qin(CLKOSC_clk_16_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(\i2c_device|OFFSET_PRIMARY_A_3_Y_B_Y_B_Y ),
	.Cout(),
	.Q(CLKOSC_clk_16_q));
defparam CLKOSC_clk_16.coord_x = 16;
defparam CLKOSC_clk_16.coord_y = 2;
defparam CLKOSC_clk_16.coord_z = 0;
defparam CLKOSC_clk_16.mask = 16'h33FF;
defparam CLKOSC_clk_16.modeMux = 1'b0;
defparam CLKOSC_clk_16.FeedbackMux = 1'b0;
defparam CLKOSC_clk_16.ShiftMux = 1'b0;
defparam CLKOSC_clk_16.BypassEn = 1'b1;
defparam CLKOSC_clk_16.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_16_q_dataa(
	.A(CLKOSC_clk_16_q),
	.B(CLKOSC_clk_18_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_16_q_dataa_combout[0]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_16_q_dataa.coord_x = 16;
defparam CLKOSC_clk_16_q_dataa.coord_y = 2;
defparam CLKOSC_clk_16_q_dataa.coord_z = 6;
defparam CLKOSC_clk_16_q_dataa.mask = 16'hFF35;
defparam CLKOSC_clk_16_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_16_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_16_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_16_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_16_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_17(
	.A(CLKOSC_clk_q_dataa_combout[1]),
	.B(vcc),
	.C(vcc),
	.D(CLKOSC_clk_q_dataa_combout[0]),
	.Cin(),
	.Qin(CLKOSC_clk_17_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(\i2c_device|OFFSET_PRIMARY_A_2_Y_B_Y_B_Y ),
	.Cout(),
	.Q(CLKOSC_clk_17_q));
defparam CLKOSC_clk_17.coord_x = 16;
defparam CLKOSC_clk_17.coord_y = 2;
defparam CLKOSC_clk_17.coord_z = 5;
defparam CLKOSC_clk_17.mask = 16'h55FF;
defparam CLKOSC_clk_17.modeMux = 1'b0;
defparam CLKOSC_clk_17.FeedbackMux = 1'b0;
defparam CLKOSC_clk_17.ShiftMux = 1'b0;
defparam CLKOSC_clk_17.BypassEn = 1'b1;
defparam CLKOSC_clk_17.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_17_q_dataa(
	.A(CLKOSC_clk_17_q),
	.B(CLKOSC_clk_19_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_16_q_dataa_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_17_q_dataa.coord_x = 16;
defparam CLKOSC_clk_17_q_dataa.coord_y = 2;
defparam CLKOSC_clk_17_q_dataa.coord_z = 4;
defparam CLKOSC_clk_17_q_dataa.mask = 16'h35FF;
defparam CLKOSC_clk_17_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_17_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_17_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_17_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_17_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_18(
	.A(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [3]),
	.B(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [0]),
	.C(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [2]),
	.D(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.Cin(),
	.Qin(CLKOSC_clk_18_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(CSEL1_A_Y_A_Y_B_Y),
	.Cout(),
	.Q(CLKOSC_clk_18_q));
defparam CLKOSC_clk_18.coord_x = 16;
defparam CLKOSC_clk_18.coord_y = 2;
defparam CLKOSC_clk_18.coord_z = 13;
defparam CLKOSC_clk_18.mask = 16'h7F5F;
defparam CLKOSC_clk_18.modeMux = 1'b0;
defparam CLKOSC_clk_18.FeedbackMux = 1'b0;
defparam CLKOSC_clk_18.ShiftMux = 1'b0;
defparam CLKOSC_clk_18.BypassEn = 1'b1;
defparam CLKOSC_clk_18.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_19(
	.A(\i2c_device|sda_d_0_12_q_dataa_combout [3]),
	.B(\i2c_device|sda_d_0_12_q_dataa_combout [0]),
	.C(\i2c_device|sda_d_0_12_q_dataa_combout [2]),
	.D(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.Cin(),
	.Qin(CLKOSC_clk_19_q),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10002_GND),
	.LutOut(CSEL2_A_Y_B_Y_A_Y),
	.Cout(),
	.Q(CLKOSC_clk_19_q));
defparam CLKOSC_clk_19.coord_x = 16;
defparam CLKOSC_clk_19.coord_y = 2;
defparam CLKOSC_clk_19.coord_z = 1;
defparam CLKOSC_clk_19.mask = 16'h7F5F;
defparam CLKOSC_clk_19.modeMux = 1'b0;
defparam CLKOSC_clk_19.FeedbackMux = 1'b0;
defparam CLKOSC_clk_19.ShiftMux = 1'b0;
defparam CLKOSC_clk_19.BypassEn = 1'b1;
defparam CLKOSC_clk_19.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_dataa(
	.A(\i2c_device|bit_pos_dataa_1_combout_datab_combout [2]),
	.B(\i2c_device|bit_pos_dataa_1_combout_datab_combout [3]),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_1_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_dataa_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_dataa.coord_x = 10;
defparam CLKOSC_clk_1_q_dataa.coord_y = 2;
defparam CLKOSC_clk_1_q_dataa.coord_z = 15;
defparam CLKOSC_clk_1_q_dataa.mask = 16'hEE2E;
defparam CLKOSC_clk_1_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_dataa_1(
	.A(\i2c_device|bit_pos_dataa_2_combout_datab_combout [2]),
	.B(\i2c_device|bit_pos_dataa_1_combout_datab_combout [3]),
	.C(CLKOSC_clk_1_q),
	.D(CLKOSC_clk_2_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_dataa_1_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_dataa_1.coord_x = 11;
defparam CLKOSC_clk_1_q_dataa_1.coord_y = 2;
defparam CLKOSC_clk_1_q_dataa_1.coord_z = 1;
defparam CLKOSC_clk_1_q_dataa_1.mask = 16'hE2EE;
defparam CLKOSC_clk_1_q_dataa_1.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_1.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_1.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_1.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_dataa_1.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_dataa_2(
	.A(CLKOSC_clk_4_q),
	.B(\i2c_device|bit_pos_dataa_1_combout_datab_combout [3]),
	.C(\i2c_device|bit_pos_dataa_0_combout_datab_combout [2]),
	.D(CLKOSC_clk_1_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_dataa_2_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_dataa_2.coord_x = 10;
defparam CLKOSC_clk_1_q_dataa_2.coord_y = 2;
defparam CLKOSC_clk_1_q_dataa_2.coord_z = 11;
defparam CLKOSC_clk_1_q_dataa_2.mask = 16'hFC74;
defparam CLKOSC_clk_1_q_dataa_2.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_2.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_2.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_2.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_dataa_2.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_dataa_3(
	.A(\i2c_device|i2c_state_dataa_0_combout [0]),
	.B(vcc),
	.C(CLKOSC_clk_1_q),
	.D(CLKOSC_clk_9_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_dataa_3_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_dataa_3.coord_x = 10;
defparam CLKOSC_clk_1_q_dataa_3.coord_y = 3;
defparam CLKOSC_clk_1_q_dataa_3.coord_z = 14;
defparam CLKOSC_clk_1_q_dataa_3.mask = 16'h0A00;
defparam CLKOSC_clk_1_q_dataa_3.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_3.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_3.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_dataa_3.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_dataa_3.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_datab(
	.A(vcc),
	.B(vcc),
	.C(CLKOSC_clk_1_q),
	.D(\i2c_device|sda_d_0_4_q_dataa_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_dataa_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_datab.coord_x = 10;
defparam CLKOSC_clk_1_q_datab.coord_y = 2;
defparam CLKOSC_clk_1_q_datab.coord_z = 12;
defparam CLKOSC_clk_1_q_datab.mask = 16'h00F0;
defparam CLKOSC_clk_1_q_datab.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_datab.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_datab.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_datab.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_datab.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_datab_1(
	.A(vcc),
	.B(vcc),
	.C(CLKOSC_clk_1_q),
	.D(\i2c_device|sda_d_0_4_q_dataa_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_datab_1_combout[1]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_datab_1.coord_x = 10;
defparam CLKOSC_clk_1_q_datab_1.coord_y = 3;
defparam CLKOSC_clk_1_q_datab_1.coord_z = 3;
defparam CLKOSC_clk_1_q_datab_1.mask = 16'h000F;
defparam CLKOSC_clk_1_q_datab_1.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_datab_1.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_datab_1.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_datab_1.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_datab_1.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_1_q_datab_1_combout_datab_1(
	.A(\i2c_device|i2c_state_datac_0_1_combout [0]),
	.B(\i2c_device|i2c_state_datac_0_1_combout [2]),
	.C(CLKOSC_clk_1_q_datab_1_combout[3]),
	.D(CLKOSC_clk_1_q_datab_1_combout[1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_9_q_dataa_combout_datac_2_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.coord_x = 10;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.coord_y = 3;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.coord_z = 10;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.mask = 16'h0010;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.modeMux = 1'b0;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.FeedbackMux = 1'b0;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.ShiftMux = 1'b0;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.BypassEn = 1'b0;
defparam CLKOSC_clk_1_q_datab_1_combout_datab_1.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2(
	.A(),
	.B(),
	.C(\i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y ),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_2_q),
	.Clk(CLKOSC_i_o_X10005_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10002_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y__SyncLoad_X10005_Y10002_SIG ),
	.LutOut(CLKOSC_clk_2__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_2_q));
defparam CLKOSC_clk_2.coord_x = 11;
defparam CLKOSC_clk_2.coord_y = 3;
defparam CLKOSC_clk_2.coord_z = 5;
defparam CLKOSC_clk_2.mask = 16'hF0F0;
defparam CLKOSC_clk_2.modeMux = 1'b0;
defparam CLKOSC_clk_2.FeedbackMux = 1'b1;
defparam CLKOSC_clk_2.ShiftMux = 1'b0;
defparam CLKOSC_clk_2.BypassEn = 1'b1;
defparam CLKOSC_clk_2.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_20(
	.A(\i2c_device|sda_d_0_q_datab_combout [0]),
	.B(vcc),
	.C(vcc),
	.D(\i2c_device|scl_d_0_q_datab_combout [1]),
	.Cin(),
	.Qin(CLKOSC_clk_20_q),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_20_q_A_Y_B_Y),
	.Cout(),
	.Q(CLKOSC_clk_20_q));
defparam CLKOSC_clk_20.coord_x = 10;
defparam CLKOSC_clk_20.coord_y = 4;
defparam CLKOSC_clk_20.coord_z = 3;
defparam CLKOSC_clk_20.mask = 16'hFF50;
defparam CLKOSC_clk_20.modeMux = 1'b0;
defparam CLKOSC_clk_20.FeedbackMux = 1'b1;
defparam CLKOSC_clk_20.ShiftMux = 1'b0;
defparam CLKOSC_clk_20.BypassEn = 1'b0;
defparam CLKOSC_clk_20.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_21(
	.A(CLKOSC_clk_11_q_dataa_combout[2]),
	.B(CLKOSC_clk_11_q_dataa_combout[1]),
	.C(vcc),
	.D(CLKOSC_clk_11_q_dataa_combout[3]),
	.Cin(),
	.Qin(CLKOSC_clk_21_q),
	.Clk(CLKOSC_i_o_X10005_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_A_0_2_Y_A_2_Y_B_Y ),
	.Cout(),
	.Q(CLKOSC_clk_21_q));
defparam CLKOSC_clk_21.coord_x = 11;
defparam CLKOSC_clk_21.coord_y = 3;
defparam CLKOSC_clk_21.coord_z = 3;
defparam CLKOSC_clk_21.mask = 16'h4450;
defparam CLKOSC_clk_21.modeMux = 1'b0;
defparam CLKOSC_clk_21.FeedbackMux = 1'b1;
defparam CLKOSC_clk_21.ShiftMux = 1'b0;
defparam CLKOSC_clk_21.BypassEn = 1'b0;
defparam CLKOSC_clk_21.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_1_Y_combout(
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_1_Y),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_1_Y_combout.coord_x = 11;
defparam CLKOSC_clk_2_q_A_1_Y_combout.coord_y = 2;
defparam CLKOSC_clk_2_q_A_1_Y_combout.coord_z = 2;
defparam CLKOSC_clk_2_q_A_1_Y_combout.mask = 16'hF3FF;
defparam CLKOSC_clk_2_q_A_1_Y_combout.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_1_Y_combout.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_1_Y_combout.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_1_Y_combout.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_1_Y_combout.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_2_Y_combout(
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_2_Y),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_2_Y_combout.coord_x = 11;
defparam CLKOSC_clk_2_q_A_2_Y_combout.coord_y = 2;
defparam CLKOSC_clk_2_q_A_2_Y_combout.coord_z = 5;
defparam CLKOSC_clk_2_q_A_2_Y_combout.mask = 16'hFFF3;
defparam CLKOSC_clk_2_q_A_2_Y_combout.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_2_Y_combout.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_2_Y_combout.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_2_Y_combout.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_2_Y_combout.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_3_Y_combout(
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_3_Y),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_3_Y_combout.coord_x = 11;
defparam CLKOSC_clk_2_q_A_3_Y_combout.coord_y = 2;
defparam CLKOSC_clk_2_q_A_3_Y_combout.coord_z = 13;
defparam CLKOSC_clk_2_q_A_3_Y_combout.mask = 16'h3FFF;
defparam CLKOSC_clk_2_q_A_3_Y_combout.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_combout.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_combout.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_combout.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_combout.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_3_Y_dataa(
	.A(CLKOSC_clk_8_q_datac_combout[3]),
	.B(CLKOSC_clk_8_q_datac_combout[1]),
	.C(CLKOSC_clk_8_q_datac_combout[2]),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_3_Y_dataa_combout[0]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_3_Y_dataa.coord_x = 10;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.coord_y = 3;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.coord_z = 13;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.mask = 16'hA0B1;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_3_Y_dataa_1(
	.A(CLKOSC_clk_2_q_dataa_combout[2]),
	.B(vcc),
	.C(CLKOSC_clk_11_q_dataa_combout[3]),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_3_Y_dataa_1_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.coord_x = 11;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.coord_y = 3;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.coord_z = 7;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.mask = 16'h00A0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_1.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_3_Y_dataa_2(
	.A(CLKOSC_clk_2_q_A_3_Y),
	.B(CLKOSC_clk_8_q_datac_combout[1]),
	.C(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_1_q_datab_1_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.coord_x = 10;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.coord_y = 3;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.coord_z = 8;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.mask = 16'h1F1F;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_3_Y_dataa_2.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_A_Y_combout(
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_Y),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_A_Y_combout.coord_x = 11;
defparam CLKOSC_clk_2_q_A_Y_combout.coord_y = 2;
defparam CLKOSC_clk_2_q_A_Y_combout.coord_z = 6;
defparam CLKOSC_clk_2_q_A_Y_combout.mask = 16'hFF3F;
defparam CLKOSC_clk_2_q_A_Y_combout.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_A_Y_combout.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_A_Y_combout.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_A_Y_combout.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_A_Y_combout.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_dataa(
	.A(CLKOSC_clk_2_q),
	.B(CLKOSC_clk_2_q_datab_combout[1]),
	.C(CLKOSC_clk_2_q_datab_combout[2]),
	.D(CLKOSC_clk_2_q_datab_combout[3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_dataa_combout[1]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_dataa.coord_x = 16;
defparam CLKOSC_clk_2_q_dataa.coord_y = 2;
defparam CLKOSC_clk_2_q_dataa.coord_z = 12;
defparam CLKOSC_clk_2_q_dataa.mask = 16'hFF40;
defparam CLKOSC_clk_2_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_2_q_datab(
	.A(CLKOSC_clk_2_q),
	.B(vcc),
	.C(CLKOSC_clk_16_q_dataa_combout[2]),
	.D(CLKOSC_clk_16_q_dataa_combout[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_datab_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_2_q_datab.coord_x = 16;
defparam CLKOSC_clk_2_q_datab.coord_y = 2;
defparam CLKOSC_clk_2_q_datab.coord_z = 7;
defparam CLKOSC_clk_2_q_datab.mask = 16'hA000;
defparam CLKOSC_clk_2_q_datab.modeMux = 1'b0;
defparam CLKOSC_clk_2_q_datab.FeedbackMux = 1'b0;
defparam CLKOSC_clk_2_q_datab.ShiftMux = 1'b0;
defparam CLKOSC_clk_2_q_datab.BypassEn = 1'b0;
defparam CLKOSC_clk_2_q_datab.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_3(
	.A(),
	.B(),
	.C(CLKOSC_clk_3_q_A_Y_B_Y_B_Y),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_3_q),
	.Clk(CLKOSC_i_o_X10005_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10002_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y__SyncLoad_X10005_Y10002_SIG ),
	.LutOut(CLKOSC_clk_3__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_3_q));
defparam CLKOSC_clk_3.coord_x = 11;
defparam CLKOSC_clk_3.coord_y = 3;
defparam CLKOSC_clk_3.coord_z = 1;
defparam CLKOSC_clk_3.mask = 16'hF0F0;
defparam CLKOSC_clk_3.modeMux = 1'b0;
defparam CLKOSC_clk_3.FeedbackMux = 1'b1;
defparam CLKOSC_clk_3.ShiftMux = 1'b0;
defparam CLKOSC_clk_3.BypassEn = 1'b1;
defparam CLKOSC_clk_3.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout(
	.A(CLKOSC_clk_1_q_dataa_combout[3]),
	.B(\i2c_device|i2c_state_dataa_0_combout [1]),
	.C(\i2c_device|sda_d_0_4_q ),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_3_q_A_Y_B_Y_B_Y),
	.Cout(),
	.Q());
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.coord_x = 11;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.coord_y = 3;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.coord_z = 10;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.mask = 16'h5545;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.modeMux = 1'b0;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.FeedbackMux = 1'b0;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.ShiftMux = 1'b0;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.BypassEn = 1'b0;
defparam CLKOSC_clk_3_q_A_Y_B_Y_B_Y_combout.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_4(
	.A(),
	.B(),
	.C(\i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y ),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_4_q),
	.Clk(CLKOSC_i_o_X10005_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10002_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y__SyncLoad_X10005_Y10002_SIG ),
	.LutOut(CLKOSC_clk_4__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_4_q));
defparam CLKOSC_clk_4.coord_x = 11;
defparam CLKOSC_clk_4.coord_y = 3;
defparam CLKOSC_clk_4.coord_z = 8;
defparam CLKOSC_clk_4.mask = 16'hF0F0;
defparam CLKOSC_clk_4.modeMux = 1'b0;
defparam CLKOSC_clk_4.FeedbackMux = 1'b1;
defparam CLKOSC_clk_4.ShiftMux = 1'b0;
defparam CLKOSC_clk_4.BypassEn = 1'b1;
defparam CLKOSC_clk_4.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_5(
	.A(),
	.B(),
	.C(\i2c_device|sda_A_0_Y ),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_5_q),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10020_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10020_Y10003_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10020_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y__SyncLoad_X10020_Y10003_SIG ),
	.LutOut(CLKOSC_clk_5__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_5_q));
defparam CLKOSC_clk_5.coord_x = 9;
defparam CLKOSC_clk_5.coord_y = 3;
defparam CLKOSC_clk_5.coord_z = 0;
defparam CLKOSC_clk_5.mask = 16'hF0F0;
defparam CLKOSC_clk_5.modeMux = 1'b0;
defparam CLKOSC_clk_5.FeedbackMux = 1'b1;
defparam CLKOSC_clk_5.ShiftMux = 1'b0;
defparam CLKOSC_clk_5.BypassEn = 1'b1;
defparam CLKOSC_clk_5.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_6(
	.A(),
	.B(),
	.C(\i2c_device|sda_A_0_Y ),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_6_q),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10003_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10003_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10003_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_1_combout_B_Y__SyncLoad_X10003_Y10003_SIG ),
	.LutOut(CLKOSC_clk_6__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_6_q));
defparam CLKOSC_clk_6.coord_x = 9;
defparam CLKOSC_clk_6.coord_y = 2;
defparam CLKOSC_clk_6.coord_z = 0;
defparam CLKOSC_clk_6.mask = 16'hF0F0;
defparam CLKOSC_clk_6.modeMux = 1'b0;
defparam CLKOSC_clk_6.FeedbackMux = 1'b1;
defparam CLKOSC_clk_6.ShiftMux = 1'b0;
defparam CLKOSC_clk_6.BypassEn = 1'b1;
defparam CLKOSC_clk_6.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_6_q_dataa(
	.A(CLKOSC_clk_7_q),
	.B(CLKOSC_clk_6_q),
	.C(CLKOSC_clk_5_q),
	.D(\i2c_device|sda_d_0_2_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_6_q_dataa_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_6_q_dataa.coord_x = 10;
defparam CLKOSC_clk_6_q_dataa.coord_y = 2;
defparam CLKOSC_clk_6_q_dataa.coord_z = 0;
defparam CLKOSC_clk_6_q_dataa.mask = 16'h0020;
defparam CLKOSC_clk_6_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_6_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_6_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_6_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_6_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_7(
	.A(),
	.B(),
	.C(\i2c_device|sda_A_0_Y ),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_7_q),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10020_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10020_Y10001_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10020_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_0_combout_A_Y__SyncLoad_X10020_Y10001_SIG ),
	.LutOut(CLKOSC_clk_7__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_7_q));
defparam CLKOSC_clk_7.coord_x = 10;
defparam CLKOSC_clk_7.coord_y = 2;
defparam CLKOSC_clk_7.coord_z = 1;
defparam CLKOSC_clk_7.mask = 16'hF0F0;
defparam CLKOSC_clk_7.modeMux = 1'b0;
defparam CLKOSC_clk_7.FeedbackMux = 1'b1;
defparam CLKOSC_clk_7.ShiftMux = 1'b0;
defparam CLKOSC_clk_7.BypassEn = 1'b1;
defparam CLKOSC_clk_7.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_8(
	.A(),
	.B(),
	.C(\i2c_device|sda_A_0_Y ),
	.D(),
	.Cin(),
	.Qin(CLKOSC_clk_8_q),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10008_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10003_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10008_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_0_combout_B_Y__SyncLoad_X10008_Y10003_SIG ),
	.LutOut(CLKOSC_clk_8__feeder__LutOut),
	.Cout(),
	.Q(CLKOSC_clk_8_q));
defparam CLKOSC_clk_8.coord_x = 11;
defparam CLKOSC_clk_8.coord_y = 1;
defparam CLKOSC_clk_8.coord_z = 0;
defparam CLKOSC_clk_8.mask = 16'hF0F0;
defparam CLKOSC_clk_8.modeMux = 1'b0;
defparam CLKOSC_clk_8.FeedbackMux = 1'b1;
defparam CLKOSC_clk_8.ShiftMux = 1'b0;
defparam CLKOSC_clk_8.BypassEn = 1'b1;
defparam CLKOSC_clk_8.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_8_q_datac(
	.A(CLKOSC_clk_8_q),
	.B(CLKOSC_clk_6_q_dataa_combout[3]),
	.C(\i2c_device|sda_d_0_3_q ),
	.D(\i2c_device|sda_d_0_1_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_8_q_datac_combout[2]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_8_q_datac.coord_x = 11;
defparam CLKOSC_clk_8_q_datac.coord_y = 2;
defparam CLKOSC_clk_8_q_datac.coord_z = 14;
defparam CLKOSC_clk_8_q_datac.mask = 16'h0008;
defparam CLKOSC_clk_8_q_datac.modeMux = 1'b0;
defparam CLKOSC_clk_8_q_datac.FeedbackMux = 1'b0;
defparam CLKOSC_clk_8_q_datac.ShiftMux = 1'b0;
defparam CLKOSC_clk_8_q_datac.BypassEn = 1'b0;
defparam CLKOSC_clk_8_q_datac.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_9(
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.B(\i2c_device|sda_d_0_4_q_datac_combout [1]),
	.C(vcc),
	.D(CLKOSC_clk_9_q_dataa_combout_datac_2_combout[3]),
	.Cin(),
	.Qin(CLKOSC_clk_9_q),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_9_q_A_Y_B_Y),
	.Cout(),
	.Q(CLKOSC_clk_9_q));
defparam CLKOSC_clk_9.coord_x = 10;
defparam CLKOSC_clk_9.coord_y = 4;
defparam CLKOSC_clk_9.coord_z = 7;
defparam CLKOSC_clk_9.mask = 16'h4450;
defparam CLKOSC_clk_9.modeMux = 1'b0;
defparam CLKOSC_clk_9.FeedbackMux = 1'b1;
defparam CLKOSC_clk_9.ShiftMux = 1'b0;
defparam CLKOSC_clk_9.BypassEn = 1'b0;
defparam CLKOSC_clk_9.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_9_q_dataa(
	.A(vcc),
	.B(vcc),
	.C(CLKOSC_clk_9_q),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_9_q_dataa_combout[3]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_9_q_dataa.coord_x = 11;
defparam CLKOSC_clk_9_q_dataa.coord_y = 4;
defparam CLKOSC_clk_9_q_dataa.coord_z = 13;
defparam CLKOSC_clk_9_q_dataa.mask = 16'h000F;
defparam CLKOSC_clk_9_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_9_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_9_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_9_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_9_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_9_q_dataa_combout_datac_2(
	.A(CLKOSC_clk_8_q_datac_combout[2]),
	.B(CLKOSC_clk_9_q_dataa_combout[3]),
	.C(CLKOSC_clk_9_q_dataa_combout[2]),
	.D(\i2c_device|i2c_state_datab_0_1_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_9_q_dataa_combout_datac_2_combout[1]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.coord_x = 11;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.coord_y = 4;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.coord_z = 2;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.mask = 16'h0313;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.modeMux = 1'b0;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.FeedbackMux = 1'b0;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.ShiftMux = 1'b0;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.BypassEn = 1'b0;
defparam CLKOSC_clk_9_q_dataa_combout_datac_2.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_q_dataa(
	.A(\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [2]),
	.B(CSEL2_q_1[2]),
	.C(CLKOSC_clk_q),
	.D(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_q_dataa_combout[0]),
	.Cout(),
	.Q());
defparam CLKOSC_clk_q_dataa.coord_x = 15;
defparam CLKOSC_clk_q_dataa.coord_y = 4;
defparam CLKOSC_clk_q_dataa.coord_z = 15;
defparam CLKOSC_clk_q_dataa.mask = 16'hA2F3;
defparam CLKOSC_clk_q_dataa.modeMux = 1'b0;
defparam CLKOSC_clk_q_dataa.FeedbackMux = 1'b0;
defparam CLKOSC_clk_q_dataa.ShiftMux = 1'b0;
defparam CLKOSC_clk_q_dataa.BypassEn = 1'b0;
defparam CLKOSC_clk_q_dataa.CarryEnb = 1'b1;

alta_slice CLKOSC_clk_q_dataa_1(
	.A(vcc),
	.B(vcc),
	.C(DISP_i_o[1]),
	.D(CLKOSC_clk_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_q_dataa_1_combout),
	.Cout(),
	.Q());
defparam CLKOSC_clk_q_dataa_1.coord_x = 18;
defparam CLKOSC_clk_q_dataa_1.coord_y = 1;
defparam CLKOSC_clk_q_dataa_1.coord_z = 8;
defparam CLKOSC_clk_q_dataa_1.mask = 16'h00F0;
defparam CLKOSC_clk_q_dataa_1.modeMux = 1'b0;
defparam CLKOSC_clk_q_dataa_1.FeedbackMux = 1'b0;
defparam CLKOSC_clk_q_dataa_1.ShiftMux = 1'b0;
defparam CLKOSC_clk_q_dataa_1.BypassEn = 1'b0;
defparam CLKOSC_clk_q_dataa_1.CarryEnb = 1'b1;

alta_rio CLKOSC_i(
	.padio(CLKOSC),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(CLKOSC_i_o_int),
	.regout());
defparam CLKOSC_i.coord_x = 22;
defparam CLKOSC_i.coord_y = 4;
defparam CLKOSC_i.coord_z = 2;
defparam CLKOSC_i.IN_ASYNC_MODE = 1'b0;
defparam CLKOSC_i.IN_SYNC_MODE = 1'b0;
defparam CLKOSC_i.IN_POWERUP = 1'b0;
defparam CLKOSC_i.OUT_REG_MODE = 1'b0;
defparam CLKOSC_i.OUT_ASYNC_MODE = 1'b0;
defparam CLKOSC_i.OUT_SYNC_MODE = 1'b0;
defparam CLKOSC_i.OUT_POWERUP = 1'b0;
defparam CLKOSC_i.OE_REG_MODE = 1'b0;
defparam CLKOSC_i.OE_ASYNC_MODE = 1'b0;
defparam CLKOSC_i.OE_SYNC_MODE = 1'b0;
defparam CLKOSC_i.OE_POWERUP = 1'b0;
defparam CLKOSC_i.CFG_TRI_INPUT = 1'b0;
defparam CLKOSC_i.CFG_PULL_UP = 1'b0;
defparam CLKOSC_i.CFG_SLR = 1'b0;
defparam CLKOSC_i.CFG_OPEN_DRAIN = 1'b0;
defparam CLKOSC_i.CFG_PDRCTRL = 4'b0010;
defparam CLKOSC_i.CFG_KEEP = 2'b00;
defparam CLKOSC_i.CFG_LVDS_OUT_EN = 1'b0;
defparam CLKOSC_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam CLKOSC_i.CFG_LVDS_IREF = 10'b0110000000;
defparam CLKOSC_i.CFG_LVDS_IN_EN = 1'b0;
defparam CLKOSC_i.DPCLK_DELAY = 4'b0000;
defparam CLKOSC_i.OUT_DELAY = 1'b0;
defparam CLKOSC_i.IN_DATA_DELAY = 3'b000;
defparam CLKOSC_i.IN_REG_DELAY = 3'b000;

alta_io_gclk \CLKOSC_i|o~ALTA_GCLK (
	.inclk(CLKOSC_i_o_int),
	.outclk(CLKOSC_i_o));
defparam \CLKOSC_i|o~ALTA_GCLK .coord_x = 22;
defparam \CLKOSC_i|o~ALTA_GCLK .coord_y = 4;
defparam \CLKOSC_i|o~ALTA_GCLK .coord_z = 2;

alta_rio CO1_i(
	.padio(CO1),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(CO1_i_o[1]),
	.regout());
defparam CO1_i.coord_x = 19;
defparam CO1_i.coord_y = 0;
defparam CO1_i.coord_z = 3;
defparam CO1_i.IN_ASYNC_MODE = 1'b0;
defparam CO1_i.IN_SYNC_MODE = 1'b0;
defparam CO1_i.IN_POWERUP = 1'b0;
defparam CO1_i.OUT_REG_MODE = 1'b0;
defparam CO1_i.OUT_ASYNC_MODE = 1'b0;
defparam CO1_i.OUT_SYNC_MODE = 1'b0;
defparam CO1_i.OUT_POWERUP = 1'b0;
defparam CO1_i.OE_REG_MODE = 1'b0;
defparam CO1_i.OE_ASYNC_MODE = 1'b0;
defparam CO1_i.OE_SYNC_MODE = 1'b0;
defparam CO1_i.OE_POWERUP = 1'b0;
defparam CO1_i.CFG_TRI_INPUT = 1'b0;
defparam CO1_i.CFG_INPUT_EN = 1'b1;
defparam CO1_i.CFG_PULL_UP = 1'b0;
defparam CO1_i.CFG_SLR = 1'b0;
defparam CO1_i.CFG_OPEN_DRAIN = 1'b0;
defparam CO1_i.CFG_PDRCTRL = 4'b0100;
defparam CO1_i.CFG_KEEP = 2'b00;
defparam CO1_i.CFG_LVDS_OUT_EN = 1'b0;
defparam CO1_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam CO1_i.CFG_LVDS_IREF = 10'b0110000000;
defparam CO1_i.CFG_LVDS_IN_EN = 1'b0;
defparam CO1_i.DPCLK_DELAY = 4'b0000;
defparam CO1_i.OUT_DELAY = 1'b0;
defparam CO1_i.IN_DATA_DELAY = 3'b000;
defparam CO1_i.IN_REG_DELAY = 3'b000;

alta_rio CO2_i(
	.padio(CO2),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(CO2_i_o[1]),
	.regout());
defparam CO2_i.coord_x = 17;
defparam CO2_i.coord_y = 0;
defparam CO2_i.coord_z = 0;
defparam CO2_i.IN_ASYNC_MODE = 1'b0;
defparam CO2_i.IN_SYNC_MODE = 1'b0;
defparam CO2_i.IN_POWERUP = 1'b0;
defparam CO2_i.OUT_REG_MODE = 1'b0;
defparam CO2_i.OUT_ASYNC_MODE = 1'b0;
defparam CO2_i.OUT_SYNC_MODE = 1'b0;
defparam CO2_i.OUT_POWERUP = 1'b0;
defparam CO2_i.OE_REG_MODE = 1'b0;
defparam CO2_i.OE_ASYNC_MODE = 1'b0;
defparam CO2_i.OE_SYNC_MODE = 1'b0;
defparam CO2_i.OE_POWERUP = 1'b0;
defparam CO2_i.CFG_TRI_INPUT = 1'b0;
defparam CO2_i.CFG_INPUT_EN = 1'b1;
defparam CO2_i.CFG_PULL_UP = 1'b0;
defparam CO2_i.CFG_SLR = 1'b0;
defparam CO2_i.CFG_OPEN_DRAIN = 1'b0;
defparam CO2_i.CFG_PDRCTRL = 4'b0100;
defparam CO2_i.CFG_KEEP = 2'b00;
defparam CO2_i.CFG_LVDS_OUT_EN = 1'b0;
defparam CO2_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam CO2_i.CFG_LVDS_IREF = 10'b0110000000;
defparam CO2_i.CFG_LVDS_IN_EN = 1'b0;
defparam CO2_i.DPCLK_DELAY = 4'b0000;
defparam CO2_i.OUT_DELAY = 1'b0;
defparam CO2_i.IN_DATA_DELAY = 3'b000;
defparam CO2_i.IN_REG_DELAY = 3'b000;

alta_rio CSEL1_o(
	.padio(CSEL1),
	.datain(CSEL1_q_1[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam CSEL1_o.coord_x = 22;
defparam CSEL1_o.coord_y = 2;
defparam CSEL1_o.coord_z = 3;
defparam CSEL1_o.IN_ASYNC_MODE = 1'b0;
defparam CSEL1_o.IN_SYNC_MODE = 1'b0;
defparam CSEL1_o.IN_POWERUP = 1'b0;
defparam CSEL1_o.OUT_REG_MODE = 1'b0;
defparam CSEL1_o.OUT_ASYNC_MODE = 1'b0;
defparam CSEL1_o.OUT_SYNC_MODE = 1'b0;
defparam CSEL1_o.OUT_POWERUP = 1'b0;
defparam CSEL1_o.OE_REG_MODE = 1'b0;
defparam CSEL1_o.OE_ASYNC_MODE = 1'b0;
defparam CSEL1_o.OE_SYNC_MODE = 1'b0;
defparam CSEL1_o.OE_POWERUP = 1'b0;
defparam CSEL1_o.CFG_TRI_INPUT = 1'b0;
defparam CSEL1_o.CFG_INPUT_EN = 1'b0;
defparam CSEL1_o.CFG_PULL_UP = 1'b0;
defparam CSEL1_o.CFG_SLR = 1'b0;
defparam CSEL1_o.CFG_OPEN_DRAIN = 1'b0;
defparam CSEL1_o.CFG_PDRCTRL = 4'b0100;
defparam CSEL1_o.CFG_KEEP = 2'b00;
defparam CSEL1_o.CFG_LVDS_OUT_EN = 1'b0;
defparam CSEL1_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam CSEL1_o.CFG_LVDS_IREF = 10'b0110000000;
defparam CSEL1_o.CFG_LVDS_IN_EN = 1'b0;
defparam CSEL1_o.DPCLK_DELAY = 4'b0000;
defparam CSEL1_o.OUT_DELAY = 1'b0;
defparam CSEL1_o.IN_DATA_DELAY = 3'b000;
defparam CSEL1_o.IN_REG_DELAY = 3'b000;

alta_slice CSEL1_q(
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [6]),
	.B(\i2c_device|OFFSET_PRIMARY [6]),
	.C(\i2c_device|write_value [1]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [6]),
	.Qin(CSEL1_q_1[3]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [6]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [7]),
	.Q(CSEL1_q_1[3]));
defparam CSEL1_q.coord_x = 17;
defparam CSEL1_q.coord_y = 2;
defparam CSEL1_q.coord_z = 8;
defparam CSEL1_q.mask = 16'h69B2;
defparam CSEL1_q.modeMux = 1'b1;
defparam CSEL1_q.FeedbackMux = 1'b0;
defparam CSEL1_q.ShiftMux = 1'b0;
defparam CSEL1_q.BypassEn = 1'b1;
defparam CSEL1_q.CarryEnb = 1'b0;

alta_rio CSEL2_o(
	.padio(CSEL2),
	.datain(CSEL2_q_1[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam CSEL2_o.coord_x = 22;
defparam CSEL2_o.coord_y = 3;
defparam CSEL2_o.coord_z = 1;
defparam CSEL2_o.IN_ASYNC_MODE = 1'b0;
defparam CSEL2_o.IN_SYNC_MODE = 1'b0;
defparam CSEL2_o.IN_POWERUP = 1'b0;
defparam CSEL2_o.OUT_REG_MODE = 1'b0;
defparam CSEL2_o.OUT_ASYNC_MODE = 1'b0;
defparam CSEL2_o.OUT_SYNC_MODE = 1'b0;
defparam CSEL2_o.OUT_POWERUP = 1'b0;
defparam CSEL2_o.OE_REG_MODE = 1'b0;
defparam CSEL2_o.OE_ASYNC_MODE = 1'b0;
defparam CSEL2_o.OE_SYNC_MODE = 1'b0;
defparam CSEL2_o.OE_POWERUP = 1'b0;
defparam CSEL2_o.CFG_TRI_INPUT = 1'b0;
defparam CSEL2_o.CFG_INPUT_EN = 1'b0;
defparam CSEL2_o.CFG_PULL_UP = 1'b0;
defparam CSEL2_o.CFG_SLR = 1'b0;
defparam CSEL2_o.CFG_OPEN_DRAIN = 1'b0;
defparam CSEL2_o.CFG_PDRCTRL = 4'b0100;
defparam CSEL2_o.CFG_KEEP = 2'b00;
defparam CSEL2_o.CFG_LVDS_OUT_EN = 1'b0;
defparam CSEL2_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam CSEL2_o.CFG_LVDS_IREF = 10'b0110000000;
defparam CSEL2_o.CFG_LVDS_IN_EN = 1'b0;
defparam CSEL2_o.DPCLK_DELAY = 4'b0000;
defparam CSEL2_o.OUT_DELAY = 1'b0;
defparam CSEL2_o.IN_DATA_DELAY = 3'b000;
defparam CSEL2_o.IN_REG_DELAY = 3'b000;

alta_slice CSEL2_q(
	.A(\i2c_device|OFFSET_PRIMARY [5]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [5]),
	.C(\i2c_device|write_value [0]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [5]),
	.Qin(CSEL2_q_1[3]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [5]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [6]),
	.Q(CSEL2_q_1[3]));
defparam CSEL2_q.coord_x = 17;
defparam CSEL2_q.coord_y = 2;
defparam CSEL2_q.coord_z = 7;
defparam CSEL2_q.mask = 16'h69D4;
defparam CSEL2_q.modeMux = 1'b1;
defparam CSEL2_q.FeedbackMux = 1'b0;
defparam CSEL2_q.ShiftMux = 1'b0;
defparam CSEL2_q.BypassEn = 1'b1;
defparam CSEL2_q.CarryEnb = 1'b0;

alta_rio DISP_i(
	.padio(DISP),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(DISP_i_o[1]),
	.regout());
defparam DISP_i.coord_x = 17;
defparam DISP_i.coord_y = 0;
defparam DISP_i.coord_z = 1;
defparam DISP_i.IN_ASYNC_MODE = 1'b0;
defparam DISP_i.IN_SYNC_MODE = 1'b0;
defparam DISP_i.IN_POWERUP = 1'b0;
defparam DISP_i.OUT_REG_MODE = 1'b0;
defparam DISP_i.OUT_ASYNC_MODE = 1'b0;
defparam DISP_i.OUT_SYNC_MODE = 1'b0;
defparam DISP_i.OUT_POWERUP = 1'b0;
defparam DISP_i.OE_REG_MODE = 1'b0;
defparam DISP_i.OE_ASYNC_MODE = 1'b0;
defparam DISP_i.OE_SYNC_MODE = 1'b0;
defparam DISP_i.OE_POWERUP = 1'b0;
defparam DISP_i.CFG_TRI_INPUT = 1'b0;
defparam DISP_i.CFG_INPUT_EN = 1'b1;
defparam DISP_i.CFG_PULL_UP = 1'b0;
defparam DISP_i.CFG_SLR = 1'b0;
defparam DISP_i.CFG_OPEN_DRAIN = 1'b0;
defparam DISP_i.CFG_PDRCTRL = 4'b0100;
defparam DISP_i.CFG_KEEP = 2'b00;
defparam DISP_i.CFG_LVDS_OUT_EN = 1'b0;
defparam DISP_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam DISP_i.CFG_LVDS_IREF = 10'b0110000000;
defparam DISP_i.CFG_LVDS_IN_EN = 1'b0;
defparam DISP_i.DPCLK_DELAY = 4'b0000;
defparam DISP_i.OUT_DELAY = 1'b0;
defparam DISP_i.IN_DATA_DELAY = 3'b000;
defparam DISP_i.IN_REG_DELAY = 3'b000;

alta_slice I2S1_d(
	.A(\i2c_device|lockb_cnt [11]),
	.B(vcc),
	.C(I2S1_i_o[3]),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [3]),
	.Qin(I2S1_d_q),
	.Clk(BCLK1_i_o_X10004_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10004_Y10001_GND),
	.SyncReset(SyncReset_X10004_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10001_VCC),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [3]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [4]),
	.Q(I2S1_d_q));
defparam I2S1_d.coord_x = 19;
defparam I2S1_d.coord_y = 7;
defparam I2S1_d.coord_z = 3;
defparam I2S1_d.mask = 16'h69B2;
defparam I2S1_d.modeMux = 1'b1;
defparam I2S1_d.FeedbackMux = 1'b0;
defparam I2S1_d.ShiftMux = 1'b0;
defparam I2S1_d.BypassEn = 1'b1;
defparam I2S1_d.CarryEnb = 1'b0;

alta_rio I2S1_i(
	.padio(I2S1),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(I2S1_i_o[3]),
	.regout());
defparam I2S1_i.coord_x = 17;
defparam I2S1_i.coord_y = 13;
defparam I2S1_i.coord_z = 2;
defparam I2S1_i.IN_ASYNC_MODE = 1'b0;
defparam I2S1_i.IN_SYNC_MODE = 1'b0;
defparam I2S1_i.IN_POWERUP = 1'b0;
defparam I2S1_i.OUT_REG_MODE = 1'b0;
defparam I2S1_i.OUT_ASYNC_MODE = 1'b0;
defparam I2S1_i.OUT_SYNC_MODE = 1'b0;
defparam I2S1_i.OUT_POWERUP = 1'b0;
defparam I2S1_i.OE_REG_MODE = 1'b0;
defparam I2S1_i.OE_ASYNC_MODE = 1'b0;
defparam I2S1_i.OE_SYNC_MODE = 1'b0;
defparam I2S1_i.OE_POWERUP = 1'b0;
defparam I2S1_i.CFG_TRI_INPUT = 1'b0;
defparam I2S1_i.CFG_INPUT_EN = 1'b1;
defparam I2S1_i.CFG_PULL_UP = 1'b0;
defparam I2S1_i.CFG_SLR = 1'b0;
defparam I2S1_i.CFG_OPEN_DRAIN = 1'b0;
defparam I2S1_i.CFG_PDRCTRL = 4'b0100;
defparam I2S1_i.CFG_KEEP = 2'b00;
defparam I2S1_i.CFG_LVDS_OUT_EN = 1'b0;
defparam I2S1_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam I2S1_i.CFG_LVDS_IREF = 10'b0110000000;
defparam I2S1_i.CFG_LVDS_IN_EN = 1'b0;
defparam I2S1_i.DPCLK_DELAY = 4'b0000;
defparam I2S1_i.OUT_DELAY = 1'b0;
defparam I2S1_i.IN_DATA_DELAY = 3'b000;
defparam I2S1_i.IN_REG_DELAY = 3'b000;

alta_slice I2S2_d(
	.A(vcc),
	.B(\i2c_device|lockb_cnt [9]),
	.C(I2S2_i_o[3]),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [1]),
	.Qin(I2S2_d_q),
	.Clk(BCLK2_i_o_X10004_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10004_Y10001_GND),
	.SyncReset(SyncReset_X10004_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10001_VCC),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [1]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [2]),
	.Q(I2S2_d_q));
defparam I2S2_d.coord_x = 19;
defparam I2S2_d.coord_y = 7;
defparam I2S2_d.coord_z = 1;
defparam I2S2_d.mask = 16'h96E8;
defparam I2S2_d.modeMux = 1'b1;
defparam I2S2_d.FeedbackMux = 1'b0;
defparam I2S2_d.ShiftMux = 1'b0;
defparam I2S2_d.BypassEn = 1'b1;
defparam I2S2_d.CarryEnb = 1'b0;

alta_rio I2S2_i(
	.padio(I2S2),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(I2S2_i_o[3]),
	.regout());
defparam I2S2_i.coord_x = 19;
defparam I2S2_i.coord_y = 13;
defparam I2S2_i.coord_z = 0;
defparam I2S2_i.IN_ASYNC_MODE = 1'b0;
defparam I2S2_i.IN_SYNC_MODE = 1'b0;
defparam I2S2_i.IN_POWERUP = 1'b0;
defparam I2S2_i.OUT_REG_MODE = 1'b0;
defparam I2S2_i.OUT_ASYNC_MODE = 1'b0;
defparam I2S2_i.OUT_SYNC_MODE = 1'b0;
defparam I2S2_i.OUT_POWERUP = 1'b0;
defparam I2S2_i.OE_REG_MODE = 1'b0;
defparam I2S2_i.OE_ASYNC_MODE = 1'b0;
defparam I2S2_i.OE_SYNC_MODE = 1'b0;
defparam I2S2_i.OE_POWERUP = 1'b0;
defparam I2S2_i.CFG_TRI_INPUT = 1'b0;
defparam I2S2_i.CFG_INPUT_EN = 1'b1;
defparam I2S2_i.CFG_PULL_UP = 1'b0;
defparam I2S2_i.CFG_SLR = 1'b0;
defparam I2S2_i.CFG_OPEN_DRAIN = 1'b0;
defparam I2S2_i.CFG_PDRCTRL = 4'b0100;
defparam I2S2_i.CFG_KEEP = 2'b00;
defparam I2S2_i.CFG_LVDS_OUT_EN = 1'b0;
defparam I2S2_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam I2S2_i.CFG_LVDS_IREF = 10'b0110000000;
defparam I2S2_i.CFG_LVDS_IN_EN = 1'b0;
defparam I2S2_i.DPCLK_DELAY = 4'b0000;
defparam I2S2_i.OUT_DELAY = 1'b0;
defparam I2S2_i.IN_DATA_DELAY = 3'b000;
defparam I2S2_i.IN_REG_DELAY = 3'b000;

alta_rio LOCKA_o(
	.padio(LOCKA),
	.datain(\i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam LOCKA_o.coord_x = 19;
defparam LOCKA_o.coord_y = 13;
defparam LOCKA_o.coord_z = 2;
defparam LOCKA_o.IN_ASYNC_MODE = 1'b0;
defparam LOCKA_o.IN_SYNC_MODE = 1'b0;
defparam LOCKA_o.IN_POWERUP = 1'b0;
defparam LOCKA_o.OUT_REG_MODE = 1'b0;
defparam LOCKA_o.OUT_ASYNC_MODE = 1'b0;
defparam LOCKA_o.OUT_SYNC_MODE = 1'b0;
defparam LOCKA_o.OUT_POWERUP = 1'b0;
defparam LOCKA_o.OE_REG_MODE = 1'b0;
defparam LOCKA_o.OE_ASYNC_MODE = 1'b0;
defparam LOCKA_o.OE_SYNC_MODE = 1'b0;
defparam LOCKA_o.OE_POWERUP = 1'b0;
defparam LOCKA_o.CFG_TRI_INPUT = 1'b0;
defparam LOCKA_o.CFG_INPUT_EN = 1'b0;
defparam LOCKA_o.CFG_PULL_UP = 1'b0;
defparam LOCKA_o.CFG_SLR = 1'b0;
defparam LOCKA_o.CFG_OPEN_DRAIN = 1'b0;
defparam LOCKA_o.CFG_PDRCTRL = 4'b0100;
defparam LOCKA_o.CFG_KEEP = 2'b00;
defparam LOCKA_o.CFG_LVDS_OUT_EN = 1'b0;
defparam LOCKA_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam LOCKA_o.CFG_LVDS_IREF = 10'b0110000000;
defparam LOCKA_o.CFG_LVDS_IN_EN = 1'b0;
defparam LOCKA_o.DPCLK_DELAY = 4'b0000;
defparam LOCKA_o.OUT_DELAY = 1'b0;
defparam LOCKA_o.IN_DATA_DELAY = 3'b000;
defparam LOCKA_o.IN_REG_DELAY = 3'b000;

alta_rio LOCKB_o(
	.padio(LOCKB),
	.datain(\i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam LOCKB_o.coord_x = 19;
defparam LOCKB_o.coord_y = 13;
defparam LOCKB_o.coord_z = 1;
defparam LOCKB_o.IN_ASYNC_MODE = 1'b0;
defparam LOCKB_o.IN_SYNC_MODE = 1'b0;
defparam LOCKB_o.IN_POWERUP = 1'b0;
defparam LOCKB_o.OUT_REG_MODE = 1'b0;
defparam LOCKB_o.OUT_ASYNC_MODE = 1'b0;
defparam LOCKB_o.OUT_SYNC_MODE = 1'b0;
defparam LOCKB_o.OUT_POWERUP = 1'b0;
defparam LOCKB_o.OE_REG_MODE = 1'b0;
defparam LOCKB_o.OE_ASYNC_MODE = 1'b0;
defparam LOCKB_o.OE_SYNC_MODE = 1'b0;
defparam LOCKB_o.OE_POWERUP = 1'b0;
defparam LOCKB_o.CFG_TRI_INPUT = 1'b0;
defparam LOCKB_o.CFG_INPUT_EN = 1'b0;
defparam LOCKB_o.CFG_PULL_UP = 1'b0;
defparam LOCKB_o.CFG_SLR = 1'b0;
defparam LOCKB_o.CFG_OPEN_DRAIN = 1'b0;
defparam LOCKB_o.CFG_PDRCTRL = 4'b0100;
defparam LOCKB_o.CFG_KEEP = 2'b00;
defparam LOCKB_o.CFG_LVDS_OUT_EN = 1'b0;
defparam LOCKB_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam LOCKB_o.CFG_LVDS_IREF = 10'b0110000000;
defparam LOCKB_o.CFG_LVDS_IN_EN = 1'b0;
defparam LOCKB_o.DPCLK_DELAY = 4'b0000;
defparam LOCKB_o.OUT_DELAY = 1'b0;
defparam LOCKB_o.IN_DATA_DELAY = 3'b000;
defparam LOCKB_o.IN_REG_DELAY = 3'b000;

alta_rio PWDN_o(
	.padio(PWDN),
	.datain(CLKOSC_clk_q_dataa_1_combout),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam PWDN_o.coord_x = 17;
defparam PWDN_o.coord_y = 0;
defparam PWDN_o.coord_z = 2;
defparam PWDN_o.IN_ASYNC_MODE = 1'b0;
defparam PWDN_o.IN_SYNC_MODE = 1'b0;
defparam PWDN_o.IN_POWERUP = 1'b0;
defparam PWDN_o.OUT_REG_MODE = 1'b0;
defparam PWDN_o.OUT_ASYNC_MODE = 1'b0;
defparam PWDN_o.OUT_SYNC_MODE = 1'b0;
defparam PWDN_o.OUT_POWERUP = 1'b0;
defparam PWDN_o.OE_REG_MODE = 1'b0;
defparam PWDN_o.OE_ASYNC_MODE = 1'b0;
defparam PWDN_o.OE_SYNC_MODE = 1'b0;
defparam PWDN_o.OE_POWERUP = 1'b0;
defparam PWDN_o.CFG_TRI_INPUT = 1'b0;
defparam PWDN_o.CFG_INPUT_EN = 1'b0;
defparam PWDN_o.CFG_PULL_UP = 1'b0;
defparam PWDN_o.CFG_SLR = 1'b0;
defparam PWDN_o.CFG_OPEN_DRAIN = 1'b0;
defparam PWDN_o.CFG_PDRCTRL = 4'b0100;
defparam PWDN_o.CFG_KEEP = 2'b00;
defparam PWDN_o.CFG_LVDS_OUT_EN = 1'b0;
defparam PWDN_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam PWDN_o.CFG_LVDS_IREF = 10'b0110000000;
defparam PWDN_o.CFG_LVDS_IN_EN = 1'b0;
defparam PWDN_o.DPCLK_DELAY = 4'b0000;
defparam PWDN_o.OUT_DELAY = 1'b0;
defparam PWDN_o.IN_DATA_DELAY = 3'b000;
defparam PWDN_o.IN_REG_DELAY = 3'b000;

alta_rio Q11_o(
	.padio(Q11),
	.datain(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam Q11_o.coord_x = 20;
defparam Q11_o.coord_y = 13;
defparam Q11_o.coord_z = 1;
defparam Q11_o.IN_ASYNC_MODE = 1'b0;
defparam Q11_o.IN_SYNC_MODE = 1'b0;
defparam Q11_o.IN_POWERUP = 1'b0;
defparam Q11_o.OUT_REG_MODE = 1'b0;
defparam Q11_o.OUT_ASYNC_MODE = 1'b0;
defparam Q11_o.OUT_SYNC_MODE = 1'b0;
defparam Q11_o.OUT_POWERUP = 1'b0;
defparam Q11_o.OE_REG_MODE = 1'b0;
defparam Q11_o.OE_ASYNC_MODE = 1'b0;
defparam Q11_o.OE_SYNC_MODE = 1'b0;
defparam Q11_o.OE_POWERUP = 1'b0;
defparam Q11_o.CFG_TRI_INPUT = 1'b0;
defparam Q11_o.CFG_INPUT_EN = 1'b0;
defparam Q11_o.CFG_PULL_UP = 1'b0;
defparam Q11_o.CFG_SLR = 1'b0;
defparam Q11_o.CFG_OPEN_DRAIN = 1'b0;
defparam Q11_o.CFG_PDRCTRL = 4'b0100;
defparam Q11_o.CFG_KEEP = 2'b00;
defparam Q11_o.CFG_LVDS_OUT_EN = 1'b0;
defparam Q11_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam Q11_o.CFG_LVDS_IREF = 10'b0110000000;
defparam Q11_o.CFG_LVDS_IN_EN = 1'b0;
defparam Q11_o.DPCLK_DELAY = 4'b0000;
defparam Q11_o.OUT_DELAY = 1'b0;
defparam Q11_o.IN_DATA_DELAY = 3'b000;
defparam Q11_o.IN_REG_DELAY = 3'b000;

alta_rio Q12_o(
	.padio(Q12),
	.datain(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam Q12_o.coord_x = 20;
defparam Q12_o.coord_y = 13;
defparam Q12_o.coord_z = 2;
defparam Q12_o.IN_ASYNC_MODE = 1'b0;
defparam Q12_o.IN_SYNC_MODE = 1'b0;
defparam Q12_o.IN_POWERUP = 1'b0;
defparam Q12_o.OUT_REG_MODE = 1'b0;
defparam Q12_o.OUT_ASYNC_MODE = 1'b0;
defparam Q12_o.OUT_SYNC_MODE = 1'b0;
defparam Q12_o.OUT_POWERUP = 1'b0;
defparam Q12_o.OE_REG_MODE = 1'b0;
defparam Q12_o.OE_ASYNC_MODE = 1'b0;
defparam Q12_o.OE_SYNC_MODE = 1'b0;
defparam Q12_o.OE_POWERUP = 1'b0;
defparam Q12_o.CFG_TRI_INPUT = 1'b0;
defparam Q12_o.CFG_INPUT_EN = 1'b0;
defparam Q12_o.CFG_PULL_UP = 1'b0;
defparam Q12_o.CFG_SLR = 1'b0;
defparam Q12_o.CFG_OPEN_DRAIN = 1'b0;
defparam Q12_o.CFG_PDRCTRL = 4'b0100;
defparam Q12_o.CFG_KEEP = 2'b00;
defparam Q12_o.CFG_LVDS_OUT_EN = 1'b0;
defparam Q12_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam Q12_o.CFG_LVDS_IREF = 10'b0110000000;
defparam Q12_o.CFG_LVDS_IN_EN = 1'b0;
defparam Q12_o.DPCLK_DELAY = 4'b0000;
defparam Q12_o.OUT_DELAY = 1'b0;
defparam Q12_o.IN_DATA_DELAY = 3'b000;
defparam Q12_o.IN_REG_DELAY = 3'b000;

alta_rio Q21_o(
	.padio(Q21),
	.datain(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam Q21_o.coord_x = 20;
defparam Q21_o.coord_y = 13;
defparam Q21_o.coord_z = 3;
defparam Q21_o.IN_ASYNC_MODE = 1'b0;
defparam Q21_o.IN_SYNC_MODE = 1'b0;
defparam Q21_o.IN_POWERUP = 1'b0;
defparam Q21_o.OUT_REG_MODE = 1'b0;
defparam Q21_o.OUT_ASYNC_MODE = 1'b0;
defparam Q21_o.OUT_SYNC_MODE = 1'b0;
defparam Q21_o.OUT_POWERUP = 1'b0;
defparam Q21_o.OE_REG_MODE = 1'b0;
defparam Q21_o.OE_ASYNC_MODE = 1'b0;
defparam Q21_o.OE_SYNC_MODE = 1'b0;
defparam Q21_o.OE_POWERUP = 1'b0;
defparam Q21_o.CFG_TRI_INPUT = 1'b0;
defparam Q21_o.CFG_INPUT_EN = 1'b0;
defparam Q21_o.CFG_PULL_UP = 1'b0;
defparam Q21_o.CFG_SLR = 1'b0;
defparam Q21_o.CFG_OPEN_DRAIN = 1'b0;
defparam Q21_o.CFG_PDRCTRL = 4'b0100;
defparam Q21_o.CFG_KEEP = 2'b00;
defparam Q21_o.CFG_LVDS_OUT_EN = 1'b0;
defparam Q21_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam Q21_o.CFG_LVDS_IREF = 10'b0110000000;
defparam Q21_o.CFG_LVDS_IN_EN = 1'b0;
defparam Q21_o.DPCLK_DELAY = 4'b0000;
defparam Q21_o.OUT_DELAY = 1'b0;
defparam Q21_o.IN_DATA_DELAY = 3'b000;
defparam Q21_o.IN_REG_DELAY = 3'b000;

alta_rio Q22_o(
	.padio(Q22),
	.datain(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam Q22_o.coord_x = 19;
defparam Q22_o.coord_y = 13;
defparam Q22_o.coord_z = 3;
defparam Q22_o.IN_ASYNC_MODE = 1'b0;
defparam Q22_o.IN_SYNC_MODE = 1'b0;
defparam Q22_o.IN_POWERUP = 1'b0;
defparam Q22_o.OUT_REG_MODE = 1'b0;
defparam Q22_o.OUT_ASYNC_MODE = 1'b0;
defparam Q22_o.OUT_SYNC_MODE = 1'b0;
defparam Q22_o.OUT_POWERUP = 1'b0;
defparam Q22_o.OE_REG_MODE = 1'b0;
defparam Q22_o.OE_ASYNC_MODE = 1'b0;
defparam Q22_o.OE_SYNC_MODE = 1'b0;
defparam Q22_o.OE_POWERUP = 1'b0;
defparam Q22_o.CFG_TRI_INPUT = 1'b0;
defparam Q22_o.CFG_INPUT_EN = 1'b0;
defparam Q22_o.CFG_PULL_UP = 1'b0;
defparam Q22_o.CFG_SLR = 1'b0;
defparam Q22_o.CFG_OPEN_DRAIN = 1'b0;
defparam Q22_o.CFG_PDRCTRL = 4'b0100;
defparam Q22_o.CFG_KEEP = 2'b00;
defparam Q22_o.CFG_LVDS_OUT_EN = 1'b0;
defparam Q22_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam Q22_o.CFG_LVDS_IREF = 10'b0110000000;
defparam Q22_o.CFG_LVDS_IN_EN = 1'b0;
defparam Q22_o.DPCLK_DELAY = 4'b0000;
defparam Q22_o.OUT_DELAY = 1'b0;
defparam Q22_o.IN_DATA_DELAY = 3'b000;
defparam Q22_o.IN_REG_DELAY = 3'b000;

alta_rio SCL_i(
	.padio(SCL),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(SCL_i_o),
	.regout());
defparam SCL_i.coord_x = 0;
defparam SCL_i.coord_y = 1;
defparam SCL_i.coord_z = 2;
defparam SCL_i.IN_ASYNC_MODE = 1'b0;
defparam SCL_i.IN_SYNC_MODE = 1'b0;
defparam SCL_i.IN_POWERUP = 1'b0;
defparam SCL_i.OUT_REG_MODE = 1'b0;
defparam SCL_i.OUT_ASYNC_MODE = 1'b0;
defparam SCL_i.OUT_SYNC_MODE = 1'b0;
defparam SCL_i.OUT_POWERUP = 1'b0;
defparam SCL_i.OE_REG_MODE = 1'b0;
defparam SCL_i.OE_ASYNC_MODE = 1'b0;
defparam SCL_i.OE_SYNC_MODE = 1'b0;
defparam SCL_i.OE_POWERUP = 1'b0;
defparam SCL_i.CFG_TRI_INPUT = 1'b0;
defparam SCL_i.CFG_INPUT_EN = 1'b1;
defparam SCL_i.CFG_PULL_UP = 1'b0;
defparam SCL_i.CFG_SLR = 1'b0;
defparam SCL_i.CFG_OPEN_DRAIN = 1'b0;
defparam SCL_i.CFG_PDRCTRL = 4'b0100;
defparam SCL_i.CFG_KEEP = 2'b00;
defparam SCL_i.CFG_LVDS_OUT_EN = 1'b0;
defparam SCL_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam SCL_i.CFG_LVDS_IREF = 10'b0110000000;
defparam SCL_i.CFG_LVDS_IN_EN = 1'b0;
defparam SCL_i.DPCLK_DELAY = 4'b0000;
defparam SCL_i.OUT_DELAY = 1'b0;
defparam SCL_i.IN_DATA_DELAY = 3'b000;
defparam SCL_i.IN_REG_DELAY = 3'b000;

alta_rio SDA_o(
	.padio(SDA),
	.datain(gnd),
	.oe(CLKOSC_clk_21_q),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(SDA_i_o),
	.regout());
defparam SDA_o.coord_x = 0;
defparam SDA_o.coord_y = 1;
defparam SDA_o.coord_z = 0;
defparam SDA_o.IN_ASYNC_MODE = 1'b0;
defparam SDA_o.IN_SYNC_MODE = 1'b0;
defparam SDA_o.IN_POWERUP = 1'b0;
defparam SDA_o.OUT_REG_MODE = 1'b0;
defparam SDA_o.OUT_ASYNC_MODE = 1'b0;
defparam SDA_o.OUT_SYNC_MODE = 1'b0;
defparam SDA_o.OUT_POWERUP = 1'b0;
defparam SDA_o.OE_REG_MODE = 1'b0;
defparam SDA_o.OE_ASYNC_MODE = 1'b0;
defparam SDA_o.OE_SYNC_MODE = 1'b0;
defparam SDA_o.OE_POWERUP = 1'b0;
defparam SDA_o.CFG_TRI_INPUT = 1'b0;
defparam SDA_o.CFG_INPUT_EN = 1'b1;
defparam SDA_o.CFG_PULL_UP = 1'b0;
defparam SDA_o.CFG_SLR = 1'b0;
defparam SDA_o.CFG_OPEN_DRAIN = 1'b0;
defparam SDA_o.CFG_PDRCTRL = 4'b0100;
defparam SDA_o.CFG_KEEP = 2'b00;
defparam SDA_o.CFG_LVDS_OUT_EN = 1'b0;
defparam SDA_o.CFG_LVDS_SEL_CUA = 2'b00;
defparam SDA_o.CFG_LVDS_IREF = 10'b0110000000;
defparam SDA_o.CFG_LVDS_IN_EN = 1'b0;
defparam SDA_o.DPCLK_DELAY = 4'b0000;
defparam SDA_o.OUT_DELAY = 1'b0;
defparam SDA_o.IN_DATA_DELAY = 3'b000;
defparam SDA_o.IN_REG_DELAY = 3'b000;

alta_rio STDBY_i(
	.padio(STDBY),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(STDBY_i_o[3]),
	.regout());
defparam STDBY_i.coord_x = 0;
defparam STDBY_i.coord_y = 4;
defparam STDBY_i.coord_z = 4;
defparam STDBY_i.IN_ASYNC_MODE = 1'b0;
defparam STDBY_i.IN_SYNC_MODE = 1'b0;
defparam STDBY_i.IN_POWERUP = 1'b0;
defparam STDBY_i.OUT_REG_MODE = 1'b0;
defparam STDBY_i.OUT_ASYNC_MODE = 1'b0;
defparam STDBY_i.OUT_SYNC_MODE = 1'b0;
defparam STDBY_i.OUT_POWERUP = 1'b0;
defparam STDBY_i.OE_REG_MODE = 1'b0;
defparam STDBY_i.OE_ASYNC_MODE = 1'b0;
defparam STDBY_i.OE_SYNC_MODE = 1'b0;
defparam STDBY_i.OE_POWERUP = 1'b0;
defparam STDBY_i.CFG_TRI_INPUT = 1'b0;
defparam STDBY_i.CFG_INPUT_EN = 1'b1;
defparam STDBY_i.CFG_PULL_UP = 1'b0;
defparam STDBY_i.CFG_SLR = 1'b0;
defparam STDBY_i.CFG_OPEN_DRAIN = 1'b0;
defparam STDBY_i.CFG_PDRCTRL = 4'b0100;
defparam STDBY_i.CFG_KEEP = 2'b00;
defparam STDBY_i.CFG_LVDS_OUT_EN = 1'b0;
defparam STDBY_i.CFG_LVDS_SEL_CUA = 2'b00;
defparam STDBY_i.CFG_LVDS_IREF = 10'b0110000000;
defparam STDBY_i.CFG_LVDS_IN_EN = 1'b0;
defparam STDBY_i.DPCLK_DELAY = 4'b0000;
defparam STDBY_i.OUT_DELAY = 1'b0;
defparam STDBY_i.IN_DATA_DELAY = 3'b000;
defparam STDBY_i.IN_REG_DELAY = 3'b000;

alta_asyncctrl asyncreset_ctrl_X10001_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10001_Y10001_GND));
defparam asyncreset_ctrl_X10001_Y10001_N0.coord_x = 20;
defparam asyncreset_ctrl_X10001_Y10001_N0.coord_y = 9;
defparam asyncreset_ctrl_X10001_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10001_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10001_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10001_Y10002_GND));
defparam asyncreset_ctrl_X10001_Y10002_N0.coord_x = 18;
defparam asyncreset_ctrl_X10001_Y10002_N0.coord_y = 4;
defparam asyncreset_ctrl_X10001_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10001_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10001_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10001_Y10003_GND));
defparam asyncreset_ctrl_X10001_Y10003_N0.coord_x = 12;
defparam asyncreset_ctrl_X10001_Y10003_N0.coord_y = 1;
defparam asyncreset_ctrl_X10001_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10001_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10002_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10002_Y10001_GND));
defparam asyncreset_ctrl_X10002_Y10001_N1.coord_x = 19;
defparam asyncreset_ctrl_X10002_Y10001_N1.coord_y = 6;
defparam asyncreset_ctrl_X10002_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10002_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10002_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10002_Y10002_GND));
defparam asyncreset_ctrl_X10002_Y10002_N0.coord_x = 15;
defparam asyncreset_ctrl_X10002_Y10002_N0.coord_y = 4;
defparam asyncreset_ctrl_X10002_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10002_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10002_Y10003_N1(
	.Din(),
	.Dout(AsyncReset_X10002_Y10003_GND));
defparam asyncreset_ctrl_X10002_Y10003_N1.coord_x = 14;
defparam asyncreset_ctrl_X10002_Y10003_N1.coord_y = 2;
defparam asyncreset_ctrl_X10002_Y10003_N1.coord_z = 1;
defparam asyncreset_ctrl_X10002_Y10003_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10003_Y10002_N1(
	.Din(),
	.Dout(AsyncReset_X10003_Y10002_GND));
defparam asyncreset_ctrl_X10003_Y10002_N1.coord_x = 19;
defparam asyncreset_ctrl_X10003_Y10002_N1.coord_y = 3;
defparam asyncreset_ctrl_X10003_Y10002_N1.coord_z = 1;
defparam asyncreset_ctrl_X10003_Y10002_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10003_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10003_Y10003_GND));
defparam asyncreset_ctrl_X10003_Y10003_N0.coord_x = 9;
defparam asyncreset_ctrl_X10003_Y10003_N0.coord_y = 2;
defparam asyncreset_ctrl_X10003_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10003_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10004_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10004_Y10001_GND));
defparam asyncreset_ctrl_X10004_Y10001_N0.coord_x = 19;
defparam asyncreset_ctrl_X10004_Y10001_N0.coord_y = 7;
defparam asyncreset_ctrl_X10004_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10004_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10004_Y10002_N1(
	.Din(),
	.Dout(AsyncReset_X10004_Y10002_GND));
defparam asyncreset_ctrl_X10004_Y10002_N1.coord_x = 19;
defparam asyncreset_ctrl_X10004_Y10002_N1.coord_y = 1;
defparam asyncreset_ctrl_X10004_Y10002_N1.coord_z = 1;
defparam asyncreset_ctrl_X10004_Y10002_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10004_Y10003_N1(
	.Din(),
	.Dout(AsyncReset_X10004_Y10003_GND));
defparam asyncreset_ctrl_X10004_Y10003_N1.coord_x = 17;
defparam asyncreset_ctrl_X10004_Y10003_N1.coord_y = 3;
defparam asyncreset_ctrl_X10004_Y10003_N1.coord_z = 1;
defparam asyncreset_ctrl_X10004_Y10003_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10005_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10005_Y10001_GND));
defparam asyncreset_ctrl_X10005_Y10001_N1.coord_x = 19;
defparam asyncreset_ctrl_X10005_Y10001_N1.coord_y = 5;
defparam asyncreset_ctrl_X10005_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10005_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10005_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10005_Y10002_GND));
defparam asyncreset_ctrl_X10005_Y10002_N0.coord_x = 11;
defparam asyncreset_ctrl_X10005_Y10002_N0.coord_y = 3;
defparam asyncreset_ctrl_X10005_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10005_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10005_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10005_Y10003_GND));
defparam asyncreset_ctrl_X10005_Y10003_N0.coord_x = 9;
defparam asyncreset_ctrl_X10005_Y10003_N0.coord_y = 1;
defparam asyncreset_ctrl_X10005_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10005_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10006_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10006_Y10001_GND));
defparam asyncreset_ctrl_X10006_Y10001_N1.coord_x = 18;
defparam asyncreset_ctrl_X10006_Y10001_N1.coord_y = 6;
defparam asyncreset_ctrl_X10006_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10006_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10006_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10006_Y10002_GND));
defparam asyncreset_ctrl_X10006_Y10002_N0.coord_x = 15;
defparam asyncreset_ctrl_X10006_Y10002_N0.coord_y = 6;
defparam asyncreset_ctrl_X10006_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10006_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10006_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10006_Y10003_GND));
defparam asyncreset_ctrl_X10006_Y10003_N0.coord_x = 11;
defparam asyncreset_ctrl_X10006_Y10003_N0.coord_y = 2;
defparam asyncreset_ctrl_X10006_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10006_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10007_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10007_Y10001_GND));
defparam asyncreset_ctrl_X10007_Y10001_N1.coord_x = 18;
defparam asyncreset_ctrl_X10007_Y10001_N1.coord_y = 7;
defparam asyncreset_ctrl_X10007_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10007_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10007_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10007_Y10002_GND));
defparam asyncreset_ctrl_X10007_Y10002_N0.coord_x = 16;
defparam asyncreset_ctrl_X10007_Y10002_N0.coord_y = 2;
defparam asyncreset_ctrl_X10007_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10007_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10007_Y10003_N1(
	.Din(),
	.Dout(AsyncReset_X10007_Y10003_GND));
defparam asyncreset_ctrl_X10007_Y10003_N1.coord_x = 18;
defparam asyncreset_ctrl_X10007_Y10003_N1.coord_y = 2;
defparam asyncreset_ctrl_X10007_Y10003_N1.coord_z = 1;
defparam asyncreset_ctrl_X10007_Y10003_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10008_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10008_Y10001_GND));
defparam asyncreset_ctrl_X10008_Y10001_N1.coord_x = 17;
defparam asyncreset_ctrl_X10008_Y10001_N1.coord_y = 11;
defparam asyncreset_ctrl_X10008_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10008_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10008_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10008_Y10002_GND));
defparam asyncreset_ctrl_X10008_Y10002_N0.coord_x = 15;
defparam asyncreset_ctrl_X10008_Y10002_N0.coord_y = 3;
defparam asyncreset_ctrl_X10008_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10008_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10008_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10008_Y10003_GND));
defparam asyncreset_ctrl_X10008_Y10003_N0.coord_x = 11;
defparam asyncreset_ctrl_X10008_Y10003_N0.coord_y = 1;
defparam asyncreset_ctrl_X10008_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10008_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10009_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10009_Y10001_GND));
defparam asyncreset_ctrl_X10009_Y10001_N1.coord_x = 17;
defparam asyncreset_ctrl_X10009_Y10001_N1.coord_y = 10;
defparam asyncreset_ctrl_X10009_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10009_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10009_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10009_Y10002_GND));
defparam asyncreset_ctrl_X10009_Y10002_N0.coord_x = 11;
defparam asyncreset_ctrl_X10009_Y10002_N0.coord_y = 4;
defparam asyncreset_ctrl_X10009_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10009_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10009_Y10003_N1(
	.Din(),
	.Dout(AsyncReset_X10009_Y10003_GND));
defparam asyncreset_ctrl_X10009_Y10003_N1.coord_x = 14;
defparam asyncreset_ctrl_X10009_Y10003_N1.coord_y = 4;
defparam asyncreset_ctrl_X10009_Y10003_N1.coord_z = 1;
defparam asyncreset_ctrl_X10009_Y10003_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10010_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10010_Y10001_GND));
defparam asyncreset_ctrl_X10010_Y10001_N1.coord_x = 19;
defparam asyncreset_ctrl_X10010_Y10001_N1.coord_y = 8;
defparam asyncreset_ctrl_X10010_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10010_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10010_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10010_Y10002_GND));
defparam asyncreset_ctrl_X10010_Y10002_N0.coord_x = 18;
defparam asyncreset_ctrl_X10010_Y10002_N0.coord_y = 10;
defparam asyncreset_ctrl_X10010_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10010_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10010_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10010_Y10003_GND));
defparam asyncreset_ctrl_X10010_Y10003_N0.coord_x = 9;
defparam asyncreset_ctrl_X10010_Y10003_N0.coord_y = 4;
defparam asyncreset_ctrl_X10010_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10010_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10011_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10011_Y10002_GND));
defparam asyncreset_ctrl_X10011_Y10002_N0.coord_x = 10;
defparam asyncreset_ctrl_X10011_Y10002_N0.coord_y = 3;
defparam asyncreset_ctrl_X10011_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10011_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10011_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10011_Y10003_GND));
defparam asyncreset_ctrl_X10011_Y10003_N0.coord_x = 17;
defparam asyncreset_ctrl_X10011_Y10003_N0.coord_y = 6;
defparam asyncreset_ctrl_X10011_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10011_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10012_Y10001_N1(
	.Din(),
	.Dout(AsyncReset_X10012_Y10001_GND));
defparam asyncreset_ctrl_X10012_Y10001_N1.coord_x = 19;
defparam asyncreset_ctrl_X10012_Y10001_N1.coord_y = 9;
defparam asyncreset_ctrl_X10012_Y10001_N1.coord_z = 1;
defparam asyncreset_ctrl_X10012_Y10001_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10012_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10012_Y10002_GND));
defparam asyncreset_ctrl_X10012_Y10002_N0.coord_x = 17;
defparam asyncreset_ctrl_X10012_Y10002_N0.coord_y = 4;
defparam asyncreset_ctrl_X10012_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10012_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10012_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10012_Y10003_GND));
defparam asyncreset_ctrl_X10012_Y10003_N0.coord_x = 14;
defparam asyncreset_ctrl_X10012_Y10003_N0.coord_y = 1;
defparam asyncreset_ctrl_X10012_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10012_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10014_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10014_Y10001_GND));
defparam asyncreset_ctrl_X10014_Y10001_N0.coord_x = 18;
defparam asyncreset_ctrl_X10014_Y10001_N0.coord_y = 3;
defparam asyncreset_ctrl_X10014_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10014_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10014_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10014_Y10002_GND));
defparam asyncreset_ctrl_X10014_Y10002_N0.coord_x = 12;
defparam asyncreset_ctrl_X10014_Y10002_N0.coord_y = 2;
defparam asyncreset_ctrl_X10014_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10014_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10014_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10014_Y10003_GND));
defparam asyncreset_ctrl_X10014_Y10003_N0.coord_x = 20;
defparam asyncreset_ctrl_X10014_Y10003_N0.coord_y = 6;
defparam asyncreset_ctrl_X10014_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10014_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10015_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10015_Y10001_GND));
defparam asyncreset_ctrl_X10015_Y10001_N0.coord_x = 16;
defparam asyncreset_ctrl_X10015_Y10001_N0.coord_y = 4;
defparam asyncreset_ctrl_X10015_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10015_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10015_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10015_Y10002_GND));
defparam asyncreset_ctrl_X10015_Y10002_N0.coord_x = 12;
defparam asyncreset_ctrl_X10015_Y10002_N0.coord_y = 4;
defparam asyncreset_ctrl_X10015_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10015_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10015_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10015_Y10003_GND));
defparam asyncreset_ctrl_X10015_Y10003_N0.coord_x = 10;
defparam asyncreset_ctrl_X10015_Y10003_N0.coord_y = 1;
defparam asyncreset_ctrl_X10015_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10015_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10016_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10016_Y10001_GND));
defparam asyncreset_ctrl_X10016_Y10001_N0.coord_x = 17;
defparam asyncreset_ctrl_X10016_Y10001_N0.coord_y = 2;
defparam asyncreset_ctrl_X10016_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10016_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10016_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10016_Y10002_GND));
defparam asyncreset_ctrl_X10016_Y10002_N0.coord_x = 12;
defparam asyncreset_ctrl_X10016_Y10002_N0.coord_y = 3;
defparam asyncreset_ctrl_X10016_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10016_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10016_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10016_Y10003_GND));
defparam asyncreset_ctrl_X10016_Y10003_N0.coord_x = 18;
defparam asyncreset_ctrl_X10016_Y10003_N0.coord_y = 1;
defparam asyncreset_ctrl_X10016_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10016_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10017_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10017_Y10001_GND));
defparam asyncreset_ctrl_X10017_Y10001_N0.coord_x = 15;
defparam asyncreset_ctrl_X10017_Y10001_N0.coord_y = 2;
defparam asyncreset_ctrl_X10017_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10017_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10017_Y10002_N1(
	.Din(),
	.Dout(AsyncReset_X10017_Y10002_GND));
defparam asyncreset_ctrl_X10017_Y10002_N1.coord_x = 14;
defparam asyncreset_ctrl_X10017_Y10002_N1.coord_y = 3;
defparam asyncreset_ctrl_X10017_Y10002_N1.coord_z = 1;
defparam asyncreset_ctrl_X10017_Y10002_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10017_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10017_Y10003_GND));
defparam asyncreset_ctrl_X10017_Y10003_N0.coord_x = 20;
defparam asyncreset_ctrl_X10017_Y10003_N0.coord_y = 10;
defparam asyncreset_ctrl_X10017_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10017_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10018_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10018_Y10001_GND));
defparam asyncreset_ctrl_X10018_Y10001_N0.coord_x = 10;
defparam asyncreset_ctrl_X10018_Y10001_N0.coord_y = 4;
defparam asyncreset_ctrl_X10018_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10018_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10018_Y10002_N1(
	.Din(),
	.Dout(AsyncReset_X10018_Y10002_GND));
defparam asyncreset_ctrl_X10018_Y10002_N1.coord_x = 14;
defparam asyncreset_ctrl_X10018_Y10002_N1.coord_y = 6;
defparam asyncreset_ctrl_X10018_Y10002_N1.coord_z = 1;
defparam asyncreset_ctrl_X10018_Y10002_N1.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10018_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10018_Y10003_GND));
defparam asyncreset_ctrl_X10018_Y10003_N0.coord_x = 20;
defparam asyncreset_ctrl_X10018_Y10003_N0.coord_y = 8;
defparam asyncreset_ctrl_X10018_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10018_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10019_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10019_Y10001_GND));
defparam asyncreset_ctrl_X10019_Y10001_N0.coord_x = 16;
defparam asyncreset_ctrl_X10019_Y10001_N0.coord_y = 3;
defparam asyncreset_ctrl_X10019_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10019_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10019_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10019_Y10002_GND));
defparam asyncreset_ctrl_X10019_Y10002_N0.coord_x = 15;
defparam asyncreset_ctrl_X10019_Y10002_N0.coord_y = 1;
defparam asyncreset_ctrl_X10019_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10019_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10019_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10019_Y10003_GND));
defparam asyncreset_ctrl_X10019_Y10003_N0.coord_x = 20;
defparam asyncreset_ctrl_X10019_Y10003_N0.coord_y = 7;
defparam asyncreset_ctrl_X10019_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10019_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10020_Y10001_N0(
	.Din(),
	.Dout(AsyncReset_X10020_Y10001_GND));
defparam asyncreset_ctrl_X10020_Y10001_N0.coord_x = 10;
defparam asyncreset_ctrl_X10020_Y10001_N0.coord_y = 2;
defparam asyncreset_ctrl_X10020_Y10001_N0.coord_z = 0;
defparam asyncreset_ctrl_X10020_Y10001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10020_Y10002_N0(
	.Din(),
	.Dout(AsyncReset_X10020_Y10002_GND));
defparam asyncreset_ctrl_X10020_Y10002_N0.coord_x = 16;
defparam asyncreset_ctrl_X10020_Y10002_N0.coord_y = 1;
defparam asyncreset_ctrl_X10020_Y10002_N0.coord_z = 0;
defparam asyncreset_ctrl_X10020_Y10002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X10020_Y10003_N0(
	.Din(),
	.Dout(AsyncReset_X10020_Y10003_GND));
defparam asyncreset_ctrl_X10020_Y10003_N0.coord_x = 9;
defparam asyncreset_ctrl_X10020_Y10003_N0.coord_y = 3;
defparam asyncreset_ctrl_X10020_Y10003_N0.coord_z = 0;
defparam asyncreset_ctrl_X10020_Y10003_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X5017_Y5012_N0(
	.Din(),
	.Dout(AsyncReset_X5017_Y5012_GND));
defparam asyncreset_ctrl_X5017_Y5012_N0.coord_x = 17;
defparam asyncreset_ctrl_X5017_Y5012_N0.coord_y = 12;
defparam asyncreset_ctrl_X5017_Y5012_N0.coord_z = 0;
defparam asyncreset_ctrl_X5017_Y5012_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X5019_Y5012_N0(
	.Din(),
	.Dout(AsyncReset_X5019_Y5012_GND));
defparam asyncreset_ctrl_X5019_Y5012_N0.coord_x = 19;
defparam asyncreset_ctrl_X5019_Y5012_N0.coord_y = 12;
defparam asyncreset_ctrl_X5019_Y5012_N0.coord_z = 0;
defparam asyncreset_ctrl_X5019_Y5012_N0.AsyncCtrlMux = 2'b00;

alta_clkenctrl clken_ctrl_X10001_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brin_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10001_Y10001_SIG_SIG ));
defparam clken_ctrl_X10001_Y10001_N0.coord_x = 20;
defparam clken_ctrl_X10001_Y10001_N0.coord_y = 9;
defparam clken_ctrl_X10001_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10001_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10001_Y10001_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10001_Y10002_N0(
	.ClkIn(GCLK),
	.ClkEn(),
	.ClkOut(GCLK_X10001_Y10002_SIG_VCC));
defparam clken_ctrl_X10001_Y10002_N0.coord_x = 18;
defparam clken_ctrl_X10001_Y10002_N0.coord_y = 4;
defparam clken_ctrl_X10001_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10001_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10001_Y10002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10001_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10001_Y10003_SIG_SIG ));
defparam clken_ctrl_X10001_Y10003_N0.coord_x = 12;
defparam clken_ctrl_X10001_Y10003_N0.coord_y = 1;
defparam clken_ctrl_X10001_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10001_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10001_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10001_Y10003_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10001_Y10003_SIG_SIG ));
defparam clken_ctrl_X10001_Y10003_N1.coord_x = 12;
defparam clken_ctrl_X10001_Y10003_N1.coord_y = 1;
defparam clken_ctrl_X10001_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10001_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10001_Y10003_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10002_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|lockb_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ));
defparam clken_ctrl_X10002_Y10001_N1.coord_x = 19;
defparam clken_ctrl_X10002_Y10001_N1.coord_y = 6;
defparam clken_ctrl_X10002_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10002_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10002_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10002_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10002_Y10002_SIG_SIG ));
defparam clken_ctrl_X10002_Y10002_N0.coord_x = 15;
defparam clken_ctrl_X10002_Y10002_N0.coord_y = 4;
defparam clken_ctrl_X10002_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10002_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10002_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10002_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10002_Y10002_SIG_SIG ));
defparam clken_ctrl_X10002_Y10002_N1.coord_x = 15;
defparam clken_ctrl_X10002_Y10002_N1.coord_y = 4;
defparam clken_ctrl_X10002_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10002_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10002_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10002_Y10003_N1(
	.ClkIn(GCLK),
	.ClkEn(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y ),
	.ClkOut(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ));
defparam clken_ctrl_X10002_Y10003_N1.coord_x = 14;
defparam clken_ctrl_X10002_Y10003_N1.coord_y = 2;
defparam clken_ctrl_X10002_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10002_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10002_Y10003_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10003_Y10002_N1(
	.ClkIn(GCLK),
	.ClkEn(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y ),
	.ClkOut(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ));
defparam clken_ctrl_X10003_Y10002_N1.coord_x = 19;
defparam clken_ctrl_X10003_Y10002_N1.coord_y = 3;
defparam clken_ctrl_X10003_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10003_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10003_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10003_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10003_Y10003_SIG_SIG ));
defparam clken_ctrl_X10003_Y10003_N0.coord_x = 9;
defparam clken_ctrl_X10003_Y10003_N0.coord_y = 2;
defparam clken_ctrl_X10003_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10003_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10003_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10004_Y10001_N0(
	.ClkIn(BCLK2_i_o),
	.ClkEn(),
	.ClkOut(BCLK2_i_o_X10004_Y10001_SIG_VCC));
defparam clken_ctrl_X10004_Y10001_N0.coord_x = 19;
defparam clken_ctrl_X10004_Y10001_N0.coord_y = 7;
defparam clken_ctrl_X10004_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10004_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10004_Y10001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10004_Y10001_N1(
	.ClkIn(BCLK1_i_o),
	.ClkEn(),
	.ClkOut(BCLK1_i_o_X10004_Y10001_SIG_VCC));
defparam clken_ctrl_X10004_Y10001_N1.coord_x = 19;
defparam clken_ctrl_X10004_Y10001_N1.coord_y = 7;
defparam clken_ctrl_X10004_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10004_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10004_Y10001_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10004_Y10002_N1(
	.ClkIn(GCLK),
	.ClkEn(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y ),
	.ClkOut(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ));
defparam clken_ctrl_X10004_Y10002_N1.coord_x = 19;
defparam clken_ctrl_X10004_Y10002_N1.coord_y = 1;
defparam clken_ctrl_X10004_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10004_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10004_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10004_Y10003_N1(
	.ClkIn(GCLK),
	.ClkEn(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y ),
	.ClkOut(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ));
defparam clken_ctrl_X10004_Y10003_N1.coord_x = 17;
defparam clken_ctrl_X10004_Y10003_N1.coord_y = 3;
defparam clken_ctrl_X10004_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10004_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10004_Y10003_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10005_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10005_Y10001_SIG_VCC));
defparam clken_ctrl_X10005_Y10001_N0.coord_x = 19;
defparam clken_ctrl_X10005_Y10001_N0.coord_y = 5;
defparam clken_ctrl_X10005_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10005_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10005_Y10001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10005_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|lockb_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10005_Y10001_SIG_SIG ));
defparam clken_ctrl_X10005_Y10001_N1.coord_x = 19;
defparam clken_ctrl_X10005_Y10001_N1.coord_y = 5;
defparam clken_ctrl_X10005_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10005_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10005_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10005_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10005_Y10002_SIG_VCC));
defparam clken_ctrl_X10005_Y10002_N0.coord_x = 11;
defparam clken_ctrl_X10005_Y10002_N0.coord_y = 3;
defparam clken_ctrl_X10005_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10005_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10005_Y10002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10005_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10005_Y10003_SIG_SIG ));
defparam clken_ctrl_X10005_Y10003_N0.coord_x = 9;
defparam clken_ctrl_X10005_Y10003_N0.coord_y = 1;
defparam clken_ctrl_X10005_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10005_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10005_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10006_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brin_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10006_Y10001_SIG_SIG ));
defparam clken_ctrl_X10006_Y10001_N1.coord_x = 18;
defparam clken_ctrl_X10006_Y10001_N1.coord_y = 6;
defparam clken_ctrl_X10006_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10006_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10006_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10006_Y10002_N0(
	.ClkIn(\i2s_osd_select_2|BCLKD ),
	.ClkEn(),
	.ClkOut(\i2s_osd_select_2|BCLKD_X10006_Y10002_INV_VCC ));
defparam clken_ctrl_X10006_Y10002_N0.coord_x = 15;
defparam clken_ctrl_X10006_Y10002_N0.coord_y = 6;
defparam clken_ctrl_X10006_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10006_Y10002_N0.ClkMux = 2'b11;
defparam clken_ctrl_X10006_Y10002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10006_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10006_Y10003_SIG_VCC));
defparam clken_ctrl_X10006_Y10003_N0.coord_x = 11;
defparam clken_ctrl_X10006_Y10003_N0.coord_y = 2;
defparam clken_ctrl_X10006_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10006_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10006_Y10003_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10007_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brin_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ));
defparam clken_ctrl_X10007_Y10001_N1.coord_x = 18;
defparam clken_ctrl_X10007_Y10001_N1.coord_y = 7;
defparam clken_ctrl_X10007_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10007_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10007_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10007_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_X10007_Y10002_SIG_SIG ));
defparam clken_ctrl_X10007_Y10002_N0.coord_x = 16;
defparam clken_ctrl_X10007_Y10002_N0.coord_y = 2;
defparam clken_ctrl_X10007_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10007_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10007_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10007_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_11_q_A_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10007_Y10002_SIG_SIG ));
defparam clken_ctrl_X10007_Y10002_N1.coord_x = 16;
defparam clken_ctrl_X10007_Y10002_N1.coord_y = 2;
defparam clken_ctrl_X10007_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10007_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10007_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10007_Y10003_N1(
	.ClkIn(GCLK),
	.ClkEn(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y ),
	.ClkOut(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ));
defparam clken_ctrl_X10007_Y10003_N1.coord_x = 18;
defparam clken_ctrl_X10007_Y10003_N1.coord_y = 2;
defparam clken_ctrl_X10007_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10007_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10007_Y10003_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10008_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brip_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ));
defparam clken_ctrl_X10008_Y10001_N1.coord_x = 17;
defparam clken_ctrl_X10008_Y10001_N1.coord_y = 11;
defparam clken_ctrl_X10008_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10008_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10008_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10008_Y10002_N0(
	.ClkIn(\i2s_osd_select_1|BCLKD ),
	.ClkEn(),
	.ClkOut(\i2s_osd_select_1|BCLKD_X10008_Y10002_INV_VCC ));
defparam clken_ctrl_X10008_Y10002_N0.coord_x = 15;
defparam clken_ctrl_X10008_Y10002_N0.coord_y = 3;
defparam clken_ctrl_X10008_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10008_Y10002_N0.ClkMux = 2'b11;
defparam clken_ctrl_X10008_Y10002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10008_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10008_Y10003_SIG_SIG ));
defparam clken_ctrl_X10008_Y10003_N0.coord_x = 11;
defparam clken_ctrl_X10008_Y10003_N0.coord_y = 1;
defparam clken_ctrl_X10008_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10008_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10008_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10009_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brip_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10009_Y10001_SIG_SIG ));
defparam clken_ctrl_X10009_Y10001_N1.coord_x = 17;
defparam clken_ctrl_X10009_Y10001_N1.coord_y = 10;
defparam clken_ctrl_X10009_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10009_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10009_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10009_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10009_Y10002_SIG_SIG ));
defparam clken_ctrl_X10009_Y10002_N0.coord_x = 11;
defparam clken_ctrl_X10009_Y10002_N0.coord_y = 4;
defparam clken_ctrl_X10009_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10009_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10009_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10009_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10009_Y10002_SIG_SIG ));
defparam clken_ctrl_X10009_Y10002_N1.coord_x = 11;
defparam clken_ctrl_X10009_Y10002_N1.coord_y = 4;
defparam clken_ctrl_X10009_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10009_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10009_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10009_Y10003_N1(
	.ClkIn(GCLK),
	.ClkEn(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y ),
	.ClkOut(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ));
defparam clken_ctrl_X10009_Y10003_N1.coord_x = 14;
defparam clken_ctrl_X10009_Y10003_N1.coord_y = 4;
defparam clken_ctrl_X10009_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10009_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10009_Y10003_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10010_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10010_Y10001_SIG_VCC));
defparam clken_ctrl_X10010_Y10001_N0.coord_x = 19;
defparam clken_ctrl_X10010_Y10001_N0.coord_y = 8;
defparam clken_ctrl_X10010_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10010_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10010_Y10001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10010_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|locka_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10010_Y10001_SIG_SIG ));
defparam clken_ctrl_X10010_Y10001_N1.coord_x = 19;
defparam clken_ctrl_X10010_Y10001_N1.coord_y = 8;
defparam clken_ctrl_X10010_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10010_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10010_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10010_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brip_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ));
defparam clken_ctrl_X10010_Y10002_N0.coord_x = 18;
defparam clken_ctrl_X10010_Y10002_N0.coord_y = 10;
defparam clken_ctrl_X10010_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10010_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10010_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10010_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10010_Y10003_SIG_VCC));
defparam clken_ctrl_X10010_Y10003_N0.coord_x = 9;
defparam clken_ctrl_X10010_Y10003_N0.coord_y = 4;
defparam clken_ctrl_X10010_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10010_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10010_Y10003_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10011_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10011_Y10002_SIG_VCC));
defparam clken_ctrl_X10011_Y10002_N0.coord_x = 10;
defparam clken_ctrl_X10011_Y10002_N0.coord_y = 3;
defparam clken_ctrl_X10011_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10011_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10011_Y10002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10011_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|brin_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ));
defparam clken_ctrl_X10011_Y10003_N0.coord_x = 17;
defparam clken_ctrl_X10011_Y10003_N0.coord_y = 6;
defparam clken_ctrl_X10011_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10011_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10011_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10012_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|locka_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ));
defparam clken_ctrl_X10012_Y10001_N1.coord_x = 19;
defparam clken_ctrl_X10012_Y10001_N1.coord_y = 9;
defparam clken_ctrl_X10012_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10012_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10012_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10012_Y10002_N0(
	.ClkIn(GCLK),
	.ClkEn(),
	.ClkOut(GCLK_X10012_Y10002_SIG_VCC));
defparam clken_ctrl_X10012_Y10002_N0.coord_x = 17;
defparam clken_ctrl_X10012_Y10002_N0.coord_y = 4;
defparam clken_ctrl_X10012_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10012_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10012_Y10002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10012_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10012_Y10003_SIG_SIG ));
defparam clken_ctrl_X10012_Y10003_N0.coord_x = 14;
defparam clken_ctrl_X10012_Y10003_N0.coord_y = 1;
defparam clken_ctrl_X10012_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10012_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10012_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10014_Y10001_N0(
	.ClkIn(GCLK),
	.ClkEn(),
	.ClkOut(GCLK_X10014_Y10001_SIG_VCC));
defparam clken_ctrl_X10014_Y10001_N0.coord_x = 18;
defparam clken_ctrl_X10014_Y10001_N0.coord_y = 3;
defparam clken_ctrl_X10014_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10014_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10014_Y10001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10014_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10014_Y10002_SIG_SIG ));
defparam clken_ctrl_X10014_Y10002_N0.coord_x = 12;
defparam clken_ctrl_X10014_Y10002_N0.coord_y = 2;
defparam clken_ctrl_X10014_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10014_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10014_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10014_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10014_Y10002_SIG_SIG ));
defparam clken_ctrl_X10014_Y10002_N1.coord_x = 12;
defparam clken_ctrl_X10014_Y10002_N1.coord_y = 2;
defparam clken_ctrl_X10014_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10014_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10014_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10014_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|lockb_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ));
defparam clken_ctrl_X10014_Y10003_N0.coord_x = 20;
defparam clken_ctrl_X10014_Y10003_N0.coord_y = 6;
defparam clken_ctrl_X10014_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10014_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10014_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10014_Y10003_N1(
	.ClkIn(BCLK2_i_o),
	.ClkEn(),
	.ClkOut(BCLK2_i_o_X10014_Y10003_SIG_VCC));
defparam clken_ctrl_X10014_Y10003_N1.coord_x = 20;
defparam clken_ctrl_X10014_Y10003_N1.coord_y = 6;
defparam clken_ctrl_X10014_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10014_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10014_Y10003_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10015_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_11_q_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10015_Y10001_SIG_SIG ));
defparam clken_ctrl_X10015_Y10001_N0.coord_x = 16;
defparam clken_ctrl_X10015_Y10001_N0.coord_y = 4;
defparam clken_ctrl_X10015_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10015_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10015_Y10001_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10015_Y10001_N1(
	.ClkIn(GCLK),
	.ClkEn(),
	.ClkOut(GCLK_X10015_Y10001_SIG_VCC));
defparam clken_ctrl_X10015_Y10001_N1.coord_x = 16;
defparam clken_ctrl_X10015_Y10001_N1.coord_y = 4;
defparam clken_ctrl_X10015_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10015_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10015_Y10001_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10015_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10015_Y10002_SIG_SIG ));
defparam clken_ctrl_X10015_Y10002_N0.coord_x = 12;
defparam clken_ctrl_X10015_Y10002_N0.coord_y = 4;
defparam clken_ctrl_X10015_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10015_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10015_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10015_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10015_Y10002_SIG_SIG ));
defparam clken_ctrl_X10015_Y10002_N1.coord_x = 12;
defparam clken_ctrl_X10015_Y10002_N1.coord_y = 4;
defparam clken_ctrl_X10015_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10015_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10015_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10015_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10015_Y10003_SIG_SIG ));
defparam clken_ctrl_X10015_Y10003_N0.coord_x = 10;
defparam clken_ctrl_X10015_Y10003_N0.coord_y = 1;
defparam clken_ctrl_X10015_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10015_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10015_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10016_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_11_q_A_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ));
defparam clken_ctrl_X10016_Y10001_N0.coord_x = 17;
defparam clken_ctrl_X10016_Y10001_N0.coord_y = 2;
defparam clken_ctrl_X10016_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10016_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10016_Y10001_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10016_Y10001_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_11_q_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10016_Y10001_SIG_SIG ));
defparam clken_ctrl_X10016_Y10001_N1.coord_x = 17;
defparam clken_ctrl_X10016_Y10001_N1.coord_y = 2;
defparam clken_ctrl_X10016_Y10001_N1.coord_z = 1;
defparam clken_ctrl_X10016_Y10001_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10016_Y10001_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10016_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10016_Y10002_SIG_SIG ));
defparam clken_ctrl_X10016_Y10002_N0.coord_x = 12;
defparam clken_ctrl_X10016_Y10002_N0.coord_y = 3;
defparam clken_ctrl_X10016_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10016_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10016_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10016_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10016_Y10002_SIG_SIG ));
defparam clken_ctrl_X10016_Y10002_N1.coord_x = 12;
defparam clken_ctrl_X10016_Y10002_N1.coord_y = 3;
defparam clken_ctrl_X10016_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10016_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10016_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10016_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10016_Y10003_SIG_SIG ));
defparam clken_ctrl_X10016_Y10003_N0.coord_x = 18;
defparam clken_ctrl_X10016_Y10003_N0.coord_y = 1;
defparam clken_ctrl_X10016_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10016_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10016_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10016_Y10003_N1(
	.ClkIn(GCLK),
	.ClkEn(),
	.ClkOut(GCLK_X10016_Y10003_SIG_VCC));
defparam clken_ctrl_X10016_Y10003_N1.coord_x = 18;
defparam clken_ctrl_X10016_Y10003_N1.coord_y = 1;
defparam clken_ctrl_X10016_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10016_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10016_Y10003_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10017_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ));
defparam clken_ctrl_X10017_Y10001_N0.coord_x = 15;
defparam clken_ctrl_X10017_Y10001_N0.coord_y = 2;
defparam clken_ctrl_X10017_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10017_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10017_Y10001_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10017_Y10002_N1(
	.ClkIn(\i2s_osd_select_1|BCLKD ),
	.ClkEn(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y ),
	.ClkOut(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ));
defparam clken_ctrl_X10017_Y10002_N1.coord_x = 14;
defparam clken_ctrl_X10017_Y10002_N1.coord_y = 3;
defparam clken_ctrl_X10017_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10017_Y10002_N1.ClkMux = 2'b11;
defparam clken_ctrl_X10017_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10017_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10017_Y10003_SIG_VCC));
defparam clken_ctrl_X10017_Y10003_N0.coord_x = 20;
defparam clken_ctrl_X10017_Y10003_N0.coord_y = 10;
defparam clken_ctrl_X10017_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10017_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10017_Y10003_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10018_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(),
	.ClkOut(CLKOSC_i_o_X10018_Y10001_SIG_VCC));
defparam clken_ctrl_X10018_Y10001_N0.coord_x = 10;
defparam clken_ctrl_X10018_Y10001_N0.coord_y = 4;
defparam clken_ctrl_X10018_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10018_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10018_Y10001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10018_Y10002_N1(
	.ClkIn(\i2s_osd_select_2|BCLKD ),
	.ClkEn(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y ),
	.ClkOut(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ));
defparam clken_ctrl_X10018_Y10002_N1.coord_x = 14;
defparam clken_ctrl_X10018_Y10002_N1.coord_y = 6;
defparam clken_ctrl_X10018_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10018_Y10002_N1.ClkMux = 2'b11;
defparam clken_ctrl_X10018_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10018_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|locka_rec_A_0_Y_B_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ));
defparam clken_ctrl_X10018_Y10003_N0.coord_x = 20;
defparam clken_ctrl_X10018_Y10003_N0.coord_y = 8;
defparam clken_ctrl_X10018_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10018_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10018_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10019_Y10001_N0(
	.ClkIn(GCLK),
	.ClkEn(),
	.ClkOut(GCLK_X10019_Y10001_SIG_VCC));
defparam clken_ctrl_X10019_Y10001_N0.coord_x = 16;
defparam clken_ctrl_X10019_Y10001_N0.coord_y = 3;
defparam clken_ctrl_X10019_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10019_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10019_Y10001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10019_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10019_Y10002_SIG_SIG ));
defparam clken_ctrl_X10019_Y10002_N0.coord_x = 15;
defparam clken_ctrl_X10019_Y10002_N0.coord_y = 1;
defparam clken_ctrl_X10019_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10019_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10019_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10019_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|sda_d_0_11_q_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10019_Y10002_SIG_SIG ));
defparam clken_ctrl_X10019_Y10002_N1.coord_x = 15;
defparam clken_ctrl_X10019_Y10002_N1.coord_y = 1;
defparam clken_ctrl_X10019_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10019_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10019_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10019_Y10003_N0(
	.ClkIn(BCLK1_i_o),
	.ClkEn(),
	.ClkOut(BCLK1_i_o_X10019_Y10003_SIG_VCC));
defparam clken_ctrl_X10019_Y10003_N0.coord_x = 20;
defparam clken_ctrl_X10019_Y10003_N0.coord_y = 7;
defparam clken_ctrl_X10019_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10019_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10019_Y10003_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10019_Y10003_N1(
	.ClkIn(BCLK2_i_o),
	.ClkEn(),
	.ClkOut(BCLK2_i_o_X10019_Y10003_SIG_VCC));
defparam clken_ctrl_X10019_Y10003_N1.coord_x = 20;
defparam clken_ctrl_X10019_Y10003_N1.coord_y = 7;
defparam clken_ctrl_X10019_Y10003_N1.coord_z = 1;
defparam clken_ctrl_X10019_Y10003_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10019_Y10003_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X10020_Y10001_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10020_Y10001_SIG_SIG ));
defparam clken_ctrl_X10020_Y10001_N0.coord_x = 10;
defparam clken_ctrl_X10020_Y10001_N0.coord_y = 2;
defparam clken_ctrl_X10020_Y10001_N0.coord_z = 0;
defparam clken_ctrl_X10020_Y10001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10020_Y10001_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10020_Y10002_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10020_Y10002_SIG_SIG ));
defparam clken_ctrl_X10020_Y10002_N0.coord_x = 16;
defparam clken_ctrl_X10020_Y10002_N0.coord_y = 1;
defparam clken_ctrl_X10020_Y10002_N0.coord_z = 0;
defparam clken_ctrl_X10020_Y10002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10020_Y10002_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10020_Y10002_N1(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10020_Y10002_SIG_SIG ));
defparam clken_ctrl_X10020_Y10002_N1.coord_x = 16;
defparam clken_ctrl_X10020_Y10002_N1.coord_y = 1;
defparam clken_ctrl_X10020_Y10002_N1.coord_z = 1;
defparam clken_ctrl_X10020_Y10002_N1.ClkMux = 2'b10;
defparam clken_ctrl_X10020_Y10002_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X10020_Y10003_N0(
	.ClkIn(CLKOSC_i_o),
	.ClkEn(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.ClkOut(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10020_Y10003_SIG_SIG ));
defparam clken_ctrl_X10020_Y10003_N0.coord_x = 9;
defparam clken_ctrl_X10020_Y10003_N0.coord_y = 3;
defparam clken_ctrl_X10020_Y10003_N0.coord_z = 0;
defparam clken_ctrl_X10020_Y10003_N0.ClkMux = 2'b10;
defparam clken_ctrl_X10020_Y10003_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X5017_Y5012_N0(
	.ClkIn(\i2s_osd_select_1|BCLKD ),
	.ClkEn(),
	.ClkOut(\i2s_osd_select_1|BCLKD_X5017_Y5012_SIG_VCC ));
defparam clken_ctrl_X5017_Y5012_N0.coord_x = 17;
defparam clken_ctrl_X5017_Y5012_N0.coord_y = 12;
defparam clken_ctrl_X5017_Y5012_N0.coord_z = 0;
defparam clken_ctrl_X5017_Y5012_N0.ClkMux = 2'b10;
defparam clken_ctrl_X5017_Y5012_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X5017_Y5012_N1(
	.ClkIn(\i2s_osd_select_1|BCLKD ),
	.ClkEn(),
	.ClkOut(\i2s_osd_select_1|BCLKD_X5017_Y5012_INV_VCC ));
defparam clken_ctrl_X5017_Y5012_N1.coord_x = 17;
defparam clken_ctrl_X5017_Y5012_N1.coord_y = 12;
defparam clken_ctrl_X5017_Y5012_N1.coord_z = 1;
defparam clken_ctrl_X5017_Y5012_N1.ClkMux = 2'b11;
defparam clken_ctrl_X5017_Y5012_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X5019_Y5012_N0(
	.ClkIn(\i2s_osd_select_2|BCLKD ),
	.ClkEn(),
	.ClkOut(\i2s_osd_select_2|BCLKD_X5019_Y5012_SIG_VCC ));
defparam clken_ctrl_X5019_Y5012_N0.coord_x = 19;
defparam clken_ctrl_X5019_Y5012_N0.coord_y = 12;
defparam clken_ctrl_X5019_Y5012_N0.coord_z = 0;
defparam clken_ctrl_X5019_Y5012_N0.ClkMux = 2'b10;
defparam clken_ctrl_X5019_Y5012_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X5019_Y5012_N1(
	.ClkIn(\i2s_osd_select_2|BCLKD ),
	.ClkEn(),
	.ClkOut(\i2s_osd_select_2|BCLKD_X5019_Y5012_INV_VCC ));
defparam clken_ctrl_X5019_Y5012_N1.coord_x = 19;
defparam clken_ctrl_X5019_Y5012_N1.coord_y = 12;
defparam clken_ctrl_X5019_Y5012_N1.coord_z = 1;
defparam clken_ctrl_X5019_Y5012_N1.ClkMux = 2'b11;
defparam clken_ctrl_X5019_Y5012_N1.ClkEnMux = 2'b01;

alta_pllve \gclk|global_clock (
	.clkin(CLKOSC_i_o_int),
	.clkfb(CLKFB),
	.pfden(vcc),
	.resetn(vcc),
	.phasecounterselect({gnd, gnd, gnd}),
	.phaseupdown(gnd),
	.phasestep(gnd),
	.scanclk(gnd),
	.scanclkena(gnd),
	.scandata(gnd),
	.configupdate(gnd),
	.scandataout(\gclk|global_clock_scandataout ),
	.scandone(\gclk|global_clock_scandone ),
	.phasedone(\gclk|global_clock_phasedone ),
	.clkout0(GCLK_int),
	.clkout1(\gclk|clkout1 ),
	.clkout2(\gclk|clkout2 ),
	.clkout3(\gclk|clkout3 ),
	.clkout4(\gclk|clkout4 ),
	.clkfbout(CLKFB),
	.lock(\gclk|global_clock_lock ));
defparam \gclk|global_clock .coord_x = 22;
defparam \gclk|global_clock .coord_y = 5;
defparam \gclk|global_clock .coord_z = 0;
defparam \gclk|global_clock .CLKIN_HIGH = 8'b11111111;
defparam \gclk|global_clock .CLKIN_LOW = 8'b11111111;
defparam \gclk|global_clock .CLKIN_TRIM = 1'b0;
defparam \gclk|global_clock .CLKIN_BYPASS = 1'b1;
defparam \gclk|global_clock .CLKFB_HIGH = 8'b00111001;
defparam \gclk|global_clock .CLKFB_LOW = 8'b00111010;
defparam \gclk|global_clock .CLKFB_TRIM = 1'b0;
defparam \gclk|global_clock .CLKFB_BYPASS = 1'b0;
defparam \gclk|global_clock .CLKDIV0_EN = 1'b1;
defparam \gclk|global_clock .CLKDIV1_EN = 1'b0;
defparam \gclk|global_clock .CLKDIV2_EN = 1'b0;
defparam \gclk|global_clock .CLKDIV3_EN = 1'b0;
defparam \gclk|global_clock .CLKDIV4_EN = 1'b0;
defparam \gclk|global_clock .CLKOUT0_HIGH = 8'b00001100;
defparam \gclk|global_clock .CLKOUT0_LOW = 8'b00001100;
defparam \gclk|global_clock .CLKOUT0_TRIM = 1'b0;
defparam \gclk|global_clock .CLKOUT0_BYPASS = 1'b0;
defparam \gclk|global_clock .CLKOUT1_HIGH = 8'b11111111;
defparam \gclk|global_clock .CLKOUT1_LOW = 8'b11111111;
defparam \gclk|global_clock .CLKOUT1_TRIM = 1'b0;
defparam \gclk|global_clock .CLKOUT1_BYPASS = 1'b0;
defparam \gclk|global_clock .CLKOUT2_HIGH = 8'b11111111;
defparam \gclk|global_clock .CLKOUT2_LOW = 8'b11111111;
defparam \gclk|global_clock .CLKOUT2_TRIM = 1'b0;
defparam \gclk|global_clock .CLKOUT2_BYPASS = 1'b0;
defparam \gclk|global_clock .CLKOUT3_HIGH = 8'b11111111;
defparam \gclk|global_clock .CLKOUT3_LOW = 8'b11111111;
defparam \gclk|global_clock .CLKOUT3_TRIM = 1'b0;
defparam \gclk|global_clock .CLKOUT3_BYPASS = 1'b0;
defparam \gclk|global_clock .CLKOUT4_HIGH = 8'b11111111;
defparam \gclk|global_clock .CLKOUT4_LOW = 8'b11111111;
defparam \gclk|global_clock .CLKOUT4_TRIM = 1'b0;
defparam \gclk|global_clock .CLKOUT4_BYPASS = 1'b0;
defparam \gclk|global_clock .CLKOUT0_DEL = 8'b00000000;
defparam \gclk|global_clock .CLKOUT1_DEL = 8'b00000000;
defparam \gclk|global_clock .CLKOUT2_DEL = 8'b00000000;
defparam \gclk|global_clock .CLKOUT3_DEL = 8'b00000000;
defparam \gclk|global_clock .CLKOUT4_DEL = 8'b00000000;
defparam \gclk|global_clock .CLKOUT0_PHASE = 3'b000;
defparam \gclk|global_clock .CLKOUT1_PHASE = 3'b000;
defparam \gclk|global_clock .CLKOUT2_PHASE = 3'b000;
defparam \gclk|global_clock .CLKOUT3_PHASE = 3'b000;
defparam \gclk|global_clock .CLKOUT4_PHASE = 3'b000;
defparam \gclk|global_clock .CLKFB_DEL = 8'b00000000;
defparam \gclk|global_clock .CLKFB_PHASE = 3'b000;
defparam \gclk|global_clock .FEEDBACK_MODE = 3'b100;
defparam \gclk|global_clock .FBDELAY_VAL = 3'b100;
defparam \gclk|global_clock .PLLOUTP_EN = 1'b0;
defparam \gclk|global_clock .PLLOUTN_EN = 1'b0;
defparam \gclk|global_clock .CLKOUT1_CASCADE = 1'b0;
defparam \gclk|global_clock .CLKOUT2_CASCADE = 1'b0;
defparam \gclk|global_clock .CLKOUT3_CASCADE = 1'b0;
defparam \gclk|global_clock .CLKOUT4_CASCADE = 1'b0;
defparam \gclk|global_clock .VCO_POST_DIV = 1'b0;
defparam \gclk|global_clock .REG_CTRL = 2'b00;
defparam \gclk|global_clock .CP = 3'b100;
defparam \gclk|global_clock .RREF = 2'b01;
defparam \gclk|global_clock .RVI = 2'b01;
defparam \gclk|global_clock .IVCO = 3'b010;
defparam \gclk|global_clock .PLL_EN_FLAG = 1'b1;

alta_io_gclk \gclk|global_clock|clkout0~ALTA_GCLK (
	.inclk(GCLK_int),
	.outclk(GCLK));
defparam \gclk|global_clock|clkout0~ALTA_GCLK .coord_x = 22;
defparam \gclk|global_clock|clkout0~ALTA_GCLK .coord_y = 4;
defparam \gclk|global_clock|clkout0~ALTA_GCLK .coord_z = 0;

alta_slice \gnd~I (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\gnd~I_int ),
	.Cout(),
	.Q());
defparam \gnd~I .coord_x = 17;
defparam \gnd~I .coord_y = 2;
defparam \gnd~I .coord_z = 15;
defparam \gnd~I .mask = 16'h0000;
defparam \gnd~I .modeMux = 1'b1;
defparam \gnd~I .FeedbackMux = 1'b0;
defparam \gnd~I .ShiftMux = 1'b0;
defparam \gnd~I .BypassEn = 1'b0;
defparam \gnd~I .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_dataa_0 (
	.A(CSEL2_q_1[2]),
	.B(CSEL2_q_1[1]),
	.C(\i2c_device|OFFSET_PRIMARY [0]),
	.D(CSEL2_q_1[3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_12_q_dataa_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .coord_z = 11;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .mask = 16'h153F;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_dataa_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [8]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .coord_z = 10;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .mask = 16'hF0F0;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_datab_1_1 (
	.A(CSEL2_q_1[2]),
	.B(CSEL2_q_1[1]),
	.C(CSEL1_q_1[3]),
	.D(\i2c_device|OFFSET_PRIMARY [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .coord_z = 12;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .mask = 16'h135F;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_1_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_datab_2_1 (
	.A(CSEL2_q_1[1]),
	.B(\i2c_device|OFFSET_SECONDARY [2]),
	.C(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.D(\i2c_device|OFFSET_PRIMARY [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_q_dataa_combout[1]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .coord_x = 15;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .coord_z = 13;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .mask = 16'h153F;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_2_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_datab_3_1 (
	.A(\i2c_device|OFFSET_SECONDARY [3]),
	.B(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.C(CSEL2_q_1[1]),
	.D(\i2c_device|OFFSET_PRIMARY [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_d_3_q_datab_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .coord_x = 15;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .coord_z = 12;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .mask = 16'h0777;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_3_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_datab_7 (
	.A(\i2c_device|OFFSET_PRIMARY [7]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [7]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [7]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [8]),
	.Q());
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .coord_z = 9;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .mask = 16'h69D4;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_datab_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_PRIMARY_q_0 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1_combout [1]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [8]),
	.C(\i2c_device|write_value [0]),
	.D(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout ),
	.Cin(),
	.Qin(\i2c_device|OFFSET_PRIMARY [0]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.Cout(),
	.Q(\i2c_device|OFFSET_PRIMARY [0]));
defparam \i2c_device|OFFSET_PRIMARY_q_0 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .coord_z = 0;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .mask = 16'hBB00;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_q_1 (
	.A(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout ),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.C(\i2c_device|write_value [1]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y ),
	.Cin(),
	.Qin(\i2c_device|OFFSET_PRIMARY [1]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y ),
	.Cout(),
	.Q(\i2c_device|OFFSET_PRIMARY [1]));
defparam \i2c_device|OFFSET_PRIMARY_q_1 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .coord_z = 1;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .mask = 16'hDD00;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_q_2 (
	.A(\i2c_device|OFFSET_PRIMARY [0]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [0]),
	.C(\i2c_device|write_value [2]),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|OFFSET_PRIMARY [2]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [0]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [1]),
	.Q(\i2c_device|OFFSET_PRIMARY [2]));
defparam \i2c_device|OFFSET_PRIMARY_q_2 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .coord_z = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .mask = 16'h66DD;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_PRIMARY_q_3 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [1]),
	.B(\i2c_device|OFFSET_PRIMARY [1]),
	.C(\i2c_device|write_value [3]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [1]),
	.Qin(\i2c_device|OFFSET_PRIMARY [3]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [1]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [2]),
	.Q(\i2c_device|OFFSET_PRIMARY [3]));
defparam \i2c_device|OFFSET_PRIMARY_q_3 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .coord_z = 3;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_3 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_PRIMARY_q_4 (
	.A(),
	.B(),
	.C(),
	.D(\i2c_device|write_value [4]),
	.Cin(),
	.Qin(\i2c_device|OFFSET_PRIMARY [4]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10007_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_PRIMARY_q_4__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|OFFSET_PRIMARY [4]));
defparam \i2c_device|OFFSET_PRIMARY_q_4 .coord_x = 16;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .coord_z = 10;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .mask = 16'hFF00;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_4 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_PRIMARY_q_5 (
	.A(\i2c_device|OFFSET_PRIMARY [2]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [2]),
	.C(\i2c_device|write_value [5]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [2]),
	.Qin(\i2c_device|OFFSET_PRIMARY [5]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [2]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [3]),
	.Q(\i2c_device|OFFSET_PRIMARY [5]));
defparam \i2c_device|OFFSET_PRIMARY_q_5 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .coord_z = 4;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .mask = 16'h69D4;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_5 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_PRIMARY_q_6 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [3]),
	.B(\i2c_device|OFFSET_PRIMARY [3]),
	.C(\i2c_device|write_value [6]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [3]),
	.Qin(\i2c_device|OFFSET_PRIMARY [6]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [3]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [4]),
	.Q(\i2c_device|OFFSET_PRIMARY [6]));
defparam \i2c_device|OFFSET_PRIMARY_q_6 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .coord_z = 5;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_PRIMARY_q_7 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [4]),
	.B(\i2c_device|OFFSET_PRIMARY [4]),
	.C(\i2c_device|write_value [7]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_PRIMARY_datab_0_cout [4]),
	.Qin(\i2c_device|OFFSET_PRIMARY [7]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_A_Y_B_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_PRIMARY_datab_0_combout [4]),
	.Cout(\i2c_device|OFFSET_PRIMARY_datab_0_cout [5]),
	.Q(\i2c_device|OFFSET_PRIMARY [7]));
defparam \i2c_device|OFFSET_PRIMARY_q_7 .coord_x = 17;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .coord_y = 2;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .coord_z = 6;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_PRIMARY_q_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_dataa_1 (
	.A(vcc),
	.B(\i2c_device|sda_d_0_9_q_dataa_1_combout [2]),
	.C(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.D(\i2c_device|OFFSET_SECONDARY [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .coord_z = 11;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .mask = 16'h0333;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 (
	.A(vcc),
	.B(\i2c_device|brip_cnt_dataa_9_3_combout [1]),
	.C(\i2c_device|brip_cnt_dataa_9_3_combout [2]),
	.D(\i2c_device|brip_cnt_dataa_9_3_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .coord_x = 18;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .coord_y = 10;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .coord_z = 4;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .mask = 16'hC000;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_dataa_1_combout_combout_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [8]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .coord_z = 10;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .mask = 16'hF0F0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1_combout [1]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [8]),
	.D(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .coord_x = 16;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .coord_y = 4;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .coord_z = 4;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .mask = 16'hCF00;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .modeMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_SECONDARY_datab_6 (
	.A(\i2c_device|OFFSET_SECONDARY [6]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [6]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [6]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [7]),
	.Q());
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .coord_z = 8;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .mask = 16'h69D4;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_datab_7 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [7]),
	.B(\i2c_device|OFFSET_SECONDARY [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [7]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [7]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [8]),
	.Q());
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .coord_z = 9;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .BypassEn = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_datab_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_q_0 (
	.A(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout ),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.C(\i2c_device|write_value [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y ),
	.Cin(),
	.Qin(\i2c_device|OFFSET_SECONDARY [0]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y ),
	.Cout(),
	.Q(\i2c_device|OFFSET_SECONDARY [0]));
defparam \i2c_device|OFFSET_SECONDARY_q_0 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .coord_z = 0;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .mask = 16'hDD00;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_SECONDARY_q_1 (
	.A(\i2c_device|OFFSET_SECONDARY [0]),
	.B(\i2c_device|sda_d_0_9_q_dataa_combout [2]),
	.C(\i2c_device|write_value [1]),
	.D(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.Cin(),
	.Qin(\i2c_device|OFFSET_SECONDARY [1]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|sda_d_0_12_q_dataa_combout [3]),
	.Cout(),
	.Q(\i2c_device|OFFSET_SECONDARY [1]));
defparam \i2c_device|OFFSET_SECONDARY_q_1 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .coord_z = 1;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .mask = 16'h1133;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .modeMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|OFFSET_SECONDARY_q_2 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [1]),
	.B(\i2c_device|OFFSET_SECONDARY [1]),
	.C(\i2c_device|write_value [2]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [1]),
	.Qin(\i2c_device|OFFSET_SECONDARY [2]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [1]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [2]),
	.Q(\i2c_device|OFFSET_SECONDARY [2]));
defparam \i2c_device|OFFSET_SECONDARY_q_2 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .coord_z = 3;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_q_3 (
	.A(\i2c_device|OFFSET_SECONDARY [0]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [0]),
	.C(\i2c_device|write_value [3]),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|OFFSET_SECONDARY [3]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [0]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [1]),
	.Q(\i2c_device|OFFSET_SECONDARY [3]));
defparam \i2c_device|OFFSET_SECONDARY_q_3 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .coord_z = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .mask = 16'h66DD;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_3 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_q_4 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [2]),
	.B(\i2c_device|OFFSET_SECONDARY [2]),
	.C(\i2c_device|write_value [4]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [2]),
	.Qin(\i2c_device|OFFSET_SECONDARY [4]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [2]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [3]),
	.Q(\i2c_device|OFFSET_SECONDARY [4]));
defparam \i2c_device|OFFSET_SECONDARY_q_4 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .coord_z = 4;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_4 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_q_5 (
	.A(\i2c_device|OFFSET_SECONDARY [3]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [3]),
	.C(\i2c_device|write_value [5]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [3]),
	.Qin(\i2c_device|OFFSET_SECONDARY [5]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [3]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [4]),
	.Q(\i2c_device|OFFSET_SECONDARY [5]));
defparam \i2c_device|OFFSET_SECONDARY_q_5 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .coord_z = 5;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .mask = 16'h69D4;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_5 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_q_6 (
	.A(\i2c_device|OFFSET_SECONDARY [4]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [4]),
	.C(\i2c_device|write_value [6]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [4]),
	.Qin(\i2c_device|OFFSET_SECONDARY [6]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [4]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [5]),
	.Q(\i2c_device|OFFSET_SECONDARY [6]));
defparam \i2c_device|OFFSET_SECONDARY_q_6 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .coord_z = 6;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .mask = 16'h69D4;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|OFFSET_SECONDARY_q_7 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [5]),
	.B(\i2c_device|OFFSET_SECONDARY [5]),
	.C(\i2c_device|write_value [7]),
	.D(vcc),
	.Cin(\i2c_device|OFFSET_SECONDARY_datab_0_cout [5]),
	.Qin(\i2c_device|OFFSET_SECONDARY [7]),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_X10017_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10001_GND),
	.SyncReset(SyncReset_X10017_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10001_VCC),
	.LutOut(\i2c_device|OFFSET_SECONDARY_datab_0_combout [5]),
	.Cout(\i2c_device|OFFSET_SECONDARY_datab_0_cout [6]),
	.Q(\i2c_device|OFFSET_SECONDARY [7]));
defparam \i2c_device|OFFSET_SECONDARY_q_7 .coord_x = 15;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .coord_y = 2;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .coord_z = 7;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .mask = 16'h69B2;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .modeMux = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .BypassEn = 1'b1;
defparam \i2c_device|OFFSET_SECONDARY_q_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|bit_pos_A_2_1_Y_combout (
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_A_2_1_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_A_2_1_Y_combout .coord_x = 11;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .coord_z = 3;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .mask = 16'hFFCF;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_A_2_1_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_A_2_2_Y_combout (
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_A_2_2_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_A_2_2_Y_combout .coord_x = 11;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .coord_z = 4;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .mask = 16'hFCFF;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_A_2_2_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_A_2_3_Y_combout (
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_A_2_3_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_A_2_3_Y_combout .coord_x = 11;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .coord_z = 8;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .mask = 16'hFFFC;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_A_2_3_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_A_2_Y_combout (
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(CLKOSC_clk_3_q),
	.D(CLKOSC_clk_4_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_A_2_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_A_2_Y_combout .coord_x = 11;
defparam \i2c_device|bit_pos_A_2_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_A_2_Y_combout .coord_z = 7;
defparam \i2c_device|bit_pos_A_2_Y_combout .mask = 16'hCFFF;
defparam \i2c_device|bit_pos_A_2_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_A_2_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_A_2_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_0 (
	.A(vcc),
	.B(CLKOSC_clk_4_q),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_0_combout ),
	.Cout(\i2c_device|bit_pos_dataa_0_cout [1]),
	.Q());
defparam \i2c_device|bit_pos_dataa_0 .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_0 .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_0 .coord_z = 9;
defparam \i2c_device|bit_pos_dataa_0 .mask = 16'h9977;
defparam \i2c_device|bit_pos_dataa_0 .modeMux = 1'b1;
defparam \i2c_device|bit_pos_dataa_0 .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0 .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0 .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_0 .CarryEnb = 1'b0;

alta_slice \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout (
	.A(CLKOSC_clk_1_q_dataa_2_combout[3]),
	.B(\i2c_device|i2c_state_dataa_0_combout [1]),
	.C(\i2c_device|sda_d_0_4_q ),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .coord_y = 3;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .coord_z = 9;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .mask = 16'h5545;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_3_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_0_combout_A_Y_combout (
	.A(\i2c_device|bit_pos_dataa_0_combout ),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(\i2c_device|bit_pos_dataa_1_combout ),
	.D(\i2c_device|bit_pos_dataa_2_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_0_combout_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .coord_z = 7;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .mask = 16'h0020;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_0_combout_B_Y_combout (
	.A(\i2c_device|bit_pos_dataa_0_combout ),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(\i2c_device|bit_pos_dataa_1_combout ),
	.D(\i2c_device|bit_pos_dataa_2_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_0_combout_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .coord_z = 13;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .mask = 16'h0010;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_0_combout_datab (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|bit_pos_dataa_0_combout ),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_0_combout_datab_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_0_combout_datab .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .coord_z = 10;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .mask = 16'hF000;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_combout_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_0_cout_cout_4 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|bit_pos_dataa_0_cout [3]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.Cout(\i2c_device|bit_pos_dataa_0_cout [4]),
	.Q());
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .coord_z = 12;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .mask = 16'h69D4;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .modeMux = 1'b1;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_0_cout_cout_4 .CarryEnb = 1'b0;

alta_slice \i2c_device|bit_pos_dataa_1 (
	.A(CLKOSC_clk_3_q),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|bit_pos_dataa_0_cout [1]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_1_combout ),
	.Cout(\i2c_device|bit_pos_dataa_0_cout [2]),
	.Q());
defparam \i2c_device|bit_pos_dataa_1 .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_1 .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_1 .coord_z = 10;
defparam \i2c_device|bit_pos_dataa_1 .mask = 16'h69D4;
defparam \i2c_device|bit_pos_dataa_1 .modeMux = 1'b1;
defparam \i2c_device|bit_pos_dataa_1 .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1 .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1 .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|bit_pos_dataa_1_combout_A_Y_combout (
	.A(\i2c_device|bit_pos_dataa_0_combout ),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(\i2c_device|bit_pos_dataa_1_combout ),
	.D(\i2c_device|bit_pos_dataa_2_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_1_combout_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .coord_z = 5;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .mask = 16'hEFFF;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_1_combout_B_Y_combout (
	.A(\i2c_device|bit_pos_dataa_1_combout ),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(\i2c_device|bit_pos_dataa_0_combout ),
	.D(\i2c_device|bit_pos_dataa_2_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_1_combout_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .coord_z = 6;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .mask = 16'h0100;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_1_combout_datab (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|bit_pos_dataa_1_combout ),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_1_combout_datab_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_1_combout_datab .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .coord_z = 4;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .mask = 16'hF000;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 (
	.A(vcc),
	.B(vcc),
	.C(CLKOSC_clk_2_q_dataa_combout[2]),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_1_combout_datab_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .coord_y = 4;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .coord_z = 9;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .mask = 16'h000F;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_1_combout_datab_combout_combout_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_2 (
	.A(vcc),
	.B(CLKOSC_clk_2_q),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|bit_pos_dataa_0_cout [2]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_2_combout ),
	.Cout(\i2c_device|bit_pos_dataa_0_cout [3]),
	.Q());
defparam \i2c_device|bit_pos_dataa_2 .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_2 .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_2 .coord_z = 11;
defparam \i2c_device|bit_pos_dataa_2 .mask = 16'h69B2;
defparam \i2c_device|bit_pos_dataa_2 .modeMux = 1'b1;
defparam \i2c_device|bit_pos_dataa_2 .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2 .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2 .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout (
	.A(\i2c_device|bit_pos_dataa_0_combout ),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(\i2c_device|bit_pos_dataa_1_combout ),
	.D(\i2c_device|bit_pos_dataa_2_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .coord_z = 3;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .mask = 16'h0200;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout (
	.A(CLKOSC_clk_1_q_dataa_1_combout[3]),
	.B(\i2c_device|i2c_state_dataa_0_combout [1]),
	.C(\i2c_device|sda_d_0_4_q ),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .coord_x = 11;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .coord_y = 3;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .coord_z = 6;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .mask = 16'h5545;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_3_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout (
	.A(\i2c_device|bit_pos_dataa_0_combout ),
	.B(\i2c_device|bit_pos_dataa_2_combout ),
	.C(\i2c_device|bit_pos_dataa_1_combout ),
	.D(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .coord_z = 9;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .mask = 16'hFFFD;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout (
	.A(\i2c_device|bit_pos_dataa_1_combout ),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(\i2c_device|bit_pos_dataa_0_combout ),
	.D(\i2c_device|bit_pos_dataa_2_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .coord_z = 8;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .mask = 16'hFFFE;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|bit_pos_dataa_2_combout_datab (
	.A(vcc),
	.B(\i2c_device|bit_pos_dataa_2_combout ),
	.C(vcc),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|bit_pos_dataa_2_combout_datab_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|bit_pos_dataa_2_combout_datab .coord_x = 10;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .coord_y = 2;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .coord_z = 14;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .mask = 16'hCC00;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .modeMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .FeedbackMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .ShiftMux = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .BypassEn = 1'b0;
defparam \i2c_device|bit_pos_dataa_2_combout_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt[10]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brin_cnt_dataa_10_combout [10]),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [10]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10011_Y10003_GND),
	.SyncReset(SyncReset_X10011_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ),
	.LutOut(\i2c_device|brin_cnt[10]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brin_cnt [10]));
defparam \i2c_device|brin_cnt[10]_reg .coord_x = 17;
defparam \i2c_device|brin_cnt[10]_reg .coord_y = 6;
defparam \i2c_device|brin_cnt[10]_reg .coord_z = 3;
defparam \i2c_device|brin_cnt[10]_reg .mask = 16'hFF00;
defparam \i2c_device|brin_cnt[10]_reg .modeMux = 1'b0;
defparam \i2c_device|brin_cnt[10]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt[10]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt[10]_reg .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt[10]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt[13]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brin_cnt_dataa_10_combout [13]),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [13]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10011_Y10003_GND),
	.SyncReset(SyncReset_X10011_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ),
	.LutOut(\i2c_device|brin_cnt[13]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brin_cnt [13]));
defparam \i2c_device|brin_cnt[13]_reg .coord_x = 17;
defparam \i2c_device|brin_cnt[13]_reg .coord_y = 6;
defparam \i2c_device|brin_cnt[13]_reg .coord_z = 4;
defparam \i2c_device|brin_cnt[13]_reg .mask = 16'hFF00;
defparam \i2c_device|brin_cnt[13]_reg .modeMux = 1'b0;
defparam \i2c_device|brin_cnt[13]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt[13]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt[13]_reg .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt[13]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt[18]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brin_cnt_dataa_10_combout [18]),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [18]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10011_Y10003_GND),
	.SyncReset(SyncReset_X10011_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ),
	.LutOut(\i2c_device|brin_cnt[18]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brin_cnt [18]));
defparam \i2c_device|brin_cnt[18]_reg .coord_x = 17;
defparam \i2c_device|brin_cnt[18]_reg .coord_y = 6;
defparam \i2c_device|brin_cnt[18]_reg .coord_z = 0;
defparam \i2c_device|brin_cnt[18]_reg .mask = 16'hFF00;
defparam \i2c_device|brin_cnt[18]_reg .modeMux = 1'b0;
defparam \i2c_device|brin_cnt[18]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt[18]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt[18]_reg .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt[18]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt[20]_reg (
	.A(\i2c_device|brin_cnt_dataa_10_combout [20]),
	.B(),
	.C(vcc),
	.D(),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [20]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10011_Y10003_GND),
	.SyncReset(SyncReset_X10011_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ),
	.LutOut(\i2c_device|brin_cnt[20]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brin_cnt [20]));
defparam \i2c_device|brin_cnt[20]_reg .coord_x = 17;
defparam \i2c_device|brin_cnt[20]_reg .coord_y = 6;
defparam \i2c_device|brin_cnt[20]_reg .coord_z = 1;
defparam \i2c_device|brin_cnt[20]_reg .mask = 16'hAAAA;
defparam \i2c_device|brin_cnt[20]_reg .modeMux = 1'b0;
defparam \i2c_device|brin_cnt[20]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt[20]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt[20]_reg .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt[20]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt[21]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brin_cnt_dataa_10_combout [21]),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [21]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10011_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10011_Y10003_GND),
	.SyncReset(SyncReset_X10011_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ),
	.LutOut(\i2c_device|brin_cnt[21]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brin_cnt [21]));
defparam \i2c_device|brin_cnt[21]_reg .coord_x = 17;
defparam \i2c_device|brin_cnt[21]_reg .coord_y = 6;
defparam \i2c_device|brin_cnt[21]_reg .coord_z = 2;
defparam \i2c_device|brin_cnt[21]_reg .mask = 16'hFF00;
defparam \i2c_device|brin_cnt[21]_reg .modeMux = 1'b0;
defparam \i2c_device|brin_cnt[21]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt[21]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt[21]_reg .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt[21]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt[22]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brin_cnt_dataa_10_combout [22]),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [22]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10001_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10001_Y10001_GND),
	.SyncReset(SyncReset_X10001_Y10001_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10001_Y10001_SIG ),
	.LutOut(\i2c_device|brin_cnt[22]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brin_cnt [22]));
defparam \i2c_device|brin_cnt[22]_reg .coord_x = 20;
defparam \i2c_device|brin_cnt[22]_reg .coord_y = 9;
defparam \i2c_device|brin_cnt[22]_reg .coord_z = 15;
defparam \i2c_device|brin_cnt[22]_reg .mask = 16'hFF00;
defparam \i2c_device|brin_cnt[22]_reg .modeMux = 1'b0;
defparam \i2c_device|brin_cnt[22]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt[22]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt[22]_reg .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt[22]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_10 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [10]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_10_combout [10]),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [11]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_10 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_10 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_10 .coord_z = 10;
defparam \i2c_device|brin_cnt_dataa_10 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_10 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_10 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_10_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [2]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [2]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [3]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_10_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_10_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_10_1 .coord_z = 2;
defparam \i2c_device|brin_cnt_dataa_10_1 .mask = 16'h69D4;
defparam \i2c_device|brin_cnt_dataa_10_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_10_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_10_2 (
	.A(\i2c_device|brin_cnt [10]),
	.B(\i2c_device|brin_cnt [13]),
	.C(\i2c_device|brin_cnt [18]),
	.D(\i2c_device|brin_cnt [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_2_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_10_2 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_10_2 .coord_y = 4;
defparam \i2c_device|brin_cnt_dataa_10_2 .coord_z = 13;
defparam \i2c_device|brin_cnt_dataa_10_2 .mask = 16'h0001;
defparam \i2c_device|brin_cnt_dataa_10_2 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_2 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_2 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_10_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_11_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [3]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [3]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [4]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_11_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_11_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_11_1 .coord_z = 3;
defparam \i2c_device|brin_cnt_dataa_11_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_11_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_11_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_11_2 (
	.A(\i2c_device|brin_cnt [10]),
	.B(\i2c_device|brin_cnt [13]),
	.C(\i2c_device|brin_cnt [18]),
	.D(\i2c_device|brin_cnt [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_9_2_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_11_2 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_11_2 .coord_y = 4;
defparam \i2c_device|brin_cnt_dataa_11_2 .coord_z = 14;
defparam \i2c_device|brin_cnt_dataa_11_2 .mask = 16'h0080;
defparam \i2c_device|brin_cnt_dataa_11_2 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_2 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_2 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_11_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_12_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [4]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [4]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [5]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_12_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_12_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_12_1 .coord_z = 4;
defparam \i2c_device|brin_cnt_dataa_12_1 .mask = 16'h69D4;
defparam \i2c_device|brin_cnt_dataa_12_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_12_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_12_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_12_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_12_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_13 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [13]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_10_combout [13]),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [14]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_13 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_13 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_13 .coord_z = 13;
defparam \i2c_device|brin_cnt_dataa_13 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_13 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_13 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_13 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_13 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_13 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_13_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [5]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [5]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [6]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_13_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_13_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_13_1 .coord_z = 5;
defparam \i2c_device|brin_cnt_dataa_13_1 .mask = 16'h69D4;
defparam \i2c_device|brin_cnt_dataa_13_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_13_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_13_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_13_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_13_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_14_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [6]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [6]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [7]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_14_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_14_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_14_1 .coord_z = 6;
defparam \i2c_device|brin_cnt_dataa_14_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_14_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_14_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_14_2 (
	.A(\i2c_device|brin_cnt [20]),
	.B(\i2c_device|brin_cnt [21]),
	.C(\i2c_device|brin_cnt [22]),
	.D(\i2c_device|brin_cnt [14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_datad_6_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_14_2 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_14_2 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_14_2 .coord_z = 9;
defparam \i2c_device|brin_cnt_dataa_14_2 .mask = 16'h0001;
defparam \i2c_device|brin_cnt_dataa_14_2 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_2 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_2 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_14_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_15_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [7]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [7]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [8]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_15_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_15_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_15_1 .coord_z = 7;
defparam \i2c_device|brin_cnt_dataa_15_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_15_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_15_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_15_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_15_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_15_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_16_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [8]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [8]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [9]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_16_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_16_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_16_1 .coord_z = 8;
defparam \i2c_device|brin_cnt_dataa_16_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_16_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_16_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_16_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_16_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_16_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_17_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [9]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [9]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [10]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_17_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_17_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_17_1 .coord_z = 9;
defparam \i2c_device|brin_cnt_dataa_17_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_17_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_17_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_17_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_17_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_17_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_18 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [18]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_10_combout [18]),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [19]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_18 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_18 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_18 .coord_z = 2;
defparam \i2c_device|brin_cnt_dataa_18 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_18 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_18 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_18 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_18 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_18 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_18_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [10]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [10]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [11]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_18_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_18_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_18_1 .coord_z = 10;
defparam \i2c_device|brin_cnt_dataa_18_1 .mask = 16'h69D4;
defparam \i2c_device|brin_cnt_dataa_18_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_18_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_18_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_18_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_18_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_19_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [11]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [11]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [12]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_19_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_19_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_19_1 .coord_z = 11;
defparam \i2c_device|brin_cnt_dataa_19_1 .mask = 16'h69D4;
defparam \i2c_device|brin_cnt_dataa_19_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_19_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_19_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_19_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_19_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_20 (
	.A(\i2c_device|brin_cnt [20]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [20]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_10_combout [20]),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [21]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_20 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_20 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_20 .coord_z = 4;
defparam \i2c_device|brin_cnt_dataa_20 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_20 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_20 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_20 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_20 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_20 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_20_1 (
	.A(\i2c_device|brin_cnt [20]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [12]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [12]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [13]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_20_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_20_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_20_1 .coord_z = 12;
defparam \i2c_device|brin_cnt_dataa_20_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_20_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_20_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_20_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_20_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_20_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_21 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [21]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [21]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_10_combout [21]),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [22]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_21 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_21 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_21 .coord_z = 5;
defparam \i2c_device|brin_cnt_dataa_21 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_21 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_21 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_21 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_21 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_21 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_21_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [21]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [13]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [13]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [14]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_21_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_21_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_21_1 .coord_z = 13;
defparam \i2c_device|brin_cnt_dataa_21_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_21_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_21_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_21_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_21_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_21_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_22 (
	.A(\i2c_device|brin_cnt [22]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [22]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_10_combout [22]),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [23]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_22 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_22 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_22 .coord_z = 6;
defparam \i2c_device|brin_cnt_dataa_22 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_22 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_22 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_22 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_22 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_22 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_22_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [14]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [14]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [15]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_22_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_22_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_22_1 .coord_z = 14;
defparam \i2c_device|brin_cnt_dataa_22_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_22_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_22_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_22_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_22_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_22_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_3_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [0]),
	.C(\i2c_device|brin_cnt [3]),
	.D(\i2c_device|brin_cnt [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_datad_6_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_3_1 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_3_1 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_3_1 .coord_z = 11;
defparam \i2c_device|brin_cnt_dataa_3_1 .mask = 16'h0003;
defparam \i2c_device|brin_cnt_dataa_3_1 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_3_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_3_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_3_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_3_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_7_1 (
	.A(\i2c_device|brin_cnt [7]),
	.B(\i2c_device|brin_cnt [5]),
	.C(\i2c_device|brin_cnt [4]),
	.D(\i2c_device|brin_cnt [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_datad_6_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_7_1 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_7_1 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_7_1 .coord_z = 10;
defparam \i2c_device|brin_cnt_dataa_7_1 .mask = 16'h0001;
defparam \i2c_device|brin_cnt_dataa_7_1 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_7_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_7_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_7_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_7_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_8_1 (
	.A(\i2c_device|brin_cnt [8]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [0]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [1]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_8_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_8_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_8_1 .coord_z = 0;
defparam \i2c_device|brin_cnt_dataa_8_1 .mask = 16'h66BB;
defparam \i2c_device|brin_cnt_dataa_8_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_8_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [15]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .coord_z = 15;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .mask = 16'hF0F0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout (
	.A(\i2c_device|brin_cnt_dataa_9_2_combout [2]),
	.B(\i2c_device|brin_cnt_dataa_9_2_combout [1]),
	.C(\i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout ),
	.D(\i2c_device|brin_cnt_dataa_8_2_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .coord_y = 4;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .coord_z = 12;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .mask = 16'h70F0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_8_2 (
	.A(\i2c_device|brin_cnt [8]),
	.B(\i2c_device|brin_cnt [19]),
	.C(\i2c_device|brin_cnt [9]),
	.D(\i2c_device|brin_cnt [12]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_2_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_8_2 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_8_2 .coord_y = 4;
defparam \i2c_device|brin_cnt_dataa_8_2 .coord_z = 10;
defparam \i2c_device|brin_cnt_dataa_8_2 .mask = 16'h0001;
defparam \i2c_device|brin_cnt_dataa_8_2 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 (
	.A(\i2c_device|brin_cnt_datad_6_combout [1]),
	.B(\i2c_device|brin_cnt_datad_6_combout [0]),
	.C(\i2c_device|brin_cnt_datad_6_combout [3]),
	.D(\i2c_device|brin_cnt_datad_6_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_2_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .coord_x = 18;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .coord_y = 6;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .coord_z = 8;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .mask = 16'h8000;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_8_2_combout_combout_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_dataa_9_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_8_1_cout [1]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_8_1_combout [1]),
	.Cout(\i2c_device|brin_cnt_dataa_8_1_cout [2]),
	.Q());
defparam \i2c_device|brin_cnt_dataa_9_1 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_9_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_dataa_9_1 .coord_z = 1;
defparam \i2c_device|brin_cnt_dataa_9_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_dataa_9_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_dataa_9_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_1 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_dataa_9_2 (
	.A(\i2c_device|brin_cnt [8]),
	.B(\i2c_device|brin_cnt [12]),
	.C(\i2c_device|brin_cnt [9]),
	.D(\i2c_device|brin_cnt [19]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_dataa_9_2_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_dataa_9_2 .coord_x = 17;
defparam \i2c_device|brin_cnt_dataa_9_2 .coord_y = 4;
defparam \i2c_device|brin_cnt_dataa_9_2 .coord_z = 11;
defparam \i2c_device|brin_cnt_dataa_9_2 .mask = 16'h0800;
defparam \i2c_device|brin_cnt_dataa_9_2 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_2 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_2 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_dataa_9_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_datad_6 (
	.A(\i2c_device|brin_cnt [6]),
	.B(\i2c_device|brin_cnt [17]),
	.C(\i2c_device|brin_cnt [16]),
	.D(\i2c_device|brin_cnt [15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_cnt_datad_6_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|brin_cnt_datad_6 .coord_x = 18;
defparam \i2c_device|brin_cnt_datad_6 .coord_y = 6;
defparam \i2c_device|brin_cnt_datad_6 .coord_z = 7;
defparam \i2c_device|brin_cnt_datad_6 .mask = 16'h0001;
defparam \i2c_device|brin_cnt_datad_6 .modeMux = 1'b0;
defparam \i2c_device|brin_cnt_datad_6 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_datad_6 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_datad_6 .BypassEn = 1'b0;
defparam \i2c_device|brin_cnt_datad_6 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_cnt_q_0 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|brin_cnt [0]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_0_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [1]),
	.Q(\i2c_device|brin_cnt [0]));
defparam \i2c_device|brin_cnt_q_0 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_0 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_0 .coord_z = 0;
defparam \i2c_device|brin_cnt_q_0 .mask = 16'h66DD;
defparam \i2c_device|brin_cnt_q_0 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_0 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_0 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_1 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [1]),
	.Qin(\i2c_device|brin_cnt [1]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_1_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [2]),
	.Q(\i2c_device|brin_cnt [1]));
defparam \i2c_device|brin_cnt_q_1 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_1 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_1 .coord_z = 1;
defparam \i2c_device|brin_cnt_q_1 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_1 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_1 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_11 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [11]),
	.Qin(\i2c_device|brin_cnt [11]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_11_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [12]),
	.Q(\i2c_device|brin_cnt [11]));
defparam \i2c_device|brin_cnt_q_11 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_11 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_11 .coord_z = 11;
defparam \i2c_device|brin_cnt_q_11 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_11 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_11 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_11 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_11 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_11 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_12 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [12]),
	.Qin(\i2c_device|brin_cnt [12]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_12_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [13]),
	.Q(\i2c_device|brin_cnt [12]));
defparam \i2c_device|brin_cnt_q_12 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_12 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_12 .coord_z = 12;
defparam \i2c_device|brin_cnt_q_12 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_12 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_12 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_12 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_12 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_12 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_14 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [14]),
	.Qin(\i2c_device|brin_cnt [14]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_14_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [15]),
	.Q(\i2c_device|brin_cnt [14]));
defparam \i2c_device|brin_cnt_q_14 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_14 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_14 .coord_z = 14;
defparam \i2c_device|brin_cnt_q_14 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_14 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_14 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_14 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_14 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_14 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_15 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [15]),
	.Qin(\i2c_device|brin_cnt [15]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_15_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [16]),
	.Q(\i2c_device|brin_cnt [15]));
defparam \i2c_device|brin_cnt_q_15 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_15 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_15 .coord_z = 15;
defparam \i2c_device|brin_cnt_q_15 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_15 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_15 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_15 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_15 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_15 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_16 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [16]),
	.Qin(\i2c_device|brin_cnt [16]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10006_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10006_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10006_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10006_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_16_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [17]),
	.Q(\i2c_device|brin_cnt [16]));
defparam \i2c_device|brin_cnt_q_16 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_16 .coord_y = 6;
defparam \i2c_device|brin_cnt_q_16 .coord_z = 0;
defparam \i2c_device|brin_cnt_q_16 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_16 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_16 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_16 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_16 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_16 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_17 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [17]),
	.Qin(\i2c_device|brin_cnt [17]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10006_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10006_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10006_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10006_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_17_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [18]),
	.Q(\i2c_device|brin_cnt [17]));
defparam \i2c_device|brin_cnt_q_17 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_17 .coord_y = 6;
defparam \i2c_device|brin_cnt_q_17 .coord_z = 1;
defparam \i2c_device|brin_cnt_q_17 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_17 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_17 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_17 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_17 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_17 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_19 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [19]),
	.Qin(\i2c_device|brin_cnt [19]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10006_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10006_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10006_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10006_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_19_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [20]),
	.Q(\i2c_device|brin_cnt [19]));
defparam \i2c_device|brin_cnt_q_19 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_19 .coord_y = 6;
defparam \i2c_device|brin_cnt_q_19 .coord_z = 3;
defparam \i2c_device|brin_cnt_q_19 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_19 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_19 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_19 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_19 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_19 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_2 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [2]),
	.Qin(\i2c_device|brin_cnt [2]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_2_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [3]),
	.Q(\i2c_device|brin_cnt [2]));
defparam \i2c_device|brin_cnt_q_2 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_2 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_2 .coord_z = 2;
defparam \i2c_device|brin_cnt_q_2 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_2 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_2 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_3 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [3]),
	.Qin(\i2c_device|brin_cnt [3]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_3_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [4]),
	.Q(\i2c_device|brin_cnt [3]));
defparam \i2c_device|brin_cnt_q_3 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_3 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_3 .coord_z = 3;
defparam \i2c_device|brin_cnt_q_3 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_3 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_3 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_3 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_4 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [4]),
	.Qin(\i2c_device|brin_cnt [4]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_4_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [5]),
	.Q(\i2c_device|brin_cnt [4]));
defparam \i2c_device|brin_cnt_q_4 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_4 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_4 .coord_z = 4;
defparam \i2c_device|brin_cnt_q_4 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_4 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_4 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_4 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_5 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [5]),
	.Qin(\i2c_device|brin_cnt [5]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_5_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [6]),
	.Q(\i2c_device|brin_cnt [5]));
defparam \i2c_device|brin_cnt_q_5 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_5 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_5 .coord_z = 5;
defparam \i2c_device|brin_cnt_q_5 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_5 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_5 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_5 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_6 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [6]),
	.Qin(\i2c_device|brin_cnt [6]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_6_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [7]),
	.Q(\i2c_device|brin_cnt [6]));
defparam \i2c_device|brin_cnt_q_6 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_6 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_6 .coord_z = 6;
defparam \i2c_device|brin_cnt_q_6 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_6 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_6 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_7 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [7]),
	.Qin(\i2c_device|brin_cnt [7]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_7_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [8]),
	.Q(\i2c_device|brin_cnt [7]));
defparam \i2c_device|brin_cnt_q_7 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_7 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_7 .coord_z = 7;
defparam \i2c_device|brin_cnt_q_7 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_7 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_7 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_8 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [8]),
	.Qin(\i2c_device|brin_cnt [8]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_8_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [9]),
	.Q(\i2c_device|brin_cnt [8]));
defparam \i2c_device|brin_cnt_q_8 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_8 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_8 .coord_z = 8;
defparam \i2c_device|brin_cnt_q_8 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_8 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_8 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_8 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_8 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_8 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_cnt_q_9 (
	.A(vcc),
	.B(\i2c_device|brin_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brin_cnt_dataa_0_cout [9]),
	.Qin(\i2c_device|brin_cnt [9]),
	.Clk(\CLKOSC_i_o__i2c_device|brin_rec_A_0_Y_B_Y_X10007_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10001_GND),
	.SyncReset(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10001_GND),
	.LutOut(\i2c_device|brin_cnt_dataa_9_combout ),
	.Cout(\i2c_device|brin_cnt_dataa_0_cout [10]),
	.Q(\i2c_device|brin_cnt [9]));
defparam \i2c_device|brin_cnt_q_9 .coord_x = 18;
defparam \i2c_device|brin_cnt_q_9 .coord_y = 7;
defparam \i2c_device|brin_cnt_q_9 .coord_z = 9;
defparam \i2c_device|brin_cnt_q_9 .mask = 16'h96E8;
defparam \i2c_device|brin_cnt_q_9 .modeMux = 1'b1;
defparam \i2c_device|brin_cnt_q_9 .FeedbackMux = 1'b0;
defparam \i2c_device|brin_cnt_q_9 .ShiftMux = 1'b0;
defparam \i2c_device|brin_cnt_q_9 .BypassEn = 1'b1;
defparam \i2c_device|brin_cnt_q_9 .CarryEnb = 1'b0;

alta_slice \i2c_device|brin_rec_A_0_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|sda_d_0_12_q_dataa_combout [0]),
	.D(\i2c_device|brin_rec_A_0_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_rec_A_0_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .coord_x = 17;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .coord_y = 4;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .coord_z = 8;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .mask = 16'hFF0F;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|brin_rec_A_0_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_rec_d_0 (
	.A(\i2c_device|brin_rec [0]),
	.B(vcc),
	.C(\i2c_device|brin_rec [0]),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|brin_rec_d_0_q ),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|brin_rec_A_0_Y ),
	.Cout(),
	.Q(\i2c_device|brin_rec_d_0_q ));
defparam \i2c_device|brin_rec_d_0 .coord_x = 10;
defparam \i2c_device|brin_rec_d_0 .coord_y = 4;
defparam \i2c_device|brin_rec_d_0 .coord_z = 15;
defparam \i2c_device|brin_rec_d_0 .mask = 16'h5A5A;
defparam \i2c_device|brin_rec_d_0 .modeMux = 1'b0;
defparam \i2c_device|brin_rec_d_0 .FeedbackMux = 1'b1;
defparam \i2c_device|brin_rec_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|brin_rec_d_0 .BypassEn = 1'b1;
defparam \i2c_device|brin_rec_d_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|brin_rec_q_0 (
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [0]),
	.B(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [1]),
	.C(vcc),
	.D(\i2c_device|write_value [0]),
	.Cin(),
	.Qin(\i2c_device|brin_rec [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brin_rec_A_0_1_Y ),
	.Cout(),
	.Q(\i2c_device|brin_rec [0]));
defparam \i2c_device|brin_rec_q_0 .coord_x = 10;
defparam \i2c_device|brin_rec_q_0 .coord_y = 4;
defparam \i2c_device|brin_rec_q_0 .coord_z = 12;
defparam \i2c_device|brin_rec_q_0 .mask = 16'h78F0;
defparam \i2c_device|brin_rec_q_0 .modeMux = 1'b0;
defparam \i2c_device|brin_rec_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|brin_rec_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|brin_rec_q_0 .BypassEn = 1'b0;
defparam \i2c_device|brin_rec_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt[10]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brip_cnt_dataa_10_combout [10]),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [10]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10002_GND),
	.SyncReset(SyncReset_X10010_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ),
	.LutOut(\i2c_device|brip_cnt[10]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brip_cnt [10]));
defparam \i2c_device|brip_cnt[10]_reg .coord_x = 18;
defparam \i2c_device|brip_cnt[10]_reg .coord_y = 10;
defparam \i2c_device|brip_cnt[10]_reg .coord_z = 1;
defparam \i2c_device|brip_cnt[10]_reg .mask = 16'hFF00;
defparam \i2c_device|brip_cnt[10]_reg .modeMux = 1'b0;
defparam \i2c_device|brip_cnt[10]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt[10]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt[10]_reg .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt[10]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt[13]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brip_cnt_dataa_10_combout [13]),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [13]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10002_GND),
	.SyncReset(SyncReset_X10010_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ),
	.LutOut(\i2c_device|brip_cnt[13]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brip_cnt [13]));
defparam \i2c_device|brip_cnt[13]_reg .coord_x = 18;
defparam \i2c_device|brip_cnt[13]_reg .coord_y = 10;
defparam \i2c_device|brip_cnt[13]_reg .coord_z = 11;
defparam \i2c_device|brip_cnt[13]_reg .mask = 16'hFF00;
defparam \i2c_device|brip_cnt[13]_reg .modeMux = 1'b0;
defparam \i2c_device|brip_cnt[13]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt[13]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt[13]_reg .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt[13]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt[18]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brip_cnt_dataa_10_combout [18]),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [18]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10002_GND),
	.SyncReset(SyncReset_X10010_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ),
	.LutOut(\i2c_device|brip_cnt[18]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brip_cnt [18]));
defparam \i2c_device|brip_cnt[18]_reg .coord_x = 18;
defparam \i2c_device|brip_cnt[18]_reg .coord_y = 10;
defparam \i2c_device|brip_cnt[18]_reg .coord_z = 8;
defparam \i2c_device|brip_cnt[18]_reg .mask = 16'hFF00;
defparam \i2c_device|brip_cnt[18]_reg .modeMux = 1'b0;
defparam \i2c_device|brip_cnt[18]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt[18]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt[18]_reg .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt[18]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt[20]_reg (
	.A(\i2c_device|brip_cnt_dataa_10_combout [20]),
	.B(),
	.C(vcc),
	.D(),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [20]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10002_GND),
	.SyncReset(SyncReset_X10010_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ),
	.LutOut(\i2c_device|brip_cnt[20]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brip_cnt [20]));
defparam \i2c_device|brip_cnt[20]_reg .coord_x = 18;
defparam \i2c_device|brip_cnt[20]_reg .coord_y = 10;
defparam \i2c_device|brip_cnt[20]_reg .coord_z = 10;
defparam \i2c_device|brip_cnt[20]_reg .mask = 16'hAAAA;
defparam \i2c_device|brip_cnt[20]_reg .modeMux = 1'b0;
defparam \i2c_device|brip_cnt[20]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt[20]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt[20]_reg .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt[20]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt[21]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brip_cnt_dataa_10_combout [21]),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [21]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10002_GND),
	.SyncReset(SyncReset_X10010_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ),
	.LutOut(\i2c_device|brip_cnt[21]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brip_cnt [21]));
defparam \i2c_device|brip_cnt[21]_reg .coord_x = 18;
defparam \i2c_device|brip_cnt[21]_reg .coord_y = 10;
defparam \i2c_device|brip_cnt[21]_reg .coord_z = 6;
defparam \i2c_device|brip_cnt[21]_reg .mask = 16'hFF00;
defparam \i2c_device|brip_cnt[21]_reg .modeMux = 1'b0;
defparam \i2c_device|brip_cnt[21]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt[21]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt[21]_reg .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt[21]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt[22]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|brip_cnt_dataa_10_combout [22]),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [22]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10010_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10002_GND),
	.SyncReset(SyncReset_X10010_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ),
	.LutOut(\i2c_device|brip_cnt[22]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|brip_cnt [22]));
defparam \i2c_device|brip_cnt[22]_reg .coord_x = 18;
defparam \i2c_device|brip_cnt[22]_reg .coord_y = 10;
defparam \i2c_device|brip_cnt[22]_reg .coord_z = 9;
defparam \i2c_device|brip_cnt[22]_reg .mask = 16'hFF00;
defparam \i2c_device|brip_cnt[22]_reg .modeMux = 1'b0;
defparam \i2c_device|brip_cnt[22]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt[22]_reg .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt[22]_reg .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt[22]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_10 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [10]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_10_combout [10]),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [11]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_10 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_10 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_10 .coord_z = 10;
defparam \i2c_device|brip_cnt_dataa_10 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_10 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_10 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_10_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [2]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [2]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [3]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_10_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_10_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_10_1 .coord_z = 2;
defparam \i2c_device|brip_cnt_dataa_10_1 .mask = 16'h69D4;
defparam \i2c_device|brip_cnt_dataa_10_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_10_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_10_2 (
	.A(\i2c_device|brip_cnt [18]),
	.B(\i2c_device|brip_cnt [10]),
	.C(\i2c_device|brip_cnt [11]),
	.D(\i2c_device|brip_cnt [13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_9_3_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_10_2 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_10_2 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_10_2 .coord_z = 0;
defparam \i2c_device|brip_cnt_dataa_10_2 .mask = 16'h0001;
defparam \i2c_device|brip_cnt_dataa_10_2 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_2 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_2 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_10_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_11_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [3]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [3]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [4]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_11_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_11_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_11_1 .coord_z = 3;
defparam \i2c_device|brip_cnt_dataa_11_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_11_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_11_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_11_2 (
	.A(\i2c_device|brip_cnt [18]),
	.B(\i2c_device|brip_cnt [10]),
	.C(\i2c_device|brip_cnt [11]),
	.D(\i2c_device|brip_cnt [13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_9_2_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_11_2 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_11_2 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_11_2 .coord_z = 7;
defparam \i2c_device|brip_cnt_dataa_11_2 .mask = 16'h0800;
defparam \i2c_device|brip_cnt_dataa_11_2 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_2 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_2 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_11_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_12_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [4]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [4]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [5]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_12_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_12_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_12_1 .coord_z = 4;
defparam \i2c_device|brip_cnt_dataa_12_1 .mask = 16'h69D4;
defparam \i2c_device|brip_cnt_dataa_12_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_12_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_12_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_12_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_12_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_13 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [13]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_10_combout [13]),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [14]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_13 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_13 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_13 .coord_z = 13;
defparam \i2c_device|brip_cnt_dataa_13 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_13 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_13 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_13 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_13 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_13 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_13_1 (
	.A(\i2c_device|brip_cnt [13]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [5]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [5]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [6]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_13_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_13_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_13_1 .coord_z = 5;
defparam \i2c_device|brip_cnt_dataa_13_1 .mask = 16'h69B2;
defparam \i2c_device|brip_cnt_dataa_13_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_13_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_13_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_13_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_13_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_14_1 (
	.A(\i2c_device|brip_cnt [14]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [6]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [6]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [7]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_14_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_14_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_14_1 .coord_z = 6;
defparam \i2c_device|brip_cnt_dataa_14_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_14_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_14_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_14_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_14_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_14_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_15_1 (
	.A(\i2c_device|brip_cnt [15]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [7]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [7]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [8]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_15_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_15_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_15_1 .coord_z = 7;
defparam \i2c_device|brip_cnt_dataa_15_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_15_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_15_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_15_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_15_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_15_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_16_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [8]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [8]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [9]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_16_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_16_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_16_1 .coord_z = 8;
defparam \i2c_device|brip_cnt_dataa_16_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_16_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_16_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_16_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_16_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_16_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_17_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [9]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [9]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [10]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_17_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_17_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_17_1 .coord_z = 9;
defparam \i2c_device|brip_cnt_dataa_17_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_17_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_17_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_17_2 (
	.A(\i2c_device|brip_cnt [22]),
	.B(\i2c_device|brip_cnt [15]),
	.C(\i2c_device|brip_cnt [14]),
	.D(\i2c_device|brip_cnt [17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_datad_6_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_17_2 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_17_2 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_17_2 .coord_z = 9;
defparam \i2c_device|brip_cnt_dataa_17_2 .mask = 16'h0001;
defparam \i2c_device|brip_cnt_dataa_17_2 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_2 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_2 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_17_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_18 (
	.A(\i2c_device|brip_cnt [18]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [18]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_10_combout [18]),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [19]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_18 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_18 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_18 .coord_z = 2;
defparam \i2c_device|brip_cnt_dataa_18 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_18 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_18 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_18 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_18 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_18 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_18_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [10]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [10]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [11]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_18_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_18_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_18_1 .coord_z = 10;
defparam \i2c_device|brip_cnt_dataa_18_1 .mask = 16'h69D4;
defparam \i2c_device|brip_cnt_dataa_18_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_18_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_18_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_18_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_18_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_19_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [11]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [11]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [12]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_19_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_19_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_19_1 .coord_z = 11;
defparam \i2c_device|brip_cnt_dataa_19_1 .mask = 16'h69D4;
defparam \i2c_device|brip_cnt_dataa_19_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_19_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_19_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_19_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_19_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_20 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [20]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [20]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_10_combout [20]),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [21]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_20 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_20 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_20 .coord_z = 4;
defparam \i2c_device|brip_cnt_dataa_20 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_20 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_20 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_20 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_20 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_20 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_20_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [20]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [12]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [12]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [13]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_20_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_20_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_20_1 .coord_z = 12;
defparam \i2c_device|brip_cnt_dataa_20_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_20_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_20_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_20_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_20_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_20_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_21 (
	.A(\i2c_device|brip_cnt [21]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [21]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_10_combout [21]),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [22]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_21 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_21 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_21 .coord_z = 5;
defparam \i2c_device|brip_cnt_dataa_21 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_21 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_21 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_21 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_21 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_21 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_21_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [21]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [13]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [13]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [14]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_21_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_21_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_21_1 .coord_z = 13;
defparam \i2c_device|brip_cnt_dataa_21_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_21_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_21_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_21_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_21_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_21_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_22 (
	.A(\i2c_device|brip_cnt [22]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [22]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_10_combout [22]),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [23]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_22 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_22 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_22 .coord_z = 6;
defparam \i2c_device|brip_cnt_dataa_22 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_22 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_22 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_22 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_22 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_22 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_22_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [14]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [14]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [15]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_22_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_22_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_22_1 .coord_z = 14;
defparam \i2c_device|brip_cnt_dataa_22_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_22_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_22_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_22_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_22_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_22_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_5_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [1]),
	.C(\i2c_device|brip_cnt [2]),
	.D(\i2c_device|brip_cnt [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_datad_6_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_5_1 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_5_1 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_5_1 .coord_z = 11;
defparam \i2c_device|brip_cnt_dataa_5_1 .mask = 16'h0003;
defparam \i2c_device|brip_cnt_dataa_5_1 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_5_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_5_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_5_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_5_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_7_1 (
	.A(\i2c_device|brip_cnt [0]),
	.B(\i2c_device|brip_cnt [3]),
	.C(\i2c_device|brip_cnt [4]),
	.D(\i2c_device|brip_cnt [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_datad_6_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_7_1 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_7_1 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_7_1 .coord_z = 12;
defparam \i2c_device|brip_cnt_dataa_7_1 .mask = 16'h0001;
defparam \i2c_device|brip_cnt_dataa_7_1 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_7_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_7_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_7_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_7_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_8_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [8]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [0]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [1]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_8_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_8_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_8_1 .coord_z = 0;
defparam \i2c_device|brip_cnt_dataa_8_1 .mask = 16'h66DD;
defparam \i2c_device|brip_cnt_dataa_8_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_8_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [15]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .coord_z = 15;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .mask = 16'hF0F0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout (
	.A(\i2c_device|brip_cnt_dataa_9_2_combout [2]),
	.B(\i2c_device|brip_cnt_dataa_9_3_combout [0]),
	.C(\i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout ),
	.D(\i2c_device|brip_cnt_dataa_9_2_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .coord_z = 3;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .mask = 16'h70F0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_8_1_cout_cin_15_combout_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_9_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_8_1_cout [1]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_8_1_combout [1]),
	.Cout(\i2c_device|brip_cnt_dataa_8_1_cout [2]),
	.Q());
defparam \i2c_device|brip_cnt_dataa_9_1 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_9_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_dataa_9_1 .coord_z = 1;
defparam \i2c_device|brip_cnt_dataa_9_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_dataa_9_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_dataa_9_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_1 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_dataa_9_2 (
	.A(\i2c_device|brip_cnt [19]),
	.B(\i2c_device|brip_cnt [12]),
	.C(\i2c_device|brip_cnt [9]),
	.D(\i2c_device|brip_cnt [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_9_2_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_9_2 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_9_2 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_9_2 .coord_z = 2;
defparam \i2c_device|brip_cnt_dataa_9_2 .mask = 16'h0800;
defparam \i2c_device|brip_cnt_dataa_9_2 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_2 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_2 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_9_3 (
	.A(\i2c_device|brip_cnt [19]),
	.B(\i2c_device|brip_cnt [12]),
	.C(\i2c_device|brip_cnt [9]),
	.D(\i2c_device|brip_cnt [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_9_3_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_9_3 .coord_x = 18;
defparam \i2c_device|brip_cnt_dataa_9_3 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_9_3 .coord_z = 5;
defparam \i2c_device|brip_cnt_dataa_9_3 .mask = 16'h0001;
defparam \i2c_device|brip_cnt_dataa_9_3 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 (
	.A(\i2c_device|brip_cnt_datad_6_combout [1]),
	.B(\i2c_device|brip_cnt_datad_6_combout [3]),
	.C(\i2c_device|brip_cnt_datad_6_combout [2]),
	.D(\i2c_device|brip_cnt_datad_6_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_dataa_9_3_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .coord_x = 17;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .coord_y = 10;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .coord_z = 10;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .mask = 16'h8000;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_dataa_9_3_combout_combout_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_datad_6 (
	.A(\i2c_device|brip_cnt [21]),
	.B(\i2c_device|brip_cnt [6]),
	.C(\i2c_device|brip_cnt [16]),
	.D(\i2c_device|brip_cnt [20]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_cnt_datad_6_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|brip_cnt_datad_6 .coord_x = 17;
defparam \i2c_device|brip_cnt_datad_6 .coord_y = 10;
defparam \i2c_device|brip_cnt_datad_6 .coord_z = 7;
defparam \i2c_device|brip_cnt_datad_6 .mask = 16'h0001;
defparam \i2c_device|brip_cnt_datad_6 .modeMux = 1'b0;
defparam \i2c_device|brip_cnt_datad_6 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_datad_6 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_datad_6 .BypassEn = 1'b0;
defparam \i2c_device|brip_cnt_datad_6 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_cnt_q_0 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|brip_cnt [0]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_0_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [1]),
	.Q(\i2c_device|brip_cnt [0]));
defparam \i2c_device|brip_cnt_q_0 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_0 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_0 .coord_z = 0;
defparam \i2c_device|brip_cnt_q_0 .mask = 16'h66DD;
defparam \i2c_device|brip_cnt_q_0 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_0 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_0 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_1 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [1]),
	.Qin(\i2c_device|brip_cnt [1]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_1_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [2]),
	.Q(\i2c_device|brip_cnt [1]));
defparam \i2c_device|brip_cnt_q_1 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_1 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_1 .coord_z = 1;
defparam \i2c_device|brip_cnt_q_1 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_1 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_1 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_11 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [11]),
	.Qin(\i2c_device|brip_cnt [11]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_11_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [12]),
	.Q(\i2c_device|brip_cnt [11]));
defparam \i2c_device|brip_cnt_q_11 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_11 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_11 .coord_z = 11;
defparam \i2c_device|brip_cnt_q_11 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_11 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_11 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_11 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_11 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_11 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_12 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [12]),
	.Qin(\i2c_device|brip_cnt [12]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_12_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [13]),
	.Q(\i2c_device|brip_cnt [12]));
defparam \i2c_device|brip_cnt_q_12 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_12 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_12 .coord_z = 12;
defparam \i2c_device|brip_cnt_q_12 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_12 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_12 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_12 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_12 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_12 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_14 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [14]),
	.Qin(\i2c_device|brip_cnt [14]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_14_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [15]),
	.Q(\i2c_device|brip_cnt [14]));
defparam \i2c_device|brip_cnt_q_14 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_14 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_14 .coord_z = 14;
defparam \i2c_device|brip_cnt_q_14 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_14 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_14 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_14 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_14 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_14 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_15 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [15]),
	.Qin(\i2c_device|brip_cnt [15]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_15_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [16]),
	.Q(\i2c_device|brip_cnt [15]));
defparam \i2c_device|brip_cnt_q_15 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_15 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_15 .coord_z = 15;
defparam \i2c_device|brip_cnt_q_15 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_15 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_15 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_15 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_15 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_15 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_16 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [16]),
	.Qin(\i2c_device|brip_cnt [16]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10009_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10009_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_16_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [17]),
	.Q(\i2c_device|brip_cnt [16]));
defparam \i2c_device|brip_cnt_q_16 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_16 .coord_y = 10;
defparam \i2c_device|brip_cnt_q_16 .coord_z = 0;
defparam \i2c_device|brip_cnt_q_16 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_16 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_16 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_16 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_16 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_16 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_17 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [17]),
	.Qin(\i2c_device|brip_cnt [17]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10009_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10009_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_17_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [18]),
	.Q(\i2c_device|brip_cnt [17]));
defparam \i2c_device|brip_cnt_q_17 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_17 .coord_y = 10;
defparam \i2c_device|brip_cnt_q_17 .coord_z = 1;
defparam \i2c_device|brip_cnt_q_17 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_17 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_17 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_17 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_17 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_17 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_19 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [19]),
	.Qin(\i2c_device|brip_cnt [19]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10009_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10009_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_19_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [20]),
	.Q(\i2c_device|brip_cnt [19]));
defparam \i2c_device|brip_cnt_q_19 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_19 .coord_y = 10;
defparam \i2c_device|brip_cnt_q_19 .coord_z = 3;
defparam \i2c_device|brip_cnt_q_19 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_19 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_19 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_19 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_19 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_19 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_2 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [2]),
	.Qin(\i2c_device|brip_cnt [2]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_2_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [3]),
	.Q(\i2c_device|brip_cnt [2]));
defparam \i2c_device|brip_cnt_q_2 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_2 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_2 .coord_z = 2;
defparam \i2c_device|brip_cnt_q_2 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_2 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_2 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_3 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [3]),
	.Qin(\i2c_device|brip_cnt [3]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_3_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [4]),
	.Q(\i2c_device|brip_cnt [3]));
defparam \i2c_device|brip_cnt_q_3 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_3 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_3 .coord_z = 3;
defparam \i2c_device|brip_cnt_q_3 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_3 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_3 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_3 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_4 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [4]),
	.Qin(\i2c_device|brip_cnt [4]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_4_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [5]),
	.Q(\i2c_device|brip_cnt [4]));
defparam \i2c_device|brip_cnt_q_4 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_4 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_4 .coord_z = 4;
defparam \i2c_device|brip_cnt_q_4 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_4 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_4 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_4 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_5 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [5]),
	.Qin(\i2c_device|brip_cnt [5]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_5_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [6]),
	.Q(\i2c_device|brip_cnt [5]));
defparam \i2c_device|brip_cnt_q_5 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_5 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_5 .coord_z = 5;
defparam \i2c_device|brip_cnt_q_5 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_5 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_5 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_5 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_6 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [6]),
	.Qin(\i2c_device|brip_cnt [6]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_6_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [7]),
	.Q(\i2c_device|brip_cnt [6]));
defparam \i2c_device|brip_cnt_q_6 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_6 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_6 .coord_z = 6;
defparam \i2c_device|brip_cnt_q_6 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_6 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_6 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_7 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [7]),
	.Qin(\i2c_device|brip_cnt [7]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_7_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [8]),
	.Q(\i2c_device|brip_cnt [7]));
defparam \i2c_device|brip_cnt_q_7 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_7 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_7 .coord_z = 7;
defparam \i2c_device|brip_cnt_q_7 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_7 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_7 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_8 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [8]),
	.Qin(\i2c_device|brip_cnt [8]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_8_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [9]),
	.Q(\i2c_device|brip_cnt [8]));
defparam \i2c_device|brip_cnt_q_8 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_8 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_8 .coord_z = 8;
defparam \i2c_device|brip_cnt_q_8 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_8 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_8 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_8 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_8 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_8 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_cnt_q_9 (
	.A(vcc),
	.B(\i2c_device|brip_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|brip_cnt_dataa_0_cout [9]),
	.Qin(\i2c_device|brip_cnt [9]),
	.Clk(\CLKOSC_i_o__i2c_device|brip_rec_A_0_Y_B_Y_X10008_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10008_Y10001_GND),
	.SyncReset(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10008_Y10001_GND),
	.LutOut(\i2c_device|brip_cnt_dataa_9_combout ),
	.Cout(\i2c_device|brip_cnt_dataa_0_cout [10]),
	.Q(\i2c_device|brip_cnt [9]));
defparam \i2c_device|brip_cnt_q_9 .coord_x = 17;
defparam \i2c_device|brip_cnt_q_9 .coord_y = 11;
defparam \i2c_device|brip_cnt_q_9 .coord_z = 9;
defparam \i2c_device|brip_cnt_q_9 .mask = 16'h96E8;
defparam \i2c_device|brip_cnt_q_9 .modeMux = 1'b1;
defparam \i2c_device|brip_cnt_q_9 .FeedbackMux = 1'b0;
defparam \i2c_device|brip_cnt_q_9 .ShiftMux = 1'b0;
defparam \i2c_device|brip_cnt_q_9 .BypassEn = 1'b1;
defparam \i2c_device|brip_cnt_q_9 .CarryEnb = 1'b0;

alta_slice \i2c_device|brip_rec_A_0_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [0]),
	.D(\i2c_device|brip_rec_A_0_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_rec_A_0_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .coord_x = 17;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .coord_y = 10;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .coord_z = 8;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .mask = 16'hFF0F;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|brip_rec_A_0_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_rec_d_0 (
	.A(\i2c_device|brip_rec [0]),
	.B(vcc),
	.C(\i2c_device|brip_rec [0]),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|brip_rec_d_0_q ),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|brip_rec_A_0_Y ),
	.Cout(),
	.Q(\i2c_device|brip_rec_d_0_q ));
defparam \i2c_device|brip_rec_d_0 .coord_x = 10;
defparam \i2c_device|brip_rec_d_0 .coord_y = 4;
defparam \i2c_device|brip_rec_d_0 .coord_z = 13;
defparam \i2c_device|brip_rec_d_0 .mask = 16'h5A5A;
defparam \i2c_device|brip_rec_d_0 .modeMux = 1'b0;
defparam \i2c_device|brip_rec_d_0 .FeedbackMux = 1'b1;
defparam \i2c_device|brip_rec_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|brip_rec_d_0 .BypassEn = 1'b1;
defparam \i2c_device|brip_rec_d_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|brip_rec_q_0 (
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [0]),
	.B(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [1]),
	.C(vcc),
	.D(\i2c_device|write_value [1]),
	.Cin(),
	.Qin(\i2c_device|brip_rec [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|brip_rec_A_0_1_Y ),
	.Cout(),
	.Q(\i2c_device|brip_rec [0]));
defparam \i2c_device|brip_rec_q_0 .coord_x = 10;
defparam \i2c_device|brip_rec_q_0 .coord_y = 4;
defparam \i2c_device|brip_rec_q_0 .coord_z = 2;
defparam \i2c_device|brip_rec_q_0 .mask = 16'h78F0;
defparam \i2c_device|brip_rec_q_0 .modeMux = 1'b0;
defparam \i2c_device|brip_rec_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|brip_rec_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|brip_rec_q_0 .BypassEn = 1'b0;
defparam \i2c_device|brip_rec_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state[0]_reg (
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.B(CLKOSC_clk_9_q_dataa_combout_datac_2_combout[3]),
	.C(vcc),
	.D(\i2c_device|start_B_0_Y ),
	.Cin(),
	.Qin(\i2c_device|i2c_state [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|start_B_0_Y_A_Y ),
	.Cout(),
	.Q(\i2c_device|i2c_state [0]));
defparam \i2c_device|i2c_state[0]_reg .coord_x = 10;
defparam \i2c_device|i2c_state[0]_reg .coord_y = 4;
defparam \i2c_device|i2c_state[0]_reg .coord_z = 6;
defparam \i2c_device|i2c_state[0]_reg .mask = 16'h14FF;
defparam \i2c_device|i2c_state[0]_reg .modeMux = 1'b0;
defparam \i2c_device|i2c_state[0]_reg .FeedbackMux = 1'b1;
defparam \i2c_device|i2c_state[0]_reg .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state[0]_reg .BypassEn = 1'b0;
defparam \i2c_device|i2c_state[0]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout (
	.A(vcc),
	.B(\i2c_device|i2c_state_datab_0_1_combout [0]),
	.C(CLKOSC_clk_8_q_datac_combout[3]),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .coord_x = 11;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .coord_y = 4;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .coord_z = 8;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .mask = 16'hFF3F;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout (
	.A(CLKOSC_clk_11_q_dataa_combout[2]),
	.B(CLKOSC_clk_8_q_datac_combout[1]),
	.C(\i2c_device|i2c_state_datac_0_1_combout [2]),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .coord_x = 10;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .coord_y = 3;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .coord_z = 15;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .mask = 16'h0305;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout (
	.A(vcc),
	.B(\i2c_device|i2c_state_datab_0_1_combout [1]),
	.C(vcc),
	.D(\i2c_device|i2c_state_datab_0_1_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .coord_x = 11;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .coord_y = 4;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .coord_z = 6;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .mask = 16'hCC00;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout (
	.A(CLKOSC_clk_10_q),
	.B(\i2c_device|i2c_state_datab_0_1_combout [0]),
	.C(CLKOSC_clk_9_q),
	.D(\i2c_device|i2c_state [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .coord_x = 11;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .coord_y = 4;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .coord_z = 12;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .mask = 16'h0800;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_dataa_0 (
	.A(vcc),
	.B(vcc),
	.C(CLKOSC_clk_10_q),
	.D(\i2c_device|i2c_state [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_dataa_0_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_dataa_0 .coord_x = 10;
defparam \i2c_device|i2c_state_dataa_0 .coord_y = 3;
defparam \i2c_device|i2c_state_dataa_0 .coord_z = 12;
defparam \i2c_device|i2c_state_dataa_0 .mask = 16'h00F0;
defparam \i2c_device|i2c_state_dataa_0 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_dataa_0 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_dataa_0 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_dataa_0 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_dataa_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_dataa_0_1 (
	.A(vcc),
	.B(\i2c_device|i2c_state [0]),
	.C(CLKOSC_clk_10_q),
	.D(CLKOSC_clk_9_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_dataa_combout[2]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_dataa_0_1 .coord_x = 10;
defparam \i2c_device|i2c_state_dataa_0_1 .coord_y = 3;
defparam \i2c_device|i2c_state_dataa_0_1 .coord_z = 2;
defparam \i2c_device|i2c_state_dataa_0_1 .mask = 16'hC000;
defparam \i2c_device|i2c_state_dataa_0_1 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_dataa_0_1 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_dataa_0_1 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_dataa_0_1 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_dataa_0_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_datab_0 (
	.A(CLKOSC_clk_9_q),
	.B(vcc),
	.C(\i2c_device|i2c_state [0]),
	.D(CLKOSC_clk_10_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_dataa_0_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_datab_0 .coord_x = 11;
defparam \i2c_device|i2c_state_datab_0 .coord_y = 3;
defparam \i2c_device|i2c_state_datab_0 .coord_z = 13;
defparam \i2c_device|i2c_state_datab_0 .mask = 16'hAA0A;
defparam \i2c_device|i2c_state_datab_0 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_datab_0 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_datab_0 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_datab_0 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_datab_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_datab_0_1 (
	.A(CLKOSC_clk_10_q),
	.B(vcc),
	.C(CLKOSC_clk_9_q),
	.D(\i2c_device|i2c_state [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_datab_0_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_datab_0_1 .coord_x = 11;
defparam \i2c_device|i2c_state_datab_0_1 .coord_y = 4;
defparam \i2c_device|i2c_state_datab_0_1 .coord_z = 1;
defparam \i2c_device|i2c_state_datab_0_1 .mask = 16'h5000;
defparam \i2c_device|i2c_state_datab_0_1 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_datab_0_1 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_datab_0_1 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_datab_0_1 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_datab_0_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_datac_0 (
	.A(vcc),
	.B(\i2c_device|i2c_state [0]),
	.C(CLKOSC_clk_10_q),
	.D(CLKOSC_clk_9_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_8_q_datac_combout[1]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_datac_0 .coord_x = 10;
defparam \i2c_device|i2c_state_datac_0 .coord_y = 3;
defparam \i2c_device|i2c_state_datac_0 .coord_z = 7;
defparam \i2c_device|i2c_state_datac_0 .mask = 16'hF333;
defparam \i2c_device|i2c_state_datac_0 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_datac_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_datac_0_1 (
	.A(CLKOSC_clk_9_q),
	.B(\i2c_device|i2c_state [0]),
	.C(CLKOSC_clk_10_q),
	.D(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_datac_0_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_datac_0_1 .coord_x = 10;
defparam \i2c_device|i2c_state_datac_0_1 .coord_y = 3;
defparam \i2c_device|i2c_state_datac_0_1 .coord_z = 0;
defparam \i2c_device|i2c_state_datac_0_1 .mask = 16'h00CD;
defparam \i2c_device|i2c_state_datac_0_1 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0_1 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0_1 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0_1 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_datac_0_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|i2c_state_datac_0_2 (
	.A(CLKOSC_clk_10_q),
	.B(vcc),
	.C(CLKOSC_clk_9_q),
	.D(\i2c_device|i2c_state [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_8_q_datac_combout[3]),
	.Cout(),
	.Q());
defparam \i2c_device|i2c_state_datac_0_2 .coord_x = 11;
defparam \i2c_device|i2c_state_datac_0_2 .coord_y = 4;
defparam \i2c_device|i2c_state_datac_0_2 .coord_z = 10;
defparam \i2c_device|i2c_state_datac_0_2 .mask = 16'h0500;
defparam \i2c_device|i2c_state_datac_0_2 .modeMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0_2 .FeedbackMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0_2 .ShiftMux = 1'b0;
defparam \i2c_device|i2c_state_datac_0_2 .BypassEn = 1'b0;
defparam \i2c_device|i2c_state_datac_0_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[12]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|locka_cnt_dataa_9_combout [12]),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [12]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[12]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [12]));
defparam \i2c_device|locka_cnt[12]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[12]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[12]_reg .coord_z = 0;
defparam \i2c_device|locka_cnt[12]_reg .mask = 16'hFF00;
defparam \i2c_device|locka_cnt[12]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[12]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[12]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[12]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[12]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[17]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|locka_cnt_dataa_9_combout [17]),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [17]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[17]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [17]));
defparam \i2c_device|locka_cnt[17]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[17]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[17]_reg .coord_z = 2;
defparam \i2c_device|locka_cnt[17]_reg .mask = 16'hFF00;
defparam \i2c_device|locka_cnt[17]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[17]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[17]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[17]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[17]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[19]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|locka_cnt_dataa_9_combout [19]),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [19]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[19]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [19]));
defparam \i2c_device|locka_cnt[19]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[19]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[19]_reg .coord_z = 4;
defparam \i2c_device|locka_cnt[19]_reg .mask = 16'hFF00;
defparam \i2c_device|locka_cnt[19]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[19]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[19]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[19]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[19]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[20]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|locka_cnt_dataa_9_combout [20]),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [20]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[20]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [20]));
defparam \i2c_device|locka_cnt[20]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[20]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[20]_reg .coord_z = 5;
defparam \i2c_device|locka_cnt[20]_reg .mask = 16'hFF00;
defparam \i2c_device|locka_cnt[20]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[20]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[20]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[20]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[20]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[21]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|locka_cnt_dataa_9_combout [21]),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [21]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[21]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [21]));
defparam \i2c_device|locka_cnt[21]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[21]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[21]_reg .coord_z = 3;
defparam \i2c_device|locka_cnt[21]_reg .mask = 16'hFF00;
defparam \i2c_device|locka_cnt[21]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[21]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[21]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[21]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[21]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[22]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|locka_cnt_dataa_9_combout [22]),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [22]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[22]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [22]));
defparam \i2c_device|locka_cnt[22]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[22]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[22]_reg .coord_z = 6;
defparam \i2c_device|locka_cnt[22]_reg .mask = 16'hFF00;
defparam \i2c_device|locka_cnt[22]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[22]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[22]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[22]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[22]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt[9]_reg (
	.A(\i2c_device|locka_cnt_dataa_9_combout [9]),
	.B(),
	.C(vcc),
	.D(),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [9]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10018_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10003_GND),
	.SyncReset(SyncReset_X10018_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ),
	.LutOut(\i2c_device|locka_cnt[9]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|locka_cnt [9]));
defparam \i2c_device|locka_cnt[9]_reg .coord_x = 20;
defparam \i2c_device|locka_cnt[9]_reg .coord_y = 8;
defparam \i2c_device|locka_cnt[9]_reg .coord_z = 1;
defparam \i2c_device|locka_cnt[9]_reg .mask = 16'hAAAA;
defparam \i2c_device|locka_cnt[9]_reg .modeMux = 1'b0;
defparam \i2c_device|locka_cnt[9]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt[9]_reg .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt[9]_reg .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt[9]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_10_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [4]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [4]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [5]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_10_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_10_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_10_1 .coord_z = 4;
defparam \i2c_device|locka_cnt_dataa_10_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_10_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_10_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_10_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_10_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_10_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_11_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [5]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [5]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [6]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_11_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_11_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_11_1 .coord_z = 5;
defparam \i2c_device|locka_cnt_dataa_11_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_11_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_11_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_11_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_11_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_11_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_12 (
	.A(\i2c_device|locka_cnt [12]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [12]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [12]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [13]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_12 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_12 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_12 .coord_z = 12;
defparam \i2c_device|locka_cnt_dataa_12 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_12 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_12 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_12 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_12 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_12 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_12_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [6]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [6]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [7]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_12_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_12_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_12_1 .coord_z = 6;
defparam \i2c_device|locka_cnt_dataa_12_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_12_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_12_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_12_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_12_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_12_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_13_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [7]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [7]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [8]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_13_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_13_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_13_1 .coord_z = 7;
defparam \i2c_device|locka_cnt_dataa_13_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_13_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_13_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_13_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_13_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_13_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_14_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [8]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [8]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [9]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_14_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_14_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_14_1 .coord_z = 8;
defparam \i2c_device|locka_cnt_dataa_14_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_14_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_14_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_14_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_14_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_14_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_15_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [9]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [9]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [10]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_15_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_15_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_15_1 .coord_z = 9;
defparam \i2c_device|locka_cnt_dataa_15_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_15_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_15_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_15_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_15_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_15_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_16_1 (
	.A(\i2c_device|locka_cnt [16]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [10]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [10]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [11]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_16_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_16_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_16_1 .coord_z = 10;
defparam \i2c_device|locka_cnt_dataa_16_1 .mask = 16'h69B2;
defparam \i2c_device|locka_cnt_dataa_16_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_16_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_16_2 (
	.A(\i2c_device|locka_cnt [15]),
	.B(\i2c_device|locka_cnt [16]),
	.C(\i2c_device|locka_cnt [14]),
	.D(\i2c_device|locka_cnt [18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_datab_21_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_16_2 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_16_2 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_16_2 .coord_z = 4;
defparam \i2c_device|locka_cnt_dataa_16_2 .mask = 16'h8000;
defparam \i2c_device|locka_cnt_dataa_16_2 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_2 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_2 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_2 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_16_3 (
	.A(\i2c_device|locka_cnt [14]),
	.B(\i2c_device|locka_cnt [16]),
	.C(\i2c_device|locka_cnt [15]),
	.D(\i2c_device|locka_cnt [18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_8_3_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_16_3 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_16_3 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_16_3 .coord_z = 8;
defparam \i2c_device|locka_cnt_dataa_16_3 .mask = 16'h0001;
defparam \i2c_device|locka_cnt_dataa_16_3 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_3 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_3 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_3 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_16_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_17 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [17]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [17]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [18]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_17 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_17 .coord_y = 8;
defparam \i2c_device|locka_cnt_dataa_17 .coord_z = 1;
defparam \i2c_device|locka_cnt_dataa_17 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_17 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_17 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_17 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_17 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_17 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_17_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [11]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [11]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [12]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_17_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_17_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_17_1 .coord_z = 11;
defparam \i2c_device|locka_cnt_dataa_17_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_17_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_17_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_17_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_17_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_17_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_18_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [12]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [12]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [13]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_18_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_18_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_18_1 .coord_z = 12;
defparam \i2c_device|locka_cnt_dataa_18_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_18_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_18_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_18_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_18_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_18_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_19 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [19]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [19]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [20]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_19 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_19 .coord_y = 8;
defparam \i2c_device|locka_cnt_dataa_19 .coord_z = 3;
defparam \i2c_device|locka_cnt_dataa_19 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_19 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_19 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_19 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_19 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_19 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_19_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [13]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [13]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [14]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_19_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_19_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_19_1 .coord_z = 13;
defparam \i2c_device|locka_cnt_dataa_19_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_19_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_19_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_19_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_19_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_19_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_20 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [20]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [20]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [20]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [21]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_20 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_20 .coord_y = 8;
defparam \i2c_device|locka_cnt_dataa_20 .coord_z = 4;
defparam \i2c_device|locka_cnt_dataa_20 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_20 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_20 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_20 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_20 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_20 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_20_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [20]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [14]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [14]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [15]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_20_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_20_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_20_1 .coord_z = 14;
defparam \i2c_device|locka_cnt_dataa_20_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_20_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_20_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_20_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_20_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_20_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_21 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [21]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [21]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [21]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [22]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_21 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_21 .coord_y = 8;
defparam \i2c_device|locka_cnt_dataa_21 .coord_z = 5;
defparam \i2c_device|locka_cnt_dataa_21 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_21 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_21 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_21_1 (
	.A(\i2c_device|locka_cnt [21]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [15]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [15]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [16]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_21_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_21_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_21_1 .coord_z = 15;
defparam \i2c_device|locka_cnt_dataa_21_1 .mask = 16'h69B2;
defparam \i2c_device|locka_cnt_dataa_21_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_21_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_21_2 (
	.A(\i2c_device|locka_cnt [10]),
	.B(\i2c_device|locka_cnt [21]),
	.C(\i2c_device|locka_cnt [19]),
	.D(\i2c_device|locka_cnt_dataa_22_2_combout [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_8_3_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_21_2 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_21_2 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_21_2 .coord_z = 9;
defparam \i2c_device|locka_cnt_dataa_21_2 .mask = 16'h0100;
defparam \i2c_device|locka_cnt_dataa_21_2 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_2 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_2 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_2 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_21_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_22 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [22]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [22]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [23]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_22 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_22 .coord_y = 8;
defparam \i2c_device|locka_cnt_dataa_22 .coord_z = 6;
defparam \i2c_device|locka_cnt_dataa_22 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_22 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_22 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_22_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [16]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [16]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [17]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_22_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_22_1 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_22_1 .coord_z = 0;
defparam \i2c_device|locka_cnt_dataa_22_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_22_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_22_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_22_2 (
	.A(\i2c_device|locka_cnt [20]),
	.B(\i2c_device|locka_cnt [11]),
	.C(\i2c_device|locka_cnt [17]),
	.D(\i2c_device|locka_cnt [22]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_22_2_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_22_2 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_22_2 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_22_2 .coord_z = 11;
defparam \i2c_device|locka_cnt_dataa_22_2 .mask = 16'h0001;
defparam \i2c_device|locka_cnt_dataa_22_2 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_2 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_2 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_2 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_22_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_4_1 (
	.A(\i2c_device|locka_cnt [2]),
	.B(\i2c_device|locka_cnt [3]),
	.C(\i2c_device|locka_cnt [4]),
	.D(\i2c_device|locka_cnt [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_datac_0_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_4_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_4_1 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_4_1 .coord_z = 14;
defparam \i2c_device|locka_cnt_dataa_4_1 .mask = 16'h0001;
defparam \i2c_device|locka_cnt_dataa_4_1 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_4_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_4_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_4_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_4_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [17]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .coord_z = 1;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .mask = 16'hF0F0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab (
	.A(vcc),
	.B(\i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout ),
	.C(vcc),
	.D(\i2c_device|locka_cnt_datab_21_combout_datab_1_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .coord_z = 2;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .mask = 16'h00CC;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_6_1_cout_cin_17_combout_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_7_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [1]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [1]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [2]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_7_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_7_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_7_1 .coord_z = 1;
defparam \i2c_device|locka_cnt_dataa_7_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_7_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_7_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_7_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_7_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_7_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_8_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [2]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [2]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [3]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_8_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_8_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_8_1 .coord_z = 2;
defparam \i2c_device|locka_cnt_dataa_8_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_8_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_8_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_8_2 (
	.A(\i2c_device|locka_cnt [8]),
	.B(\i2c_device|locka_cnt [7]),
	.C(\i2c_device|locka_cnt [6]),
	.D(\i2c_device|locka_cnt [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_datab_21_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_8_2 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_8_2 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_8_2 .coord_z = 5;
defparam \i2c_device|locka_cnt_dataa_8_2 .mask = 16'h4000;
defparam \i2c_device|locka_cnt_dataa_8_2 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_2 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_2 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_2 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_8_3 (
	.A(\i2c_device|locka_cnt [8]),
	.B(\i2c_device|locka_cnt [7]),
	.C(\i2c_device|locka_cnt [6]),
	.D(\i2c_device|locka_cnt [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_8_3_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_8_3 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_8_3 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_8_3 .coord_z = 7;
defparam \i2c_device|locka_cnt_dataa_8_3 .mask = 16'h0001;
defparam \i2c_device|locka_cnt_dataa_8_3 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|locka_cnt_datac_0_combout [1]),
	.D(\i2c_device|locka_cnt_datac_0_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_8_3_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .coord_z = 12;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .mask = 16'hF000;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_combout_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 (
	.A(\i2c_device|locka_cnt_dataa_8_3_combout [2]),
	.B(\i2c_device|locka_cnt_dataa_8_3_combout [3]),
	.C(\i2c_device|locka_cnt_dataa_8_3_combout [0]),
	.D(\i2c_device|locka_cnt_dataa_8_3_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .coord_z = 6;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .mask = 16'h8000;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_8_3_combout_dataa_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_dataa_9 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [9]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_9_combout [9]),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [10]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_9 .coord_x = 19;
defparam \i2c_device|locka_cnt_dataa_9 .coord_y = 9;
defparam \i2c_device|locka_cnt_dataa_9 .coord_z = 9;
defparam \i2c_device|locka_cnt_dataa_9 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_dataa_9 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_9 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_9 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_9 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_9 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_dataa_9_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_6_1_cout [3]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [3]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [4]),
	.Q());
defparam \i2c_device|locka_cnt_dataa_9_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_dataa_9_1 .coord_y = 10;
defparam \i2c_device|locka_cnt_dataa_9_1 .coord_z = 3;
defparam \i2c_device|locka_cnt_dataa_9_1 .mask = 16'h69D4;
defparam \i2c_device|locka_cnt_dataa_9_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_dataa_9_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_9_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_dataa_9_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_dataa_9_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_datab_21 (
	.A(\i2c_device|locka_cnt [10]),
	.B(\i2c_device|locka_cnt_dataa_22_2_combout [3]),
	.C(\i2c_device|locka_cnt [19]),
	.D(\i2c_device|locka_cnt [21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_datab_21_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_datab_21 .coord_x = 20;
defparam \i2c_device|locka_cnt_datab_21 .coord_y = 9;
defparam \i2c_device|locka_cnt_datab_21 .coord_z = 10;
defparam \i2c_device|locka_cnt_datab_21 .mask = 16'h8000;
defparam \i2c_device|locka_cnt_datab_21 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_datab_21 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_datab_21 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_datab_21 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_datab_21 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_datab_21_combout_datab_1 (
	.A(\i2c_device|locka_cnt_datab_21_combout [1]),
	.B(\i2c_device|locka_cnt_dataa_8_3_combout [0]),
	.C(\i2c_device|locka_cnt_datab_21_combout [2]),
	.D(\i2c_device|locka_cnt_datab_21_combout [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_datab_21_combout_datab_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .coord_x = 20;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .coord_y = 9;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .coord_z = 3;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .mask = 16'h8000;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_datab_21_combout_datab_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_datac_0 (
	.A(\i2c_device|locka_cnt [1]),
	.B(\i2c_device|locka_cnt [0]),
	.C(\i2c_device|locka_cnt [12]),
	.D(\i2c_device|locka_cnt [13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_cnt_datac_0_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|locka_cnt_datac_0 .coord_x = 20;
defparam \i2c_device|locka_cnt_datac_0 .coord_y = 9;
defparam \i2c_device|locka_cnt_datac_0 .coord_z = 13;
defparam \i2c_device|locka_cnt_datac_0 .mask = 16'h0001;
defparam \i2c_device|locka_cnt_datac_0 .modeMux = 1'b0;
defparam \i2c_device|locka_cnt_datac_0 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_datac_0 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_datac_0 .BypassEn = 1'b0;
defparam \i2c_device|locka_cnt_datac_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_cnt_q_0 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|locka_cnt [0]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_0_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [1]),
	.Q(\i2c_device|locka_cnt [0]));
defparam \i2c_device|locka_cnt_q_0 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_0 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_0 .coord_z = 0;
defparam \i2c_device|locka_cnt_q_0 .mask = 16'h66DD;
defparam \i2c_device|locka_cnt_q_0 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_0 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_0 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_1 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [1]),
	.Qin(\i2c_device|locka_cnt [1]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_1_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [2]),
	.Q(\i2c_device|locka_cnt [1]));
defparam \i2c_device|locka_cnt_q_1 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_1 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_1 .coord_z = 1;
defparam \i2c_device|locka_cnt_q_1 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_1 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_1 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_10 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [10]),
	.Qin(\i2c_device|locka_cnt [10]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_10_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [11]),
	.Q(\i2c_device|locka_cnt [10]));
defparam \i2c_device|locka_cnt_q_10 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_10 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_10 .coord_z = 10;
defparam \i2c_device|locka_cnt_q_10 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_10 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_10 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_10 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_10 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_10 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_11 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [11]),
	.Qin(\i2c_device|locka_cnt [11]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_11_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [12]),
	.Q(\i2c_device|locka_cnt [11]));
defparam \i2c_device|locka_cnt_q_11 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_11 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_11 .coord_z = 11;
defparam \i2c_device|locka_cnt_q_11 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_11 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_11 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_11 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_11 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_11 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_13 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [13]),
	.Qin(\i2c_device|locka_cnt [13]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_13_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [14]),
	.Q(\i2c_device|locka_cnt [13]));
defparam \i2c_device|locka_cnt_q_13 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_13 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_13 .coord_z = 13;
defparam \i2c_device|locka_cnt_q_13 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_13 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_13 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_13 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_13 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_13 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_14 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [14]),
	.Qin(\i2c_device|locka_cnt [14]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_14_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [15]),
	.Q(\i2c_device|locka_cnt [14]));
defparam \i2c_device|locka_cnt_q_14 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_14 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_14 .coord_z = 14;
defparam \i2c_device|locka_cnt_q_14 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_14 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_14 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_14 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_14 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_14 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_15 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [15]),
	.Qin(\i2c_device|locka_cnt [15]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_15_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [16]),
	.Q(\i2c_device|locka_cnt [15]));
defparam \i2c_device|locka_cnt_q_15 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_15 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_15 .coord_z = 15;
defparam \i2c_device|locka_cnt_q_15 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_15 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_15 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_15 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_15 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_15 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_16 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [16]),
	.Qin(\i2c_device|locka_cnt [16]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10010_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10010_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10010_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_16_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [17]),
	.Q(\i2c_device|locka_cnt [16]));
defparam \i2c_device|locka_cnt_q_16 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_16 .coord_y = 8;
defparam \i2c_device|locka_cnt_q_16 .coord_z = 0;
defparam \i2c_device|locka_cnt_q_16 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_16 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_16 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_16 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_16 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_16 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_18 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [18]),
	.Qin(\i2c_device|locka_cnt [18]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10010_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10010_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10010_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10010_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_18_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [19]),
	.Q(\i2c_device|locka_cnt [18]));
defparam \i2c_device|locka_cnt_q_18 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_18 .coord_y = 8;
defparam \i2c_device|locka_cnt_q_18 .coord_z = 2;
defparam \i2c_device|locka_cnt_q_18 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_18 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_18 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_18 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_18 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_18 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_2 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [2]),
	.Qin(\i2c_device|locka_cnt [2]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_2_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [3]),
	.Q(\i2c_device|locka_cnt [2]));
defparam \i2c_device|locka_cnt_q_2 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_2 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_2 .coord_z = 2;
defparam \i2c_device|locka_cnt_q_2 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_2 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_2 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_3 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [3]),
	.Qin(\i2c_device|locka_cnt [3]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_3_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [4]),
	.Q(\i2c_device|locka_cnt [3]));
defparam \i2c_device|locka_cnt_q_3 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_3 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_3 .coord_z = 3;
defparam \i2c_device|locka_cnt_q_3 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_3 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_3 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_3 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_4 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [4]),
	.Qin(\i2c_device|locka_cnt [4]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_4_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [5]),
	.Q(\i2c_device|locka_cnt [4]));
defparam \i2c_device|locka_cnt_q_4 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_4 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_4 .coord_z = 4;
defparam \i2c_device|locka_cnt_q_4 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_4 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_4 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_4 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_5 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [5]),
	.Qin(\i2c_device|locka_cnt [5]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_5_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [6]),
	.Q(\i2c_device|locka_cnt [5]));
defparam \i2c_device|locka_cnt_q_5 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_5 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_5 .coord_z = 5;
defparam \i2c_device|locka_cnt_q_5 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_5 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_5 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_5 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_6 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [6]),
	.Qin(\i2c_device|locka_cnt [6]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_6_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [7]),
	.Q(\i2c_device|locka_cnt [6]));
defparam \i2c_device|locka_cnt_q_6 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_6 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_6 .coord_z = 6;
defparam \i2c_device|locka_cnt_q_6 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_6 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_6 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_7 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [7]),
	.Qin(\i2c_device|locka_cnt [7]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_7_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [8]),
	.Q(\i2c_device|locka_cnt [7]));
defparam \i2c_device|locka_cnt_q_7 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_7 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_7 .coord_z = 7;
defparam \i2c_device|locka_cnt_q_7 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_7 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_7 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_cnt_q_8 (
	.A(vcc),
	.B(\i2c_device|locka_cnt [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|locka_cnt_dataa_0_cout [8]),
	.Qin(\i2c_device|locka_cnt [8]),
	.Clk(\CLKOSC_i_o__i2c_device|locka_rec_A_0_Y_B_Y_X10012_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10001_GND),
	.SyncReset(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10001_GND),
	.LutOut(\i2c_device|locka_cnt_dataa_8_combout ),
	.Cout(\i2c_device|locka_cnt_dataa_0_cout [9]),
	.Q(\i2c_device|locka_cnt [8]));
defparam \i2c_device|locka_cnt_q_8 .coord_x = 19;
defparam \i2c_device|locka_cnt_q_8 .coord_y = 9;
defparam \i2c_device|locka_cnt_q_8 .coord_z = 8;
defparam \i2c_device|locka_cnt_q_8 .mask = 16'h96E8;
defparam \i2c_device|locka_cnt_q_8 .modeMux = 1'b1;
defparam \i2c_device|locka_cnt_q_8 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_cnt_q_8 .ShiftMux = 1'b0;
defparam \i2c_device|locka_cnt_q_8 .BypassEn = 1'b1;
defparam \i2c_device|locka_cnt_q_8 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_rec_A_0_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|locka_rec_A_0_Y ),
	.D(\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_rec_A_0_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .coord_x = 19;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .coord_y = 8;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .coord_z = 7;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .mask = 16'hF0FF;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_rec_A_0_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|locka_rec_d_0_q ),
	.D(\i2c_device|locka_rec [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_rec_A_0_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|locka_rec_A_0_Y_combout .coord_x = 19;
defparam \i2c_device|locka_rec_A_0_Y_combout .coord_y = 8;
defparam \i2c_device|locka_rec_A_0_Y_combout .coord_z = 8;
defparam \i2c_device|locka_rec_A_0_Y_combout .mask = 16'h0FF0;
defparam \i2c_device|locka_rec_A_0_Y_combout .modeMux = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|locka_rec_A_0_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|locka_rec_d_0 (
	.A(\i2c_device|locka_cnt [6]),
	.B(vcc),
	.C(\i2c_device|locka_rec [0]),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|locka_rec_d_0_q ),
	.Clk(CLKOSC_i_o_X10017_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10017_Y10003_GND),
	.SyncReset(SyncReset_X10017_Y10003_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10003_VCC),
	.LutOut(\i2c_device|locka_cnt_dataa_6_1_combout [0]),
	.Cout(\i2c_device|locka_cnt_dataa_6_1_cout [1]),
	.Q(\i2c_device|locka_rec_d_0_q ));
defparam \i2c_device|locka_rec_d_0 .coord_x = 20;
defparam \i2c_device|locka_rec_d_0 .coord_y = 10;
defparam \i2c_device|locka_rec_d_0 .coord_z = 0;
defparam \i2c_device|locka_rec_d_0 .mask = 16'h66BB;
defparam \i2c_device|locka_rec_d_0 .modeMux = 1'b1;
defparam \i2c_device|locka_rec_d_0 .FeedbackMux = 1'b0;
defparam \i2c_device|locka_rec_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|locka_rec_d_0 .BypassEn = 1'b1;
defparam \i2c_device|locka_rec_d_0 .CarryEnb = 1'b0;

alta_slice \i2c_device|locka_rec_q_0 (
	.A(\i2c_device|write_value [3]),
	.B(\i2c_device|write_value_dataa_2_combout_datad_3_combout [1]),
	.C(vcc),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0]),
	.Cin(),
	.Qin(\i2c_device|locka_rec [0]),
	.Clk(CLKOSC_i_o_X10010_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10010_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|locka_rec_A_0_1_Y ),
	.Cout(),
	.Q(\i2c_device|locka_rec [0]));
defparam \i2c_device|locka_rec_q_0 .coord_x = 19;
defparam \i2c_device|locka_rec_q_0 .coord_y = 8;
defparam \i2c_device|locka_rec_q_0 .coord_z = 9;
defparam \i2c_device|locka_rec_q_0 .mask = 16'h78F0;
defparam \i2c_device|locka_rec_q_0 .modeMux = 1'b0;
defparam \i2c_device|locka_rec_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|locka_rec_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|locka_rec_q_0 .BypassEn = 1'b0;
defparam \i2c_device|locka_rec_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[12]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|lockb_cnt_dataa_9_combout [12]),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [12]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[12]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [12]));
defparam \i2c_device|lockb_cnt[12]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[12]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[12]_reg .coord_z = 10;
defparam \i2c_device|lockb_cnt[12]_reg .mask = 16'hFF00;
defparam \i2c_device|lockb_cnt[12]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[12]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[12]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[12]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[12]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[17]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|lockb_cnt_dataa_9_combout [17]),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [17]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[17]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [17]));
defparam \i2c_device|lockb_cnt[17]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[17]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[17]_reg .coord_z = 7;
defparam \i2c_device|lockb_cnt[17]_reg .mask = 16'hFF00;
defparam \i2c_device|lockb_cnt[17]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[17]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[17]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[17]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[17]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[19]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|lockb_cnt_dataa_9_combout [19]),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [19]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[19]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [19]));
defparam \i2c_device|lockb_cnt[19]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[19]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[19]_reg .coord_z = 2;
defparam \i2c_device|lockb_cnt[19]_reg .mask = 16'hFF00;
defparam \i2c_device|lockb_cnt[19]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[19]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[19]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[19]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[19]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[20]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|lockb_cnt_dataa_9_combout [20]),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [20]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[20]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [20]));
defparam \i2c_device|lockb_cnt[20]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[20]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[20]_reg .coord_z = 5;
defparam \i2c_device|lockb_cnt[20]_reg .mask = 16'hFF00;
defparam \i2c_device|lockb_cnt[20]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[20]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[20]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[20]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[20]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[21]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|lockb_cnt_dataa_9_combout [21]),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [21]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[21]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [21]));
defparam \i2c_device|lockb_cnt[21]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[21]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[21]_reg .coord_z = 9;
defparam \i2c_device|lockb_cnt[21]_reg .mask = 16'hFF00;
defparam \i2c_device|lockb_cnt[21]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[21]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[21]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[21]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[21]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[22]_reg (
	.A(),
	.B(),
	.C(vcc),
	.D(\i2c_device|lockb_cnt_dataa_9_combout [22]),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [22]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[22]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [22]));
defparam \i2c_device|lockb_cnt[22]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[22]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[22]_reg .coord_z = 8;
defparam \i2c_device|lockb_cnt[22]_reg .mask = 16'hFF00;
defparam \i2c_device|lockb_cnt[22]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[22]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[22]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[22]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[22]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt[9]_reg (
	.A(\i2c_device|lockb_cnt_dataa_9_combout [9]),
	.B(),
	.C(vcc),
	.D(),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [9]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10014_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(SyncReset_X10014_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ),
	.LutOut(\i2c_device|lockb_cnt[9]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_cnt [9]));
defparam \i2c_device|lockb_cnt[9]_reg .coord_x = 20;
defparam \i2c_device|lockb_cnt[9]_reg .coord_y = 6;
defparam \i2c_device|lockb_cnt[9]_reg .coord_z = 6;
defparam \i2c_device|lockb_cnt[9]_reg .mask = 16'hAAAA;
defparam \i2c_device|lockb_cnt[9]_reg .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt[9]_reg .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt[9]_reg .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt[9]_reg .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt[9]_reg .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_11_2 (
	.A(\i2c_device|lockb_cnt [20]),
	.B(\i2c_device|lockb_cnt [21]),
	.C(\i2c_device|lockb_cnt [11]),
	.D(\i2c_device|lockb_cnt_dataa_8_3_combout [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_11_2_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_11_2 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_11_2 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_11_2 .coord_z = 10;
defparam \i2c_device|lockb_cnt_dataa_11_2 .mask = 16'h0100;
defparam \i2c_device|lockb_cnt_dataa_11_2 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 (
	.A(\i2c_device|lockb_cnt_dataa_9_2_combout [2]),
	.B(\i2c_device|lockb_cnt_dataa_9_2_combout [3]),
	.C(\i2c_device|lockb_cnt_dataa_9_2_combout [0]),
	.D(\i2c_device|lockb_cnt_dataa_9_2_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_11_2_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .coord_x = 20;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .coord_z = 0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .mask = 16'h8000;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_combout_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|lockb_cnt_dataa_11_2_combout [1]),
	.D(\i2c_device|lockb_cnt_dataa_11_2_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .coord_z = 12;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .mask = 16'hF000;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_12 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [12]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [12]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [13]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_12 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_12 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_12 .coord_z = 12;
defparam \i2c_device|lockb_cnt_dataa_12 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_12 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_12 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_12_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [4]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [4]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [5]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_12_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_12_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_12_1 .coord_z = 4;
defparam \i2c_device|lockb_cnt_dataa_12_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_12_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_12_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_12_2 (
	.A(\i2c_device|lockb_cnt [12]),
	.B(\i2c_device|lockb_cnt [13]),
	.C(\i2c_device|lockb_cnt [14]),
	.D(\i2c_device|lockb_cnt [15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_2_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_12_2 .coord_x = 20;
defparam \i2c_device|lockb_cnt_dataa_12_2 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_12_2 .coord_z = 11;
defparam \i2c_device|lockb_cnt_dataa_12_2 .mask = 16'h0001;
defparam \i2c_device|lockb_cnt_dataa_12_2 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_2 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_2 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_2 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_12_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_13_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [5]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [5]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [6]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_13_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_13_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_13_1 .coord_z = 5;
defparam \i2c_device|lockb_cnt_dataa_13_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_13_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_13_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_13_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_13_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_13_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_14_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [6]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [6]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [7]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_14_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_14_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_14_1 .coord_z = 6;
defparam \i2c_device|lockb_cnt_dataa_14_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_14_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_14_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_14_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_14_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_14_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_15_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [7]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [7]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [8]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_15_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_15_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_15_1 .coord_z = 7;
defparam \i2c_device|lockb_cnt_dataa_15_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_15_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_15_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_15_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_15_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_15_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_16_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [8]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [8]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [9]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_16_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_16_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_16_1 .coord_z = 8;
defparam \i2c_device|lockb_cnt_dataa_16_1 .mask = 16'h69D4;
defparam \i2c_device|lockb_cnt_dataa_16_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_16_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_16_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_16_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_16_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_17 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [17]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [17]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [18]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_17 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_17 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_17 .coord_z = 1;
defparam \i2c_device|lockb_cnt_dataa_17 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_17 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_17 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_17 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_17 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_17 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_17_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [9]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [9]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [10]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_17_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_17_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_17_1 .coord_z = 9;
defparam \i2c_device|lockb_cnt_dataa_17_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_17_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_17_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_17_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_17_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_17_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_18_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [10]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [10]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [11]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_18_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_18_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_18_1 .coord_z = 10;
defparam \i2c_device|lockb_cnt_dataa_18_1 .mask = 16'h69D4;
defparam \i2c_device|lockb_cnt_dataa_18_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_18_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_18_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_18_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_18_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_19 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [19]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [19]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [20]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_19 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_19 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_19 .coord_z = 3;
defparam \i2c_device|lockb_cnt_dataa_19 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_19 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_19 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_19 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_19 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_19 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_19_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [11]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [11]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [12]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_19_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_19_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_19_1 .coord_z = 11;
defparam \i2c_device|lockb_cnt_dataa_19_1 .mask = 16'h69D4;
defparam \i2c_device|lockb_cnt_dataa_19_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_19_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_19_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_19_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_19_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_20 (
	.A(\i2c_device|lockb_cnt [20]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [20]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [20]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [21]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_20 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_20 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_20 .coord_z = 4;
defparam \i2c_device|lockb_cnt_dataa_20 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_20 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_20 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_20 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_20 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_20 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_20_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [20]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [12]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [12]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [13]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_20_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_20_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_20_1 .coord_z = 12;
defparam \i2c_device|lockb_cnt_dataa_20_1 .mask = 16'h69D4;
defparam \i2c_device|lockb_cnt_dataa_20_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_20_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_20_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_20_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_20_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_21 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [21]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [21]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [21]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [22]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_21 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_21 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_21 .coord_z = 5;
defparam \i2c_device|lockb_cnt_dataa_21 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_21 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_21 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_21 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_21 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_21 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_21_1 (
	.A(\i2c_device|lockb_cnt [21]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [13]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [13]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [14]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_21_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_21_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_21_1 .coord_z = 13;
defparam \i2c_device|lockb_cnt_dataa_21_1 .mask = 16'h69B2;
defparam \i2c_device|lockb_cnt_dataa_21_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_21_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_21_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_21_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_21_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_22 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [22]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [22]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [23]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_22 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_22 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_22 .coord_z = 6;
defparam \i2c_device|lockb_cnt_dataa_22 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_22 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_22 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_22 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_22 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_22 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_22_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [14]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_combout [14]),
	.Cout(\i2c_device|lockb_cnt_dataa_8_1_cout [15]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_22_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_22_1 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_22_1 .coord_z = 14;
defparam \i2c_device|lockb_cnt_dataa_22_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_22_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_22_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_22_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_22_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_22_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_2_1 (
	.A(\i2c_device|lockb_cnt [0]),
	.B(\i2c_device|lockb_cnt [2]),
	.C(\i2c_device|lockb_cnt [3]),
	.D(\i2c_device|lockb_cnt [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_2_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_2_1 .coord_x = 20;
defparam \i2c_device|lockb_cnt_dataa_2_1 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_2_1 .coord_z = 4;
defparam \i2c_device|lockb_cnt_dataa_2_1 .mask = 16'h0001;
defparam \i2c_device|lockb_cnt_dataa_2_1 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_2_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_2_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_2_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_2_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_6_1 (
	.A(\i2c_device|lockb_cnt [5]),
	.B(\i2c_device|lockb_cnt [6]),
	.C(\i2c_device|lockb_cnt [7]),
	.D(\i2c_device|lockb_cnt [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_2_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_6_1 .coord_x = 20;
defparam \i2c_device|lockb_cnt_dataa_6_1 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_6_1 .coord_z = 3;
defparam \i2c_device|lockb_cnt_dataa_6_1 .mask = 16'h0001;
defparam \i2c_device|lockb_cnt_dataa_6_1 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_6_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_6_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_6_1 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_6_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_8_1_cout [15]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .coord_y = 7;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .coord_z = 15;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .mask = 16'hF0F0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac (
	.A(vcc),
	.B(\i2c_device|lockb_cnt_datab_11_combout [0]),
	.C(\i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout ),
	.D(\i2c_device|lockb_cnt_dataa_11_2_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac_combout ),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .coord_z = 11;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .mask = 16'h30F0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_1_cout_cin_15_combout_datac .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_8_2 (
	.A(\i2c_device|lockb_cnt [18]),
	.B(\i2c_device|lockb_cnt [19]),
	.C(\i2c_device|lockb_cnt [16]),
	.D(\i2c_device|lockb_cnt [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_2_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_8_2 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_8_2 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_8_2 .coord_z = 8;
defparam \i2c_device|lockb_cnt_dataa_8_2 .mask = 16'h8000;
defparam \i2c_device|lockb_cnt_dataa_8_2 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_2 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_2 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_2 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_8_3 (
	.A(\i2c_device|lockb_cnt [18]),
	.B(\i2c_device|lockb_cnt [19]),
	.C(\i2c_device|lockb_cnt [16]),
	.D(\i2c_device|lockb_cnt [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_3_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_8_3 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_8_3 .coord_y = 5;
defparam \i2c_device|lockb_cnt_dataa_8_3 .coord_z = 9;
defparam \i2c_device|lockb_cnt_dataa_8_3 .mask = 16'h0001;
defparam \i2c_device|lockb_cnt_dataa_8_3 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_3 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_3 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_3 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_8_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_dataa_9 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [9]),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_combout [9]),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [10]),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_9 .coord_x = 19;
defparam \i2c_device|lockb_cnt_dataa_9 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_9 .coord_z = 9;
defparam \i2c_device|lockb_cnt_dataa_9 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_dataa_9 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_dataa_9 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_dataa_9_2 (
	.A(\i2c_device|lockb_cnt [9]),
	.B(\i2c_device|lockb_cnt [10]),
	.C(\i2c_device|lockb_cnt [22]),
	.D(\i2c_device|lockb_cnt [17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_dataa_9_2_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_dataa_9_2 .coord_x = 20;
defparam \i2c_device|lockb_cnt_dataa_9_2 .coord_y = 6;
defparam \i2c_device|lockb_cnt_dataa_9_2 .coord_z = 1;
defparam \i2c_device|lockb_cnt_dataa_9_2 .mask = 16'h0001;
defparam \i2c_device|lockb_cnt_dataa_9_2 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9_2 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9_2 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9_2 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_dataa_9_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_datab_11 (
	.A(\i2c_device|lockb_cnt_dataa_8_2_combout [0]),
	.B(\i2c_device|lockb_cnt [21]),
	.C(\i2c_device|lockb_cnt [11]),
	.D(\i2c_device|lockb_cnt [20]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_cnt_datab_11_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_cnt_datab_11 .coord_x = 19;
defparam \i2c_device|lockb_cnt_datab_11 .coord_y = 5;
defparam \i2c_device|lockb_cnt_datab_11 .coord_z = 7;
defparam \i2c_device|lockb_cnt_datab_11 .mask = 16'h8000;
defparam \i2c_device|lockb_cnt_datab_11 .modeMux = 1'b0;
defparam \i2c_device|lockb_cnt_datab_11 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_datab_11 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_datab_11 .BypassEn = 1'b0;
defparam \i2c_device|lockb_cnt_datab_11 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_cnt_q_0 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2c_device|lockb_cnt [0]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_0_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [1]),
	.Q(\i2c_device|lockb_cnt [0]));
defparam \i2c_device|lockb_cnt_q_0 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_0 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_0 .coord_z = 0;
defparam \i2c_device|lockb_cnt_q_0 .mask = 16'h66DD;
defparam \i2c_device|lockb_cnt_q_0 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_0 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_0 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_1 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [1]),
	.Qin(\i2c_device|lockb_cnt [1]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_1_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [2]),
	.Q(\i2c_device|lockb_cnt [1]));
defparam \i2c_device|lockb_cnt_q_1 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_1 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_1 .coord_z = 1;
defparam \i2c_device|lockb_cnt_q_1 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_1 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_1 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_1 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_10 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [10]),
	.Qin(\i2c_device|lockb_cnt [10]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_10_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [11]),
	.Q(\i2c_device|lockb_cnt [10]));
defparam \i2c_device|lockb_cnt_q_10 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_10 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_10 .coord_z = 10;
defparam \i2c_device|lockb_cnt_q_10 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_10 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_10 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_10 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_10 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_10 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_11 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [11]),
	.Qin(\i2c_device|lockb_cnt [11]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_11_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [12]),
	.Q(\i2c_device|lockb_cnt [11]));
defparam \i2c_device|lockb_cnt_q_11 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_11 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_11 .coord_z = 11;
defparam \i2c_device|lockb_cnt_q_11 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_11 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_11 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_11 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_11 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_11 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_13 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [13]),
	.Qin(\i2c_device|lockb_cnt [13]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_13_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [14]),
	.Q(\i2c_device|lockb_cnt [13]));
defparam \i2c_device|lockb_cnt_q_13 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_13 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_13 .coord_z = 13;
defparam \i2c_device|lockb_cnt_q_13 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_13 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_13 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_13 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_13 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_13 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_14 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [14]),
	.Qin(\i2c_device|lockb_cnt [14]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_14_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [15]),
	.Q(\i2c_device|lockb_cnt [14]));
defparam \i2c_device|lockb_cnt_q_14 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_14 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_14 .coord_z = 14;
defparam \i2c_device|lockb_cnt_q_14 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_14 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_14 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_14 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_14 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_14 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_15 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [15]),
	.Qin(\i2c_device|lockb_cnt [15]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_15_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [16]),
	.Q(\i2c_device|lockb_cnt [15]));
defparam \i2c_device|lockb_cnt_q_15 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_15 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_15 .coord_z = 15;
defparam \i2c_device|lockb_cnt_q_15 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_15 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_15 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_15 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_15 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_15 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_16 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [16]),
	.Qin(\i2c_device|lockb_cnt [16]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10005_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10005_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10005_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10005_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_16_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [17]),
	.Q(\i2c_device|lockb_cnt [16]));
defparam \i2c_device|lockb_cnt_q_16 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_16 .coord_y = 5;
defparam \i2c_device|lockb_cnt_q_16 .coord_z = 0;
defparam \i2c_device|lockb_cnt_q_16 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_16 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_16 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_16 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_16 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_16 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_18 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [18]),
	.Qin(\i2c_device|lockb_cnt [18]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10005_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10005_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10005_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10005_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_18_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [19]),
	.Q(\i2c_device|lockb_cnt [18]));
defparam \i2c_device|lockb_cnt_q_18 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_18 .coord_y = 5;
defparam \i2c_device|lockb_cnt_q_18 .coord_z = 2;
defparam \i2c_device|lockb_cnt_q_18 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_18 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_18 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_18 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_18 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_18 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_2 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [2]),
	.Qin(\i2c_device|lockb_cnt [2]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_2_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [3]),
	.Q(\i2c_device|lockb_cnt [2]));
defparam \i2c_device|lockb_cnt_q_2 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_2 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_2 .coord_z = 2;
defparam \i2c_device|lockb_cnt_q_2 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_2 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_2 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_2 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_3 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [3]),
	.Qin(\i2c_device|lockb_cnt [3]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_3_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [4]),
	.Q(\i2c_device|lockb_cnt [3]));
defparam \i2c_device|lockb_cnt_q_3 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_3 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_3 .coord_z = 3;
defparam \i2c_device|lockb_cnt_q_3 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_3 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_3 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_3 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_4 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [4]),
	.Qin(\i2c_device|lockb_cnt [4]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_4_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [5]),
	.Q(\i2c_device|lockb_cnt [4]));
defparam \i2c_device|lockb_cnt_q_4 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_4 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_4 .coord_z = 4;
defparam \i2c_device|lockb_cnt_q_4 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_4 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_4 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_4 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_5 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [5]),
	.Qin(\i2c_device|lockb_cnt [5]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_5_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [6]),
	.Q(\i2c_device|lockb_cnt [5]));
defparam \i2c_device|lockb_cnt_q_5 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_5 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_5 .coord_z = 5;
defparam \i2c_device|lockb_cnt_q_5 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_5 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_5 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_5 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_6 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [6]),
	.Qin(\i2c_device|lockb_cnt [6]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_6_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [7]),
	.Q(\i2c_device|lockb_cnt [6]));
defparam \i2c_device|lockb_cnt_q_6 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_6 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_6 .coord_z = 6;
defparam \i2c_device|lockb_cnt_q_6 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_6 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_6 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_6 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_7 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [7]),
	.Qin(\i2c_device|lockb_cnt [7]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_7_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [8]),
	.Q(\i2c_device|lockb_cnt [7]));
defparam \i2c_device|lockb_cnt_q_7 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_7 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_7 .coord_z = 7;
defparam \i2c_device|lockb_cnt_q_7 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_7 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_7 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_7 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_cnt_q_8 (
	.A(vcc),
	.B(\i2c_device|lockb_cnt [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2c_device|lockb_cnt_dataa_0_cout [8]),
	.Qin(\i2c_device|lockb_cnt [8]),
	.Clk(\CLKOSC_i_o__i2c_device|lockb_rec_A_0_Y_B_Y_X10002_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10001_GND),
	.SyncReset(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10001_GND),
	.LutOut(\i2c_device|lockb_cnt_dataa_8_combout ),
	.Cout(\i2c_device|lockb_cnt_dataa_0_cout [9]),
	.Q(\i2c_device|lockb_cnt [8]));
defparam \i2c_device|lockb_cnt_q_8 .coord_x = 19;
defparam \i2c_device|lockb_cnt_q_8 .coord_y = 6;
defparam \i2c_device|lockb_cnt_q_8 .coord_z = 8;
defparam \i2c_device|lockb_cnt_q_8 .mask = 16'h96E8;
defparam \i2c_device|lockb_cnt_q_8 .modeMux = 1'b1;
defparam \i2c_device|lockb_cnt_q_8 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_8 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_cnt_q_8 .BypassEn = 1'b1;
defparam \i2c_device|lockb_cnt_q_8 .CarryEnb = 1'b0;

alta_slice \i2c_device|lockb_rec_A_0_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [2]),
	.D(\i2c_device|lockb_rec_A_0_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_rec_A_0_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .coord_x = 19;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .coord_y = 5;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .coord_z = 14;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .mask = 16'hFF0F;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_rec_A_0_Y_combout (
	.A(vcc),
	.B(\i2c_device|lockb_rec_d_0_q ),
	.C(vcc),
	.D(\i2c_device|lockb_rec [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_rec_A_0_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|lockb_rec_A_0_Y_combout .coord_x = 19;
defparam \i2c_device|lockb_rec_A_0_Y_combout .coord_y = 5;
defparam \i2c_device|lockb_rec_A_0_Y_combout .coord_z = 13;
defparam \i2c_device|lockb_rec_A_0_Y_combout .mask = 16'h33CC;
defparam \i2c_device|lockb_rec_A_0_Y_combout .modeMux = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|lockb_rec_A_0_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_rec_d_0 (
	.A(),
	.B(),
	.C(),
	.D(\i2c_device|lockb_rec [0]),
	.Cin(),
	.Qin(\i2c_device|lockb_rec_d_0_q ),
	.Clk(CLKOSC_i_o_X10005_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10005_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_rec_d_0__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|lockb_rec_d_0_q ));
defparam \i2c_device|lockb_rec_d_0 .coord_x = 19;
defparam \i2c_device|lockb_rec_d_0 .coord_y = 5;
defparam \i2c_device|lockb_rec_d_0 .coord_z = 15;
defparam \i2c_device|lockb_rec_d_0 .mask = 16'hFF00;
defparam \i2c_device|lockb_rec_d_0 .modeMux = 1'b0;
defparam \i2c_device|lockb_rec_d_0 .FeedbackMux = 1'b0;
defparam \i2c_device|lockb_rec_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_rec_d_0 .BypassEn = 1'b0;
defparam \i2c_device|lockb_rec_d_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|lockb_rec_q_0 (
	.A(\i2c_device|write_value_dataa_2_combout_datad_3_combout [1]),
	.B(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0]),
	.C(vcc),
	.D(\i2c_device|write_value [2]),
	.Cin(),
	.Qin(\i2c_device|lockb_rec [0]),
	.Clk(CLKOSC_i_o_X10010_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10010_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|lockb_rec_A_0_1_Y ),
	.Cout(),
	.Q(\i2c_device|lockb_rec [0]));
defparam \i2c_device|lockb_rec_q_0 .coord_x = 19;
defparam \i2c_device|lockb_rec_q_0 .coord_y = 8;
defparam \i2c_device|lockb_rec_q_0 .coord_z = 10;
defparam \i2c_device|lockb_rec_q_0 .mask = 16'h78F0;
defparam \i2c_device|lockb_rec_q_0 .modeMux = 1'b0;
defparam \i2c_device|lockb_rec_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|lockb_rec_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|lockb_rec_q_0 .BypassEn = 1'b0;
defparam \i2c_device|lockb_rec_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_asdata_0 (
	.A(),
	.B(),
	.C(\i2c_device|scl [0]),
	.D(),
	.Cin(),
	.Qin(\i2c_device|scl_asdata_0_q ),
	.Clk(CLKOSC_i_o_X10011_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10011_Y10002_GND),
	.SyncReset(SyncReset_X10011_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|sda_A_0_1_Y_B_Y_B_Y__SyncLoad_X10011_Y10002_SIG ),
	.LutOut(\i2c_device|scl_asdata_0__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|scl_asdata_0_q ));
defparam \i2c_device|scl_asdata_0 .coord_x = 10;
defparam \i2c_device|scl_asdata_0 .coord_y = 3;
defparam \i2c_device|scl_asdata_0 .coord_z = 1;
defparam \i2c_device|scl_asdata_0 .mask = 16'hF0F0;
defparam \i2c_device|scl_asdata_0 .modeMux = 1'b0;
defparam \i2c_device|scl_asdata_0 .FeedbackMux = 1'b1;
defparam \i2c_device|scl_asdata_0 .ShiftMux = 1'b0;
defparam \i2c_device|scl_asdata_0 .BypassEn = 1'b1;
defparam \i2c_device|scl_asdata_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_asdata_0_q_dataa (
	.A(vcc),
	.B(\i2c_device|scl_asdata_0_q ),
	.C(\i2c_device|sda_A_0_1_Y_B_Y_B_Y ),
	.D(\i2c_device|scl [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|scl_asdata_0_q_dataa .coord_x = 10;
defparam \i2c_device|scl_asdata_0_q_dataa .coord_y = 3;
defparam \i2c_device|scl_asdata_0_q_dataa .coord_z = 9;
defparam \i2c_device|scl_asdata_0_q_dataa .mask = 16'h3000;
defparam \i2c_device|scl_asdata_0_q_dataa .modeMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|scl_asdata_0_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_asdata_0_q_datab (
	.A(vcc),
	.B(\i2c_device|scl_asdata_0_q ),
	.C(\i2c_device|sda_A_0_1_Y_B_Y_B_Y ),
	.D(\i2c_device|scl [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_datac_0_1_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|scl_asdata_0_q_datab .coord_x = 10;
defparam \i2c_device|scl_asdata_0_q_datab .coord_y = 3;
defparam \i2c_device|scl_asdata_0_q_datab .coord_z = 6;
defparam \i2c_device|scl_asdata_0_q_datab .mask = 16'hCF3F;
defparam \i2c_device|scl_asdata_0_q_datab .modeMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datab .FeedbackMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datab .ShiftMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datab .BypassEn = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_asdata_0_q_datad (
	.A(\i2c_device|scl_asdata_0_q ),
	.B(\i2c_device|sda_A_0_1_Y_B_Y_B_Y ),
	.C(\i2c_device|scl [0]),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_11_q_dataa_combout[3]),
	.Cout(),
	.Q());
defparam \i2c_device|scl_asdata_0_q_datad .coord_x = 11;
defparam \i2c_device|scl_asdata_0_q_datad .coord_y = 3;
defparam \i2c_device|scl_asdata_0_q_datad .coord_z = 2;
defparam \i2c_device|scl_asdata_0_q_datad .mask = 16'h0008;
defparam \i2c_device|scl_asdata_0_q_datad .modeMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad .FeedbackMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad .ShiftMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad .BypassEn = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_asdata_0_q_datad_1 (
	.A(CLKOSC_clk_1_q_dataa_3_combout[2]),
	.B(\i2c_device|scl_asdata_0_q ),
	.C(\i2c_device|sda_A_0_1_Y_B_Y_B_Y ),
	.D(\i2c_device|scl [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|scl_asdata_0_q_datad_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|scl_asdata_0_q_datad_1 .coord_x = 10;
defparam \i2c_device|scl_asdata_0_q_datad_1 .coord_y = 3;
defparam \i2c_device|scl_asdata_0_q_datad_1 .coord_z = 4;
defparam \i2c_device|scl_asdata_0_q_datad_1 .mask = 16'h0080;
defparam \i2c_device|scl_asdata_0_q_datad_1 .modeMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad_1 .FeedbackMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad_1 .ShiftMux = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad_1 .BypassEn = 1'b0;
defparam \i2c_device|scl_asdata_0_q_datad_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_d_0 (
	.A(\i2c_device|scl [0]),
	.B(\i2c_device|sda_d_0_q ),
	.C(\i2c_device|scl [0]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|scl_d_0_q ),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|scl_d_0_q_datab_combout [1]),
	.Cout(),
	.Q(\i2c_device|scl_d_0_q ));
defparam \i2c_device|scl_d_0 .coord_x = 10;
defparam \i2c_device|scl_d_0 .coord_y = 4;
defparam \i2c_device|scl_d_0 .coord_z = 5;
defparam \i2c_device|scl_d_0 .mask = 16'h8400;
defparam \i2c_device|scl_d_0 .modeMux = 1'b0;
defparam \i2c_device|scl_d_0 .FeedbackMux = 1'b1;
defparam \i2c_device|scl_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|scl_d_0 .BypassEn = 1'b1;
defparam \i2c_device|scl_d_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|scl_q_0 (
	.A(\i2c_device|sda [0]),
	.B(\i2c_device|scl_d_0_q ),
	.C(SCL_i_o),
	.D(\i2c_device|sda_d_0_q ),
	.Cin(),
	.Qin(\i2c_device|scl [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|sda_d_0_q_datab_combout [0]),
	.Cout(),
	.Q(\i2c_device|scl [0]));
defparam \i2c_device|scl_q_0 .coord_x = 10;
defparam \i2c_device|scl_q_0 .coord_y = 4;
defparam \i2c_device|scl_q_0 .coord_z = 0;
defparam \i2c_device|scl_q_0 .mask = 16'h0041;
defparam \i2c_device|scl_q_0 .modeMux = 1'b0;
defparam \i2c_device|scl_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|scl_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|scl_q_0 .BypassEn = 1'b1;
defparam \i2c_device|scl_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_A_0_Y_combout (
	.A(vcc),
	.B(\i2c_device|bit_pos_dataa_0_cout_cout_4_combout ),
	.C(vcc),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_A_0_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|sda_A_0_Y_combout .coord_x = 10;
defparam \i2c_device|sda_A_0_Y_combout .coord_y = 2;
defparam \i2c_device|sda_A_0_Y_combout .coord_z = 2;
defparam \i2c_device|sda_A_0_Y_combout .mask = 16'h3300;
defparam \i2c_device|sda_A_0_Y_combout .modeMux = 1'b0;
defparam \i2c_device|sda_A_0_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|sda_A_0_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|sda_A_0_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|sda_A_0_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0 (
	.A(\i2c_device|stop_asdata_0_q ),
	.B(\i2c_device|stop [0]),
	.C(\i2c_device|sda [0]),
	.D(\i2c_device|start_B_0_Y ),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_q ),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_q ));
defparam \i2c_device|sda_d_0 .coord_x = 10;
defparam \i2c_device|sda_d_0 .coord_y = 4;
defparam \i2c_device|sda_d_0 .coord_z = 11;
defparam \i2c_device|sda_d_0 .mask = 16'h66FF;
defparam \i2c_device|sda_d_0 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_1 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_1_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_1_q ),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10012_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10012_Y10003_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10012_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_1_combout_A_Y__SyncLoad_X10012_Y10003_SIG ),
	.LutOut(\i2c_device|sda_d_0_1__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_1_q ));
defparam \i2c_device|sda_d_0_1 .coord_x = 14;
defparam \i2c_device|sda_d_0_1 .coord_y = 1;
defparam \i2c_device|sda_d_0_1 .coord_z = 4;
defparam \i2c_device|sda_d_0_1 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_1 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_1 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_1 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_1 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_10 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_10_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_10_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10019_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10019_Y10002_GND),
	.SyncReset(SyncReset_X10019_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_1_Y__SyncLoad_X10019_Y10002_SIG),
	.LutOut(\i2c_device|sda_d_0_10__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_10_q ));
defparam \i2c_device|sda_d_0_10 .coord_x = 15;
defparam \i2c_device|sda_d_0_10 .coord_y = 1;
defparam \i2c_device|sda_d_0_10 .coord_z = 5;
defparam \i2c_device|sda_d_0_10 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_10 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_10 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_10 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_10 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_10 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_11 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_11_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_11_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10015_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10015_Y10002_GND),
	.SyncReset(SyncReset_X10015_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_Y__SyncLoad_X10015_Y10002_SIG),
	.LutOut(\i2c_device|sda_d_0_11__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_11_q ));
defparam \i2c_device|sda_d_0_11 .coord_x = 12;
defparam \i2c_device|sda_d_0_11 .coord_y = 4;
defparam \i2c_device|sda_d_0_11 .coord_z = 12;
defparam \i2c_device|sda_d_0_11 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_11 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_11 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_11 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_11 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_11 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout (
	.A(vcc),
	.B(CSEL2_q_1[1]),
	.C(vcc),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_11_q_A_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .coord_x = 17;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .coord_y = 2;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .coord_z = 14;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .mask = 16'hCC00;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_11_q_A_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0]),
	.D(CSEL2_q_1[2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_11_q_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .coord_x = 15;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .coord_y = 4;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .coord_z = 5;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .mask = 16'hF000;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_11_q_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_11_q_dataa (
	.A(vcc),
	.B(\i2c_device|sda_d_0_9_q_dataa_3_combout [0]),
	.C(\i2c_device|sda_d_0_12_q ),
	.D(\i2c_device|sda_d_0_11_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CSEL2_q_1[2]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_11_q_dataa .coord_x = 15;
defparam \i2c_device|sda_d_0_11_q_dataa .coord_y = 4;
defparam \i2c_device|sda_d_0_11_q_dataa .coord_z = 9;
defparam \i2c_device|sda_d_0_11_q_dataa .mask = 16'h00C0;
defparam \i2c_device|sda_d_0_11_q_dataa .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_11_q_dataa_1 (
	.A(\i2c_device|sda_d_0_5_q_dataa_combout [2]),
	.B(vcc),
	.C(\i2c_device|sda_d_0_12_q ),
	.D(\i2c_device|sda_d_0_11_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CHRG_i_o[2]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_11_q_dataa_1 .coord_x = 15;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .coord_y = 4;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .coord_z = 2;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .mask = 16'h000A;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_11_q_dataa_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_11_q_datab (
	.A(\i2c_device|sda_d_0_9_q_dataa_3_combout [0]),
	.B(vcc),
	.C(\i2c_device|sda_d_0_12_q ),
	.D(\i2c_device|sda_d_0_11_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CSEL2_q_1[1]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_11_q_datab .coord_x = 15;
defparam \i2c_device|sda_d_0_11_q_datab .coord_y = 4;
defparam \i2c_device|sda_d_0_11_q_datab .coord_z = 10;
defparam \i2c_device|sda_d_0_11_q_datab .mask = 16'hA000;
defparam \i2c_device|sda_d_0_11_q_datab .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_datab .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_datab .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_11_q_datab .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_11_q_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_12 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_12_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_12_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10009_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10002_GND),
	.SyncReset(SyncReset_X10009_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_3_Y__SyncLoad_X10009_Y10002_SIG),
	.LutOut(\i2c_device|sda_d_0_12__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_12_q ));
defparam \i2c_device|sda_d_0_12 .coord_x = 11;
defparam \i2c_device|sda_d_0_12 .coord_y = 4;
defparam \i2c_device|sda_d_0_12 .coord_z = 4;
defparam \i2c_device|sda_d_0_12 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_12 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_12 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_12 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_12 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_12 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_12_q_dataa (
	.A(\i2c_device|sda_d_0_9_q_dataa_3_combout [0]),
	.B(vcc),
	.C(\i2c_device|sda_d_0_12_q ),
	.D(\i2c_device|sda_d_0_11_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_12_q_dataa .coord_x = 15;
defparam \i2c_device|sda_d_0_12_q_dataa .coord_y = 4;
defparam \i2c_device|sda_d_0_12_q_dataa .coord_z = 3;
defparam \i2c_device|sda_d_0_12_q_dataa .mask = 16'h0A00;
defparam \i2c_device|sda_d_0_12_q_dataa .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 (
	.A(vcc),
	.B(\i2c_device|brin_cnt_dataa_8_2_combout [0]),
	.C(\i2c_device|brin_cnt_dataa_8_2_combout [2]),
	.D(\i2c_device|brin_cnt_dataa_8_2_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_12_q_dataa_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .coord_x = 17;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .coord_y = 4;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .coord_z = 9;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .mask = 16'hC000;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_12_q_dataa_combout_combout_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_2 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_2_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_2_q ),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10005_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10005_Y10003_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y__SyncLoad_X10005_Y10003_SIG ),
	.LutOut(\i2c_device|sda_d_0_2__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_2_q ));
defparam \i2c_device|sda_d_0_2 .coord_x = 9;
defparam \i2c_device|sda_d_0_2 .coord_y = 1;
defparam \i2c_device|sda_d_0_2 .coord_z = 0;
defparam \i2c_device|sda_d_0_2 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_2 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_2 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_2 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_2 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_3 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_3_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_3_q ),
	.Clk(\CLKOSC_i_o__i2c_device|stop_B_0_Y_B_Y_A_Y_X10015_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10015_Y10003_GND),
	.SyncReset(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10015_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y__SyncLoad_X10015_Y10003_SIG ),
	.LutOut(\i2c_device|sda_d_0_3__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_3_q ));
defparam \i2c_device|sda_d_0_3 .coord_x = 10;
defparam \i2c_device|sda_d_0_3 .coord_y = 1;
defparam \i2c_device|sda_d_0_3 .coord_z = 0;
defparam \i2c_device|sda_d_0_3 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_3 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_3 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_3 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_3 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_4 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_4_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_4_q ),
	.Clk(CLKOSC_i_o_X10006_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10006_Y10003_GND),
	.SyncReset(SyncReset_X10006_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y__SyncLoad_X10006_Y10003_SIG ),
	.LutOut(\i2c_device|sda_d_0_4__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_4_q ));
defparam \i2c_device|sda_d_0_4 .coord_x = 11;
defparam \i2c_device|sda_d_0_4 .coord_y = 2;
defparam \i2c_device|sda_d_0_4 .coord_z = 0;
defparam \i2c_device|sda_d_0_4 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_4 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_4 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_4 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_4 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_4 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|sda_d_0_4_q_datad_combout [0]),
	.D(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .coord_x = 15;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .coord_y = 4;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .coord_z = 12;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .mask = 16'hF0FF;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_4_q_A_1_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_4_q_dataa (
	.A(\i2c_device|i2c_state [0]),
	.B(CLKOSC_clk_9_q),
	.C(\i2c_device|sda_d_0_4_q ),
	.D(CLKOSC_clk_10_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_4_q_dataa_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_4_q_dataa .coord_x = 11;
defparam \i2c_device|sda_d_0_4_q_dataa .coord_y = 3;
defparam \i2c_device|sda_d_0_4_q_dataa .coord_z = 14;
defparam \i2c_device|sda_d_0_4_q_dataa .mask = 16'hBABB;
defparam \i2c_device|sda_d_0_4_q_dataa .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_4_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_4_q_datac (
	.A(\i2c_device|sda_d_0_4_q ),
	.B(CLKOSC_clk_9_q_dataa_combout[3]),
	.C(\i2c_device|i2c_state_datab_0_1_combout [1]),
	.D(CLKOSC_clk_9_q_dataa_combout[2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_4_q_datac_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_4_q_datac .coord_x = 11;
defparam \i2c_device|sda_d_0_4_q_datac .coord_y = 4;
defparam \i2c_device|sda_d_0_4_q_datac .coord_z = 0;
defparam \i2c_device|sda_d_0_4_q_datac .mask = 16'hB0BB;
defparam \i2c_device|sda_d_0_4_q_datac .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datac .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datac .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datac .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datac .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_4_q_datad (
	.A(CLKOSC_clk_11_q_dataa_combout[3]),
	.B(\i2c_device|sda_d_0_4_q ),
	.C(\i2c_device|i2c_state_dataa_0_combout [0]),
	.D(CLKOSC_clk_9_q),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_4_q_datad_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_4_q_datad .coord_x = 11;
defparam \i2c_device|sda_d_0_4_q_datad .coord_y = 3;
defparam \i2c_device|sda_d_0_4_q_datad .coord_z = 4;
defparam \i2c_device|sda_d_0_4_q_datad .mask = 16'h0080;
defparam \i2c_device|sda_d_0_4_q_datad .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datad .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datad .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datad .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_4_q_datad .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_5 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_5_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_5_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10002_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10002_GND),
	.SyncReset(SyncReset_X10002_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_3_Y__SyncLoad_X10002_Y10002_SIG ),
	.LutOut(\i2c_device|sda_d_0_5__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_5_q ));
defparam \i2c_device|sda_d_0_5 .coord_x = 15;
defparam \i2c_device|sda_d_0_5 .coord_y = 4;
defparam \i2c_device|sda_d_0_5 .coord_z = 1;
defparam \i2c_device|sda_d_0_5 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_5 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_5 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_5 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_5 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_5 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_5_q_dataa (
	.A(\i2c_device|sda_d_0_5_q ),
	.B(\i2c_device|sda_d_0_8_q ),
	.C(\i2c_device|sda_d_0_6_q ),
	.D(\i2c_device|sda_d_0_7_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_5_q_dataa_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_5_q_dataa .coord_x = 15;
defparam \i2c_device|sda_d_0_5_q_dataa .coord_y = 4;
defparam \i2c_device|sda_d_0_5_q_dataa .coord_z = 0;
defparam \i2c_device|sda_d_0_5_q_dataa .mask = 16'h0001;
defparam \i2c_device|sda_d_0_5_q_dataa .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_5_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_5_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_5_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_5_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_6 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_6_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_6_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10020_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10020_Y10002_GND),
	.SyncReset(SyncReset_X10020_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_2_Y__SyncLoad_X10020_Y10002_SIG ),
	.LutOut(\i2c_device|sda_d_0_6__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_6_q ));
defparam \i2c_device|sda_d_0_6 .coord_x = 16;
defparam \i2c_device|sda_d_0_6 .coord_y = 1;
defparam \i2c_device|sda_d_0_6 .coord_z = 1;
defparam \i2c_device|sda_d_0_6 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_6 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_6 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_6 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_6 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_6 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_7 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_7_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_7_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10014_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10002_GND),
	.SyncReset(SyncReset_X10014_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_1_Y__SyncLoad_X10014_Y10002_SIG ),
	.LutOut(\i2c_device|sda_d_0_7__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_7_q ));
defparam \i2c_device|sda_d_0_7 .coord_x = 12;
defparam \i2c_device|sda_d_0_7 .coord_y = 2;
defparam \i2c_device|sda_d_0_7 .coord_z = 5;
defparam \i2c_device|sda_d_0_7 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_7 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_7 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_7 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_7 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_7 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_8 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_8_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_8_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10001_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10001_Y10003_GND),
	.SyncReset(SyncReset_X10001_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_Y__SyncLoad_X10001_Y10003_SIG ),
	.LutOut(\i2c_device|sda_d_0_8__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_8_q ));
defparam \i2c_device|sda_d_0_8 .coord_x = 12;
defparam \i2c_device|sda_d_0_8 .coord_y = 1;
defparam \i2c_device|sda_d_0_8 .coord_z = 4;
defparam \i2c_device|sda_d_0_8 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_8 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_8 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_8 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_8 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_8 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9 (
	.A(),
	.B(),
	.C(\i2c_device|sda_d_0_9_q ),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|sda_d_0_9_q ),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_4_Y_B_Y_A_1_Y_A_Y_X10016_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10002_GND),
	.SyncReset(SyncReset_X10016_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_2_Y__SyncLoad_X10016_Y10002_SIG),
	.LutOut(\i2c_device|sda_d_0_9__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|sda_d_0_9_q ));
defparam \i2c_device|sda_d_0_9 .coord_x = 12;
defparam \i2c_device|sda_d_0_9 .coord_y = 3;
defparam \i2c_device|sda_d_0_9 .coord_z = 5;
defparam \i2c_device|sda_d_0_9 .mask = 16'hFF00;
defparam \i2c_device|sda_d_0_9 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9 .BypassEn = 1'b1;
defparam \i2c_device|sda_d_0_9 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout (
	.A(\i2c_device|sda_d_0_9_q_dataa_3_combout [0]),
	.B(vcc),
	.C(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .coord_x = 15;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .coord_y = 4;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .coord_z = 13;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .mask = 16'hFAFA;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout (
	.A(vcc),
	.B(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.C(vcc),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .coord_x = 15;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .coord_y = 2;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .coord_z = 15;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .mask = 16'hCC00;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_9_q_B_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9_q_dataa (
	.A(CHRG_i_o[2]),
	.B(CHRG_i_o[3]),
	.C(\i2c_device|sda_d_0_10_q ),
	.D(\i2c_device|sda_d_0_9_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_9_q_dataa_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_9_q_dataa .coord_x = 15;
defparam \i2c_device|sda_d_0_9_q_dataa .coord_y = 4;
defparam \i2c_device|sda_d_0_9_q_dataa .coord_z = 6;
defparam \i2c_device|sda_d_0_9_q_dataa .mask = 16'h0008;
defparam \i2c_device|sda_d_0_9_q_dataa .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9_q_dataa_1 (
	.A(CHRG_i_o[2]),
	.B(STDBY_i_o[3]),
	.C(\i2c_device|sda_d_0_10_q ),
	.D(\i2c_device|sda_d_0_9_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_9_q_dataa_1_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_9_q_dataa_1 .coord_x = 15;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .coord_y = 4;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .coord_z = 7;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .mask = 16'h0008;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9_q_dataa_2 (
	.A(CHRG_i_o[2]),
	.B(vcc),
	.C(\i2c_device|sda_d_0_10_q ),
	.D(\i2c_device|sda_d_0_9_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_9_q_dataa_2 .coord_x = 15;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .coord_y = 4;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .coord_z = 14;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .mask = 16'h00A0;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_d_0_9_q_dataa_3 (
	.A(\i2c_device|sda_d_0_5_q_dataa_combout [2]),
	.B(vcc),
	.C(\i2c_device|sda_d_0_10_q ),
	.D(\i2c_device|sda_d_0_9_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|sda_d_0_9_q_dataa_3_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|sda_d_0_9_q_dataa_3 .coord_x = 15;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .coord_y = 4;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .coord_z = 8;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .mask = 16'h000A;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .modeMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .FeedbackMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .ShiftMux = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .BypassEn = 1'b0;
defparam \i2c_device|sda_d_0_9_q_dataa_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|sda_q_0 (
	.A(\i2c_device|scl [0]),
	.B(\i2c_device|scl_d_0_q ),
	.C(SDA_i_o),
	.D(\i2c_device|sda_d_0_q ),
	.Cin(),
	.Qin(\i2c_device|sda [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|sda_A_0_1_Y_B_Y_B_Y ),
	.Cout(),
	.Q(\i2c_device|sda [0]));
defparam \i2c_device|sda_q_0 .coord_x = 10;
defparam \i2c_device|sda_q_0 .coord_y = 4;
defparam \i2c_device|sda_q_0 .coord_z = 4;
defparam \i2c_device|sda_q_0 .mask = 16'h9009;
defparam \i2c_device|sda_q_0 .modeMux = 1'b0;
defparam \i2c_device|sda_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|sda_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|sda_q_0 .BypassEn = 1'b1;
defparam \i2c_device|sda_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|start_d_0 (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|start [0]),
	.D(\i2c_device|start [0]),
	.Cin(),
	.Qin(\i2c_device|start_d_0_q ),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(SyncReset_X10018_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10001_VCC),
	.LutOut(\i2c_device|start_B_0_Y ),
	.Cout(),
	.Q(\i2c_device|start_d_0_q ));
defparam \i2c_device|start_d_0 .coord_x = 10;
defparam \i2c_device|start_d_0 .coord_y = 4;
defparam \i2c_device|start_d_0 .coord_z = 9;
defparam \i2c_device|start_d_0 .mask = 16'hF00F;
defparam \i2c_device|start_d_0 .modeMux = 1'b0;
defparam \i2c_device|start_d_0 .FeedbackMux = 1'b1;
defparam \i2c_device|start_d_0 .ShiftMux = 1'b0;
defparam \i2c_device|start_d_0 .BypassEn = 1'b1;
defparam \i2c_device|start_d_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|start_q_0 (
	.A(\i2c_device|sda_d_0_q_datab_combout [0]),
	.B(\i2c_device|scl [0]),
	.C(vcc),
	.D(CLKOSC_clk_20_q),
	.Cin(),
	.Qin(\i2c_device|start [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|start_A_0_Y ),
	.Cout(),
	.Q(\i2c_device|start [0]));
defparam \i2c_device|start_q_0 .coord_x = 10;
defparam \i2c_device|start_q_0 .coord_y = 4;
defparam \i2c_device|start_q_0 .coord_z = 8;
defparam \i2c_device|start_q_0 .mask = 16'h78F0;
defparam \i2c_device|start_q_0 .modeMux = 1'b0;
defparam \i2c_device|start_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|start_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|start_q_0 .BypassEn = 1'b0;
defparam \i2c_device|start_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa (
	.A(vcc),
	.B(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.C(vcc),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|i2c_state_datab_0_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .coord_x = 11;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .coord_y = 4;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .coord_z = 7;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .mask = 16'h00CC;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .modeMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .ShiftMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .BypassEn = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|scl_asdata_0_q_datad_1_combout [1]),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .coord_x = 10;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .coord_y = 3;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .coord_z = 5;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .mask = 16'h00F0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .modeMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .FeedbackMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .ShiftMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .BypassEn = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_dataa_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab (
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.B(\i2c_device|sda_d_0_12_q_dataa_combout [0]),
	.C(\i2c_device|write_value_dataa_1_combout [0]),
	.D(\i2c_device|OFFSET_SECONDARY_dataa_1_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .coord_x = 10;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .coord_y = 4;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .coord_z = 14;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .mask = 16'h0400;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .modeMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .FeedbackMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .ShiftMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .BypassEn = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|scl_asdata_0_q_datad_1_combout [1]),
	.D(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .coord_x = 15;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .coord_y = 4;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .coord_z = 11;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .mask = 16'hF000;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .modeMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .FeedbackMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .ShiftMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .BypassEn = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_4_Y_datab_combout_combout_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_B_0_Y_B_Y_A_Y_combout (
	.A(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.B(\i2c_device|scl_asdata_0_q_dataa_combout [1]),
	.C(CLKOSC_clk_8_q_datac_combout[3]),
	.D(CLKOSC_clk_2_q_A_3_Y),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .coord_x = 11;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .coord_y = 4;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .coord_z = 5;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .mask = 16'hEAAA;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_B_0_Y_B_Y_A_Y_datab (
	.A(vcc),
	.B(\i2c_device|i2c_state_datac_0_1_combout [2]),
	.C(\i2c_device|i2c_state_datac_0_1_combout [0]),
	.D(\i2c_device|stop_B_0_Y_B_Y_A_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(CLKOSC_clk_2_q_A_3_Y_dataa_combout[2]),
	.Cout(),
	.Q());
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .coord_x = 10;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .coord_y = 3;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .coord_z = 11;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .mask = 16'h0003;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .modeMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .FeedbackMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .ShiftMux = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .BypassEn = 1'b0;
defparam \i2c_device|stop_B_0_Y_B_Y_A_Y_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_asdata_0 (
	.A(),
	.B(),
	.C(\i2c_device|stop [0]),
	.D(),
	.Cin(),
	.Qin(\i2c_device|stop_asdata_0_q ),
	.Clk(CLKOSC_i_o_X10010_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10010_Y10003_GND),
	.SyncReset(SyncReset_X10010_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|start_B_0_Y__SyncLoad_X10010_Y10003_SIG ),
	.LutOut(\i2c_device|stop_asdata_0__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|stop_asdata_0_q ));
defparam \i2c_device|stop_asdata_0 .coord_x = 9;
defparam \i2c_device|stop_asdata_0 .coord_y = 4;
defparam \i2c_device|stop_asdata_0 .coord_z = 13;
defparam \i2c_device|stop_asdata_0 .mask = 16'hF0F0;
defparam \i2c_device|stop_asdata_0 .modeMux = 1'b0;
defparam \i2c_device|stop_asdata_0 .FeedbackMux = 1'b1;
defparam \i2c_device|stop_asdata_0 .ShiftMux = 1'b0;
defparam \i2c_device|stop_asdata_0 .BypassEn = 1'b1;
defparam \i2c_device|stop_asdata_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|stop_q_0 (
	.A(\i2c_device|scl [0]),
	.B(\i2c_device|scl_d_0_q_datab_combout [1]),
	.C(vcc),
	.D(CLKOSC_clk_20_q),
	.Cin(),
	.Qin(\i2c_device|stop [0]),
	.Clk(CLKOSC_i_o_X10018_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10018_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|stop_A_0_Y ),
	.Cout(),
	.Q(\i2c_device|stop [0]));
defparam \i2c_device|stop_q_0 .coord_x = 10;
defparam \i2c_device|stop_q_0 .coord_y = 4;
defparam \i2c_device|stop_q_0 .coord_z = 1;
defparam \i2c_device|stop_q_0 .mask = 16'hF078;
defparam \i2c_device|stop_q_0 .modeMux = 1'b0;
defparam \i2c_device|stop_q_0 .FeedbackMux = 1'b1;
defparam \i2c_device|stop_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|stop_q_0 .BypassEn = 1'b0;
defparam \i2c_device|stop_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_d_3 (
	.A(),
	.B(),
	.C(),
	.D(\i2c_device|write_value [3]),
	.Cin(),
	.Qin(\i2c_device|write_value_d_3_q ),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10015_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10015_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_d_3__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value_d_3_q ));
defparam \i2c_device|write_value_d_3 .coord_x = 16;
defparam \i2c_device|write_value_d_3 .coord_y = 4;
defparam \i2c_device|write_value_d_3 .coord_z = 7;
defparam \i2c_device|write_value_d_3 .mask = 16'hFF00;
defparam \i2c_device|write_value_d_3 .modeMux = 1'b0;
defparam \i2c_device|write_value_d_3 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_d_3 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_d_3 .BypassEn = 1'b0;
defparam \i2c_device|write_value_d_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_d_3_q_datab (
	.A(\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [2]),
	.B(CSEL2_q_1[2]),
	.C(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.D(\i2c_device|write_value_d_3_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_d_3_q_datab_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|write_value_d_3_q_datab .coord_x = 16;
defparam \i2c_device|write_value_d_3_q_datab .coord_y = 4;
defparam \i2c_device|write_value_d_3_q_datab .coord_z = 10;
defparam \i2c_device|write_value_d_3_q_datab .mask = 16'h23AF;
defparam \i2c_device|write_value_d_3_q_datab .modeMux = 1'b0;
defparam \i2c_device|write_value_d_3_q_datab .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_d_3_q_datab .ShiftMux = 1'b0;
defparam \i2c_device|write_value_d_3_q_datab .BypassEn = 1'b0;
defparam \i2c_device|write_value_d_3_q_datab .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_d_4 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [4]),
	.D(),
	.Cin(),
	.Qin(\i2c_device|write_value_d_4_q ),
	.Clk(\CLKOSC_i_o__i2c_device|sda_d_0_11_q_B_Y_A_Y_X10016_Y10001_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10001_GND),
	.SyncReset(SyncReset_X10016_Y10001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10016_Y10001_VCC),
	.LutOut(),
	.Cout(),
	.Q(\i2c_device|write_value_d_4_q ));
defparam \i2c_device|write_value_d_4 .coord_x = 17;
defparam \i2c_device|write_value_d_4 .coord_y = 2;
defparam \i2c_device|write_value_d_4 .coord_z = 13;
defparam \i2c_device|write_value_d_4 .mask = 16'hFFFF;
defparam \i2c_device|write_value_d_4 .modeMux = 1'b1;
defparam \i2c_device|write_value_d_4 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_d_4 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_d_4 .BypassEn = 1'b1;
defparam \i2c_device|write_value_d_4 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_d_4_q_dataa (
	.A(\i2c_device|write_value_d_4_q ),
	.B(CSEL2_q_1[2]),
	.C(\i2c_device|OFFSET_SECONDARY [4]),
	.D(\i2c_device|sda_d_0_9_q_dataa_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_d_4_q_dataa_combout [2]),
	.Cout(),
	.Q());
defparam \i2c_device|write_value_d_4_q_dataa .coord_x = 15;
defparam \i2c_device|write_value_d_4_q_dataa .coord_y = 2;
defparam \i2c_device|write_value_d_4_q_dataa .coord_z = 14;
defparam \i2c_device|write_value_d_4_q_dataa .mask = 16'h0777;
defparam \i2c_device|write_value_d_4_q_dataa .modeMux = 1'b0;
defparam \i2c_device|write_value_d_4_q_dataa .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_d_4_q_dataa .ShiftMux = 1'b0;
defparam \i2c_device|write_value_d_4_q_dataa .BypassEn = 1'b0;
defparam \i2c_device|write_value_d_4_q_dataa .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_dataa_1 (
	.A(vcc),
	.B(\i2c_device|write_value [0]),
	.C(vcc),
	.D(\i2c_device|write_value [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_dataa_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2c_device|write_value_dataa_1 .coord_x = 11;
defparam \i2c_device|write_value_dataa_1 .coord_y = 4;
defparam \i2c_device|write_value_dataa_1 .coord_z = 14;
defparam \i2c_device|write_value_dataa_1 .mask = 16'hCC33;
defparam \i2c_device|write_value_dataa_1 .modeMux = 1'b0;
defparam \i2c_device|write_value_dataa_1 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_dataa_1 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_dataa_1 .BypassEn = 1'b0;
defparam \i2c_device|write_value_dataa_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_dataa_2 (
	.A(vcc),
	.B(vcc),
	.C(\i2c_device|write_value [3]),
	.D(\i2c_device|write_value [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_dataa_2_combout [3]),
	.Cout(),
	.Q());
defparam \i2c_device|write_value_dataa_2 .coord_x = 19;
defparam \i2c_device|write_value_dataa_2 .coord_y = 8;
defparam \i2c_device|write_value_dataa_2 .coord_z = 12;
defparam \i2c_device|write_value_dataa_2 .mask = 16'h0FF0;
defparam \i2c_device|write_value_dataa_2 .modeMux = 1'b0;
defparam \i2c_device|write_value_dataa_2 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_dataa_2 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_dataa_2 .BypassEn = 1'b0;
defparam \i2c_device|write_value_dataa_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_dataa_2_combout_datad_3 (
	.A(\i2c_device|write_value_dataa_2_combout [3]),
	.B(\i2c_device|lockb_cnt_dataa_11_2_combout_dataa_0_combout [2]),
	.C(\i2c_device|sda_d_0_12_q_dataa_combout [1]),
	.D(\i2c_device|locka_cnt_dataa_8_3_combout_dataa_0_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2c_device|write_value_dataa_2_combout_datad_3_combout [1]),
	.Cout(),
	.Q());
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .coord_x = 19;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .coord_y = 8;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .coord_z = 11;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .mask = 16'h8000;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .modeMux = 1'b0;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .BypassEn = 1'b0;
defparam \i2c_device|write_value_dataa_2_combout_datad_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_0 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [0]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [0]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10009_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10002_GND),
	.SyncReset(SyncReset_X10009_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_3_Y__SyncLoad_X10009_Y10002_SIG),
	.LutOut(\i2c_device|write_value_q_0__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [0]));
defparam \i2c_device|write_value_q_0 .coord_x = 11;
defparam \i2c_device|write_value_q_0 .coord_y = 4;
defparam \i2c_device|write_value_q_0 .coord_z = 11;
defparam \i2c_device|write_value_q_0 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_0 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_0 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_0 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_0 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_0 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_1 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [1]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [1]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10015_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10015_Y10002_GND),
	.SyncReset(SyncReset_X10015_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_Y__SyncLoad_X10015_Y10002_SIG),
	.LutOut(\i2c_device|write_value_q_1__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [1]));
defparam \i2c_device|write_value_q_1 .coord_x = 12;
defparam \i2c_device|write_value_q_1 .coord_y = 4;
defparam \i2c_device|write_value_q_1 .coord_z = 13;
defparam \i2c_device|write_value_q_1 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_1 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_1 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_1 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_1 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_1 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_2 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [2]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [2]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10016_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10003_GND),
	.SyncReset(SyncReset_X10016_Y10003_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_1_Y__SyncLoad_X10016_Y10003_SIG),
	.LutOut(\i2c_device|write_value_q_2__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [2]));
defparam \i2c_device|write_value_q_2 .coord_x = 18;
defparam \i2c_device|write_value_q_2 .coord_y = 1;
defparam \i2c_device|write_value_q_2 .coord_z = 5;
defparam \i2c_device|write_value_q_2 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_2 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_2 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_2 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_2 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_2 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_3 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [3]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [3]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10016_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10016_Y10002_GND),
	.SyncReset(SyncReset_X10016_Y10002_GND),
	.ShiftData(),
	.SyncLoad(CLKOSC_clk_2_q_A_2_Y__SyncLoad_X10016_Y10002_SIG),
	.LutOut(\i2c_device|write_value_q_3__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [3]));
defparam \i2c_device|write_value_q_3 .coord_x = 12;
defparam \i2c_device|write_value_q_3 .coord_y = 3;
defparam \i2c_device|write_value_q_3 .coord_z = 4;
defparam \i2c_device|write_value_q_3 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_3 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_3 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_3 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_3 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_3 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_4 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [4]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [4]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10001_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10001_Y10003_GND),
	.SyncReset(SyncReset_X10001_Y10003_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_Y__SyncLoad_X10001_Y10003_SIG ),
	.LutOut(\i2c_device|write_value_q_4__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [4]));
defparam \i2c_device|write_value_q_4 .coord_x = 12;
defparam \i2c_device|write_value_q_4 .coord_y = 1;
defparam \i2c_device|write_value_q_4 .coord_z = 5;
defparam \i2c_device|write_value_q_4 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_4 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_4 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_4 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_4 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_4 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_5 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [5]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [5]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10014_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10014_Y10002_GND),
	.SyncReset(SyncReset_X10014_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_1_Y__SyncLoad_X10014_Y10002_SIG ),
	.LutOut(\i2c_device|write_value_q_5__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [5]));
defparam \i2c_device|write_value_q_5 .coord_x = 12;
defparam \i2c_device|write_value_q_5 .coord_y = 2;
defparam \i2c_device|write_value_q_5 .coord_z = 12;
defparam \i2c_device|write_value_q_5 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_5 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_5 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_5 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_5 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_5 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_6 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [6]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [6]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10020_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10020_Y10002_GND),
	.SyncReset(SyncReset_X10020_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_2_Y__SyncLoad_X10020_Y10002_SIG ),
	.LutOut(\i2c_device|write_value_q_6__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [6]));
defparam \i2c_device|write_value_q_6 .coord_x = 16;
defparam \i2c_device|write_value_q_6 .coord_y = 1;
defparam \i2c_device|write_value_q_6 .coord_z = 0;
defparam \i2c_device|write_value_q_6 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_6 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_6 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_6 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_6 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_6 .CarryEnb = 1'b1;

alta_slice \i2c_device|write_value_q_7 (
	.A(),
	.B(),
	.C(\i2c_device|write_value [7]),
	.D(\i2c_device|sda [0]),
	.Cin(),
	.Qin(\i2c_device|write_value [7]),
	.Clk(\CLKOSC_i_o__i2c_device|i2c_state_A_0_1_Y_B_Y_A_Y_X10002_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10002_GND),
	.SyncReset(SyncReset_X10002_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2c_device|bit_pos_A_2_3_Y__SyncLoad_X10002_Y10002_SIG ),
	.LutOut(\i2c_device|write_value_q_7__feeder__LutOut ),
	.Cout(),
	.Q(\i2c_device|write_value [7]));
defparam \i2c_device|write_value_q_7 .coord_x = 15;
defparam \i2c_device|write_value_q_7 .coord_y = 4;
defparam \i2c_device|write_value_q_7 .coord_z = 4;
defparam \i2c_device|write_value_q_7 .mask = 16'hFF00;
defparam \i2c_device|write_value_q_7 .modeMux = 1'b0;
defparam \i2c_device|write_value_q_7 .FeedbackMux = 1'b0;
defparam \i2c_device|write_value_q_7 .ShiftMux = 1'b0;
defparam \i2c_device|write_value_q_7 .BypassEn = 1'b1;
defparam \i2c_device|write_value_q_7 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|BCLKD_q (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(BCLK1_clk_q_dataa_combout[0]),
	.Cin(),
	.Qin(\i2s_osd_select_1|BCLKD_int ),
	.Clk(BCLK1_i_o_X10019_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10003_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|WS_INV_A_Y ),
	.Cout(),
	.Q(\i2s_osd_select_1|BCLKD_int ));
defparam \i2s_osd_select_1|BCLKD_q .coord_x = 20;
defparam \i2s_osd_select_1|BCLKD_q .coord_y = 7;
defparam \i2s_osd_select_1|BCLKD_q .coord_z = 0;
defparam \i2s_osd_select_1|BCLKD_q .mask = 16'h000F;
defparam \i2s_osd_select_1|BCLKD_q .modeMux = 1'b0;
defparam \i2s_osd_select_1|BCLKD_q .FeedbackMux = 1'b1;
defparam \i2s_osd_select_1|BCLKD_q .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|BCLKD_q .BypassEn = 1'b0;
defparam \i2s_osd_select_1|BCLKD_q .CarryEnb = 1'b1;

alta_io_gclk \i2s_osd_select_1|BCLKD_q|q~ALTA_GCLK (
	.inclk(\i2s_osd_select_1|BCLKD_int ),
	.outclk(\i2s_osd_select_1|BCLKD ));
defparam \i2s_osd_select_1|BCLKD_q|q~ALTA_GCLK .coord_x = 22;
defparam \i2s_osd_select_1|BCLKD_q|q~ALTA_GCLK .coord_y = 4;
defparam \i2s_osd_select_1|BCLKD_q|q~ALTA_GCLK .coord_z = 3;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I ),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [3]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac_combout ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .coord_z = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .mask = 16'hCCCE;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_datac .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y ),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I ),
	.Clk(GCLK_X10014_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10014_Y10001_GND),
	.SyncReset(SyncReset_X10014_Y10001_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10014_Y10001_SIG ),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .mask = 16'hF0F0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .FeedbackMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q1I_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I ),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [3]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac_combout ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .mask = 16'hCCCE;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_datac .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y ),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I ),
	.Clk(GCLK_X10014_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10014_Y10001_GND),
	.SyncReset(SyncReset_X10014_Y10001_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10014_Y10001_SIG ),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .coord_z = 10;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .mask = 16'hF0F0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .FeedbackMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|Q2I_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [0]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [0]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [1]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .mask = 16'h6688;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[0]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [1]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [1]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [1]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [2]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[1]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [2]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [2]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [2]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [3]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [2]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[2]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [3]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [3]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [3]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [4]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [3]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[3]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [4]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [4]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [4]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [5]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [4]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .coord_z = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[4]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [5]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [5]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [5]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [6]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [5]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .coord_z = 5;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[5]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [6]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [6]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [6]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [7]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [6]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[6]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [7]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [7]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [7]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [8]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [7]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .coord_z = 7;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[7]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [8]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [8]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_combout [8]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in_datab_0_cout [9]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [8]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .coord_z = 8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in[8]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [0]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [0]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [1]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .mask = 16'h6688;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[0]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [1]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [1]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [1]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [2]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[1]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [2]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [2]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [2]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [3]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [2]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[2]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [3]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [3]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [3]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [4]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [3]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[3]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [4]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [4]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [4]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [5]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [4]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .coord_z = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[4]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [5]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [5]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [5]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [6]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [5]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .coord_z = 5;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[5]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [6]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [6]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [6]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [7]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [6]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[6]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [7]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [7]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [7]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [8]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [7]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .coord_z = 7;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[7]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [8]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [8]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10004_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_combout [8]),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out_datab_0_cout [9]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [8]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .coord_z = 8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out[8]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y ),
	.D(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .mask = 16'hF0C0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .coord_z = 9;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .mask = 16'h00F0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [2]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [1]),
	.C(CO1_i_o[0]),
	.D(\i2c_device|write_value_d_3_q ),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [0]),
	.Clk(GCLK_X10012_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10012_Y10002_GND),
	.SyncReset(SyncReset_X10012_Y10002_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10002_VCC),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .coord_y = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .mask = 16'h0240;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .FeedbackMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_0 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [2]),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [0]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [0]),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [1]),
	.Clk(GCLK_X10012_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10012_Y10002_GND),
	.SyncReset(SyncReset_X10012_Y10002_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10002_VCC),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1]),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .coord_y = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .mask = 16'h5000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .FeedbackMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [0]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [1]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [2]),
	.Clk(GCLK_X10015_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10015_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_1_Y_B_Y ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo [2]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .coord_y = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .mask = 16'hE8E8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .FeedbackMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_q_2 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [1]),
	.B(CO1_i_o[1]),
	.C(CO1_i_o[0]),
	.D(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .mask = 16'h8000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [2]),
	.B(CO1_i_o[1]),
	.C(CO1_i_o[0]),
	.D(\i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .mask = 16'h8000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .CarryEnb = 1'b1;

alta_bram9k \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst (
	.DataInA({vcc, \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], vcc, \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0]}),
	.DataInB({vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc}),
	.AddressA({\gnd~I_int , \gnd~I_int , \gnd~I_int , \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [8], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [7], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [6], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [5], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [4], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [3], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [2], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [0], vcc}),
	.AddressB({\gnd~I_int , \gnd~I_int , \gnd~I_int , \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [8], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [7], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [6], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [5], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [4], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [3], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [2], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [0], vcc}),
	.ByteEnA({vcc, vcc}),
	.ByteEnB({vcc, vcc}),
	.DataOutA({\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [17], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [16], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [15], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [14], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [13], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [12], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [11], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [10], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [9], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [8], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [7], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [6], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [5], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [4], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [3], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [2], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [0]}),
	.DataOutB({\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [17], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [16], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [15], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [14], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [13], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [12], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [11], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [10], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [9], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [8], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [7], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [6], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [5], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [4], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [3], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [2], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [1], \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [0]}),
	.Clk0(!\i2s_osd_select_1|BCLKD ),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(GCLK),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeA(vcc),
	.ReA(gnd),
	.WeB(gnd),
	.ReB(vcc),
	.AddressStallA(gnd),
	.AddressStallB(gnd));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .coord_x = 13;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .CLKMODE = 2'b10;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PACKEDMODE = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_CLKIN_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_CLKOUT_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_CLKIN_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_CLKOUT_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_RSTIN_EN = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_RSTOUT_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_RSTIN_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_RSTOUT_EN = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_WIDTH = 5'b01110;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_WIDTH = 5'b01110;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_OUTREG = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_OUTREG = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .RSEN_DLY = 2'b00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .DLYTIME = 2'b00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .INIT_VAL = 9216'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.Clk(\i2s_osd_select_1|BCLKD_X10008_Y10002_INV_VCC ),
	.AsyncReset(AsyncReset_X10008_Y10002_GND),
	.SyncReset(SyncReset_X10008_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10008_Y10002_INV ),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_inv ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .mask = 16'h00FF;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [0]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout [3]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .coord_z = 9;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .mask = 16'h0090;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datac .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .coord_z = 12;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .mask = 16'hFFF0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [5]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [7]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [3]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .mask = 16'h0001;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [0]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [1]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .mask = 16'h6688;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_0 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [1]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [1]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_1_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [2]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_1 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [2]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [2]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_2_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [3]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [2]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_2 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [3]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [3]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_3_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [4]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [3]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .coord_z = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_3 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [4]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [4]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_4_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [5]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [4]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .coord_z = 5;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_4 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [5]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [5]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_5_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [6]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [5]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_5 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [6]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [6]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_6_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [7]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [6]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .coord_z = 7;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_6 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [7]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [7]),
	.Clk(GCLK_X10019_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10019_Y10001_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10019_Y10001_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_7_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [8]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [7]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .coord_z = 8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_q_7 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [1]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count [2]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .coord_x = 16;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .coord_z = 10;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .mask = 16'h4824;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout [1]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .coord_z = 8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .mask = 16'hF000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [7]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [6]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .mask = 16'h1705;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [6]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_out [7]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .mask = 16'h1703;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [0]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [1]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .mask = 16'h6688;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_0 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [1]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [1]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_1_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [2]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_1 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [2]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [2]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_2_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [3]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [2]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_2 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [3]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [3]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_3_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [4]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [3]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_3 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [4]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [4]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_4_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [5]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [4]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .coord_z = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_4 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [5]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [5]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_5_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [6]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [5]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .coord_z = 5;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_5 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [6]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [6]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_6_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [7]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [6]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_6 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [7]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [7]),
	.Clk(\GCLK__i2c_device|OFFSET_PRIMARY_datab_0_cout_cin_8_combout_B_Y_B_Y_X10007_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10007_Y10003_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10007_Y10003_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_7_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_datab_0_cout [8]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset [7]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .coord_y = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .coord_z = 7;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|current_offset_q_7 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg (
	.A(),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ),
	.C(),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .coord_z = 10;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .mask = 16'hCCCC;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[0]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg (
	.A(),
	.B(),
	.C(),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1]),
	.Clk(\i2s_osd_select_1|BCLKD__i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10017_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10017_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10017_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|buffer|DataInA [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .coord_x = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .coord_z = 9;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .mask = 16'hFF00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|data_in[1]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_inv ),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1]),
	.Clk(\i2s_osd_select_1|BCLKD_X10008_Y10002_INV_VCC ),
	.AsyncReset(AsyncReset_X10008_Y10002_GND),
	.SyncReset(SyncReset_X10008_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10008_Y10002_INV ),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .mask = 16'hFF00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|image_width[6]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_combout ),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0]),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [0]),
	.Clk(GCLK_X10016_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10016_Y10003_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_2_Y_A_1_Y ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [0]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .mask = 16'hAAAE;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de[0]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1]),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .mask = 16'hFAFA;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .coord_z = 7;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .mask = 16'hF0FF;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [1]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [0]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [3]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .mask = 16'h0001;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [10]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [7]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .coord_z = 14;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .mask = 16'h0003;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [10]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [7]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .coord_z = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .mask = 16'h00C0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [8]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [3]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .mask = 16'h0040;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_8 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [1]),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .mask = 16'h6688;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_2_combout [3]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [4]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [5]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .coord_z = 13;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .mask = 16'h0002;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [8]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [1]),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2]),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .mask = 16'h8000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datac_8 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [1]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [1]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_1_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [2]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [1]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_1 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [10]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [10]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_10_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [11]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [10]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .coord_z = 11;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_10 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [11]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [11]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_11_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [12]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [11]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .coord_z = 12;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_11 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [2]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [2]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_2_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [3]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [2]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .coord_z = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_2 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [3]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [3]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_3_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [4]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [3]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .coord_z = 4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_3 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [4]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [4]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_4_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [5]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [4]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .coord_z = 5;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_4 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [5]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [5]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_5_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [6]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [5]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .coord_z = 6;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_5 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [6]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [6]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_6_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [7]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [6]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .coord_z = 7;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_6 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [7]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [7]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_7_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [8]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [7]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .coord_z = 8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_7 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [8]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [8]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_8_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [9]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [8]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .coord_z = 9;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_8 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [9]),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [9]),
	.Clk(\GCLK__i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10004_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10004_Y10002_GND),
	.SyncReset(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10004_Y10002_GND),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_9_combout ),
	.Cout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_datab_0_cout [10]),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de [9]));
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .coord_x = 19;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .coord_z = 10;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .mask = 16'h69D4;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .modeMux = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .BypassEn = 1'b1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_q_9 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_datad_1_combout [0]),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y ),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|normal|address_in [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .coord_z = 9;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .mask = 16'hCECF;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d (
	.A(vcc),
	.B(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ),
	.C(vcc),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ),
	.Clk(\i2s_osd_select_1|BCLKD_X10008_Y10002_INV_VCC ),
	.AsyncReset(AsyncReset_X10008_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .coord_z = 8;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .mask = 16'h0033;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg (
	.A(),
	.B(),
	.C(),
	.D(I2S1_i_o[3]),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ),
	.Clk(\i2s_osd_select_1|BCLKD_X5017_Y5012_INV_VCC ),
	.AsyncReset(AsyncReset_X5017_Y5012_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .coord_y = 12;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .mask = 16'hFF00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW ),
	.B(CO1_i_o[1]),
	.C(CO1_i_o[0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .coord_y = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .coord_z = 1;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .mask = 16'h8000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_datad .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg (
	.A(),
	.B(),
	.C(),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE ),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW ),
	.Clk(\i2s_osd_select_1|BCLKD_X5017_Y5012_SIG_VCC ),
	.AsyncReset(AsyncReset_X5017_Y5012_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .coord_y = 12;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .coord_z = 2;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .mask = 16'hFF00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_RAW_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ),
	.D(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .coord_x = 15;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .coord_z = 5;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .mask = 16'hF000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa (
	.A(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ),
	.B(CO1_i_o[1]),
	.C(CO1_i_o[0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .coord_x = 18;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .coord_y = 3;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .coord_z = 11;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .mask = 16'h8000;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_dataa .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg (
	.A(),
	.B(),
	.C(),
	.D(I2S1_i_o[3]),
	.Cin(),
	.Qin(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ),
	.Clk(\i2s_osd_select_1|BCLKD_X5017_Y5012_SIG_VCC ),
	.AsyncReset(AsyncReset_X5017_Y5012_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW ));
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .coord_x = 17;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .coord_y = 12;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .coord_z = 0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .mask = 16'hFF00;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .modeMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|BCLKD_q (
	.A(BCLK2_clk_q_dataa_combout[0]),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_2|BCLKD_int ),
	.Clk(BCLK2_i_o_X10014_Y10003_SIG_VCC),
	.AsyncReset(AsyncReset_X10014_Y10003_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|WS_INV_A_Y ),
	.Cout(),
	.Q(\i2s_osd_select_2|BCLKD_int ));
defparam \i2s_osd_select_2|BCLKD_q .coord_x = 20;
defparam \i2s_osd_select_2|BCLKD_q .coord_y = 6;
defparam \i2s_osd_select_2|BCLKD_q .coord_z = 12;
defparam \i2s_osd_select_2|BCLKD_q .mask = 16'h0505;
defparam \i2s_osd_select_2|BCLKD_q .modeMux = 1'b0;
defparam \i2s_osd_select_2|BCLKD_q .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|BCLKD_q .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|BCLKD_q .BypassEn = 1'b0;
defparam \i2s_osd_select_2|BCLKD_q .CarryEnb = 1'b1;

alta_io_gclk \i2s_osd_select_2|BCLKD_q|q~ALTA_GCLK (
	.inclk(\i2s_osd_select_2|BCLKD_int ),
	.outclk(\i2s_osd_select_2|BCLKD ));
defparam \i2s_osd_select_2|BCLKD_q|q~ALTA_GCLK .coord_x = 22;
defparam \i2s_osd_select_2|BCLKD_q|q~ALTA_GCLK .coord_y = 4;
defparam \i2s_osd_select_2|BCLKD_q|q~ALTA_GCLK .coord_z = 4;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I ),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [3]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac_combout ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .coord_z = 11;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .mask = 16'hCCCE;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_datac .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y ),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I ),
	.Clk(GCLK_X10015_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10015_Y10001_GND),
	.SyncReset(SyncReset_X10015_Y10001_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10015_Y10001_SIG ),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .coord_z = 12;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .mask = 16'hF0F0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q1I_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I ),
	.B(\i2c_device|write_value_d_4_q ),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac_combout ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .mask = 16'hFF02;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_datac .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y ),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I ),
	.Clk(GCLK_X10015_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10015_Y10001_GND),
	.SyncReset(SyncReset_X10015_Y10001_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10015_Y10001_SIG ),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .coord_z = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .mask = 16'hF0F0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|Q2I_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [0]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [0]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [1]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .mask = 16'h6688;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[0]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [1]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [1]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [1]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [2]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .coord_z = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[1]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [2]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [2]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [2]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [3]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [2]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[2]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [3]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [3]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [3]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [4]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [3]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[3]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [4]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [4]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [4]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [5]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [4]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .coord_z = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[4]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [5]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [5]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [5]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [6]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [5]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[5]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [6]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [6]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [6]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [7]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [6]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .coord_z = 8;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[6]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [7]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [7]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [7]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [8]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [7]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .coord_z = 9;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[7]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [8]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [8]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_combout [8]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in_datab_0_cout [9]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [8]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .coord_z = 10;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in[8]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [0]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [0]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [1]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .mask = 16'h6688;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[0]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [1]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [1]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [1]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [2]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[1]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [2]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [2]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [2]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [3]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [2]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[2]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [3]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [3]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [3]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [4]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [3]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .coord_z = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[3]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [4]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [4]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [4]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [5]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [4]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[4]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [5]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [5]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [5]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [6]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [5]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[5]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [6]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [6]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [6]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [7]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [6]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .coord_z = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[6]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [7]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [7]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [7]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [8]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [7]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[7]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [8]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [8]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_X10009_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10009_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10009_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_combout [8]),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out_datab_0_cout [9]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [8]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .coord_z = 8;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out[8]_reg .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y ),
	.C(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .mask = 16'hCCC0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .coord_x = 17;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .mask = 16'h0F00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [2]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [1]),
	.C(CO2_i_o[0]),
	.D(\i2c_device|write_value_d_3_q ),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [0]),
	.Clk(GCLK_X10012_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10012_Y10002_GND),
	.SyncReset(SyncReset_X10012_Y10002_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10002_VCC),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .coord_x = 17;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .mask = 16'h0240;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_0 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [2]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [0]),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [1]),
	.Clk(GCLK_X10012_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10012_Y10002_GND),
	.SyncReset(SyncReset_X10012_Y10002_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10012_Y10002_VCC),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1]),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .coord_x = 17;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .mask = 16'h3000;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [0]),
	.B(vcc),
	.C(vcc),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [1]),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [2]),
	.Clk(GCLK_X10015_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10015_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_1_Y_B_Y ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo [2]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .coord_z = 8;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .mask = 16'hFAA0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_q_2 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [1]),
	.B(CO2_i_o[1]),
	.C(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.D(CO2_i_o[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .mask = 16'h8000;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_1_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [2]),
	.B(CO2_i_o[1]),
	.C(\i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_datac_combout [1]),
	.D(CO2_i_o[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .mask = 16'h8000;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB_A_2_Y_combout .CarryEnb = 1'b1;

alta_bram9k \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst (
	.DataInA({vcc, \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], vcc, \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0]}),
	.DataInB({vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vcc}),
	.AddressA({\gnd~I_int , \gnd~I_int , \gnd~I_int , \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [8], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [7], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [6], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [5], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [4], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [3], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [2], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [0], vcc}),
	.AddressB({\gnd~I_int , \gnd~I_int , \gnd~I_int , \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [8], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [7], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [6], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [5], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [4], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [3], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [2], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [0], vcc}),
	.ByteEnA({vcc, vcc}),
	.ByteEnB({vcc, vcc}),
	.DataOutA({\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [17], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [16], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [15], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [14], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [13], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [12], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [11], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [10], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [9], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [8], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [7], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [6], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [5], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [4], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [3], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [2], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutA [0]}),
	.DataOutB({\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [17], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [16], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [15], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [14], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [13], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [12], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [11], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [10], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [9], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [8], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [7], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [6], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [5], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [4], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [3], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [2], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [1], \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|portDataOutB [0]}),
	.Clk0(!\i2s_osd_select_2|BCLKD ),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(GCLK),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeA(vcc),
	.ReA(gnd),
	.WeB(gnd),
	.ReB(vcc),
	.AddressStallA(gnd),
	.AddressStallB(gnd));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .coord_x = 13;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .CLKMODE = 2'b10;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PACKEDMODE = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_CLKIN_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_CLKOUT_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_CLKIN_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_CLKOUT_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_RSTIN_EN = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_RSTOUT_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_RSTIN_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_RSTOUT_EN = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_WIDTH = 5'b01110;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_WIDTH = 5'b01110;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTA_OUTREG = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .PORTB_OUTREG = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .RSEN_DLY = 2'b00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .DLYTIME = 2'b00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|i2s_osd_buffer_0|ram_inst .INIT_VAL = 9216'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv ),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.Clk(\i2s_osd_select_2|BCLKD_X10006_Y10002_INV_VCC ),
	.AsyncReset(AsyncReset_X10006_Y10002_GND),
	.SyncReset(SyncReset_X10006_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10006_Y10002_SIG ),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .mask = 16'hF0F0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .coord_x = 17;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .mask = 16'hFFF0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [6]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [7]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .coord_z = 9;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .mask = 16'h1703;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [6]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_out [7]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .coord_z = 9;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .mask = 16'h1703;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1_combout [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .coord_x = 17;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .mask = 16'h0F00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datab .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [0]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q ),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .coord_z = 12;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .mask = 16'h0B0E;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_datad .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [5]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [6]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .coord_z = 9;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .mask = 16'h0300;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_5 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [3]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [4]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7_combout [2]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .coord_z = 8;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .mask = 16'h0003;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_dataa_7 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [0]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [1]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .mask = 16'h6688;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_0 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [1]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_1_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [2]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_1 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [2]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [2]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_2_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [3]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [2]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_2 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [3]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [3]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_3_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [4]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [3]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .coord_z = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_3 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [4]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [4]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_4_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [5]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [4]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_4 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [5]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [5]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_5_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [6]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [5]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_5 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [6]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [6]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_6_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [7]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [6]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .coord_z = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_6 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [7]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [7]),
	.Clk(GCLK_X10001_Y10002_SIG_VCC),
	.AsyncReset(AsyncReset_X10001_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10001_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_7_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_datab_0_cout [8]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [7]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count_q_7 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [2]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [2]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .coord_z = 11;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .mask = 16'h0F03;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [2]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [1]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_count [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .coord_z = 10;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .mask = 16'h7050;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [1]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [3]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .coord_x = 17;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .coord_z = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .mask = 16'h0004;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div_datab_1_combout_dataa_0 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [0]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [1]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .mask = 16'h6688;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_0 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [1]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [1]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_1_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [2]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_1 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [2]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [2]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_2_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [3]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [2]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_2 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [3]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [3]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_3_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [4]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [3]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .coord_z = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_3 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [4]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [4]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_4_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [5]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [4]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_4 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [5]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [5]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_5_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [6]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [5]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_5 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [6]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [6]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_6_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [7]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [6]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .coord_z = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_6 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [7]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [7]),
	.Clk(\GCLK__i2c_device|OFFSET_SECONDARY_datab_0_cout_cin_8_combout_A_Y_B_Y_X10002_Y10003_SIG_SIG ),
	.AsyncReset(AsyncReset_X10002_Y10003_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10002_Y10003_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_7_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_datab_0_cout [8]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset [7]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .coord_y = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|current_offset_q_7 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg (
	.A(),
	.B(),
	.C(),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .mask = 16'hFF00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[0]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg (
	.A(),
	.B(),
	.C(),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1]),
	.Clk(\i2s_osd_select_2|BCLKD__i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_X10018_Y10002_INV_SIG ),
	.AsyncReset(AsyncReset_X10018_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10018_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|buffer|DataInA [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .coord_x = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .mask = 16'hFF00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|data_in[1]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg (
	.A(),
	.B(),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv ),
	.D(),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]),
	.Clk(\i2s_osd_select_2|BCLKD_X10006_Y10002_INV_VCC ),
	.AsyncReset(AsyncReset_X10006_Y10002_GND),
	.SyncReset(SyncReset_X10006_Y10002_GND),
	.ShiftData(),
	.SyncLoad(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10006_Y10002_SIG ),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .mask = 16'hF0F0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .FeedbackMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|image_width[6]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_combout ),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0]),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [0]),
	.Clk(GCLK_X10014_Y10001_SIG_VCC),
	.AsyncReset(AsyncReset_X10014_Y10001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_2_Y_A_1_Y ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [0]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .mask = 16'hCCCE;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de[0]_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [1]),
	.C(vcc),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .mask = 16'hFFCC;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .coord_z = 13;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .mask = 16'hFF0F;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [1]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [0]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [3]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .mask = 16'h0001;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [7]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [6]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [10]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .coord_z = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .mask = 16'h0003;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [7]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [6]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [10]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [1]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .coord_z = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .mask = 16'h0C00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [3]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [8]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [9]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .coord_z = 14;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .mask = 16'h0200;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_8 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [1]),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .mask = 16'h6688;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_2_combout [3]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [11]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [5]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .coord_z = 13;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .mask = 16'h0002;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_1 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_1_combout [1]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [8]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [9]),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_dataa_6_combout [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_dataa_2_combout [0]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .coord_z = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .mask = 16'h8000;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datac_8 .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [1]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [1]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_1_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [2]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [1]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_1 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [10]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [10]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_10_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [11]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [10]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .coord_z = 11;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_10 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [11]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [11]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_11_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [12]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [11]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .coord_z = 12;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_11 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [2]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [2]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_2_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [3]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [2]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .coord_z = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_2 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [3]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [3]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_3_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [4]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [3]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .coord_z = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_3 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [4]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [4]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_4_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [5]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [4]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .coord_z = 5;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_4 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [5]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [5]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_5_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [6]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [5]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .coord_z = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_5 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [6]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [6]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_6_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [7]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [6]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_6 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [7]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [7]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_7_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [8]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [7]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .coord_z = 8;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_7 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [8]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [8]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_8_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [9]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [8]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .coord_z = 9;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_8 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 (
	.A(vcc),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [9]),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [9]),
	.Clk(\GCLK__i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_B_Y_X10003_Y10002_SIG_SIG ),
	.AsyncReset(AsyncReset_X10003_Y10002_GND),
	.SyncReset(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X10003_Y10002_GND),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_9_combout ),
	.Cout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_datab_0_cout [10]),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de [9]));
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .coord_z = 10;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .mask = 16'h69D4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .modeMux = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .BypassEn = 1'b1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_q_9 .CarryEnb = 1'b0;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y ),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_dataa_combout [0]),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|normal|address_in [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .coord_z = 8;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .mask = 16'hAEAF;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_A_Y_A_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d (
	.A(vcc),
	.B(vcc),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ),
	.Clk(\i2s_osd_select_2|BCLKD_X10006_Y10002_INV_VCC ),
	.AsyncReset(AsyncReset_X10006_Y10002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .mask = 16'h000F;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I (
	.A(),
	.B(),
	.C(),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .mask = 16'h00FF;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_inv~I .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg (
	.A(),
	.B(),
	.C(),
	.D(I2S2_i_o[3]),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ),
	.Clk(\i2s_osd_select_2|BCLKD_X5019_Y5012_INV_VCC ),
	.AsyncReset(AsyncReset_X5019_Y5012_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .coord_y = 12;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .mask = 16'hFF00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW ),
	.B(CO2_i_o[1]),
	.C(CO2_i_o[0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .coord_x = 16;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .coord_y = 4;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .coord_z = 1;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .mask = 16'h8000;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_datad .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg (
	.A(),
	.B(),
	.C(),
	.D(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE ),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW ),
	.Clk(\i2s_osd_select_2|BCLKD_X5019_Y5012_SIG_VCC ),
	.AsyncReset(AsyncReset_X5019_Y5012_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .coord_y = 12;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .coord_z = 2;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .mask = 16'hFF00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_RAW_reg .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout (
	.A(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ),
	.B(vcc),
	.C(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y_d_q ),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y ),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .coord_x = 15;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .coord_y = 6;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .coord_z = 7;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .mask = 16'hA0A0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y_combout .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa (
	.A(CO2_i_o[1]),
	.B(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ),
	.C(CO2_i_o[0]),
	.D(\i2c_device|write_value_d_4_q ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa_combout [3]),
	.Cout(),
	.Q());
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .coord_x = 18;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .coord_y = 3;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .coord_z = 13;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .mask = 16'h8000;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_dataa .CarryEnb = 1'b1;

alta_slice \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg (
	.A(),
	.B(),
	.C(),
	.D(I2S2_i_o[3]),
	.Cin(),
	.Qin(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ),
	.Clk(\i2s_osd_select_2|BCLKD_X5019_Y5012_SIG_VCC ),
	.AsyncReset(AsyncReset_X5019_Y5012_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg__feeder__LutOut ),
	.Cout(),
	.Q(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW ));
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .coord_x = 19;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .coord_y = 12;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .coord_z = 0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .mask = 16'hFF00;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .modeMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .FeedbackMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .ShiftMux = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .BypassEn = 1'b0;
defparam \i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_reg .CarryEnb = 1'b1;

alta_syncctrl syncload_ctrl_X10001_Y10001(
	.Din(\i2c_device|brin_rec_A_0_Y ),
	.Dout(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10001_Y10001_SIG ));
defparam syncload_ctrl_X10001_Y10001.coord_x = 20;
defparam syncload_ctrl_X10001_Y10001.coord_y = 9;
defparam syncload_ctrl_X10001_Y10001.coord_z = 1;
defparam syncload_ctrl_X10001_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10001_Y10002(
	.Din(),
	.Dout(SyncLoad_X10001_Y10002_GND));
defparam syncload_ctrl_X10001_Y10002.coord_x = 18;
defparam syncload_ctrl_X10001_Y10002.coord_y = 4;
defparam syncload_ctrl_X10001_Y10002.coord_z = 1;
defparam syncload_ctrl_X10001_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10001_Y10003(
	.Din(\i2c_device|bit_pos_A_2_Y ),
	.Dout(\i2c_device|bit_pos_A_2_Y__SyncLoad_X10001_Y10003_SIG ));
defparam syncload_ctrl_X10001_Y10003.coord_x = 12;
defparam syncload_ctrl_X10001_Y10003.coord_y = 1;
defparam syncload_ctrl_X10001_Y10003.coord_z = 1;
defparam syncload_ctrl_X10001_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10002_Y10001(
	.Din(),
	.Dout(SyncLoad_X10002_Y10001_GND));
defparam syncload_ctrl_X10002_Y10001.coord_x = 19;
defparam syncload_ctrl_X10002_Y10001.coord_y = 6;
defparam syncload_ctrl_X10002_Y10001.coord_z = 1;
defparam syncload_ctrl_X10002_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10002_Y10002(
	.Din(\i2c_device|bit_pos_A_2_3_Y ),
	.Dout(\i2c_device|bit_pos_A_2_3_Y__SyncLoad_X10002_Y10002_SIG ));
defparam syncload_ctrl_X10002_Y10002.coord_x = 15;
defparam syncload_ctrl_X10002_Y10002.coord_y = 4;
defparam syncload_ctrl_X10002_Y10002.coord_z = 1;
defparam syncload_ctrl_X10002_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10002_Y10003(
	.Din(),
	.Dout(SyncLoad_X10002_Y10003_GND));
defparam syncload_ctrl_X10002_Y10003.coord_x = 14;
defparam syncload_ctrl_X10002_Y10003.coord_y = 2;
defparam syncload_ctrl_X10002_Y10003.coord_z = 1;
defparam syncload_ctrl_X10002_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10003_Y10002(
	.Din(),
	.Dout(SyncLoad_X10003_Y10002_GND));
defparam syncload_ctrl_X10003_Y10002.coord_x = 19;
defparam syncload_ctrl_X10003_Y10002.coord_y = 3;
defparam syncload_ctrl_X10003_Y10002.coord_z = 1;
defparam syncload_ctrl_X10003_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10003_Y10003(
	.Din(\i2c_device|bit_pos_dataa_1_combout_B_Y ),
	.Dout(\i2c_device|bit_pos_dataa_1_combout_B_Y__SyncLoad_X10003_Y10003_SIG ));
defparam syncload_ctrl_X10003_Y10003.coord_x = 9;
defparam syncload_ctrl_X10003_Y10003.coord_y = 2;
defparam syncload_ctrl_X10003_Y10003.coord_z = 1;
defparam syncload_ctrl_X10003_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10004_Y10001(
	.Din(),
	.Dout(SyncLoad_X10004_Y10001_VCC));
defparam syncload_ctrl_X10004_Y10001.coord_x = 19;
defparam syncload_ctrl_X10004_Y10001.coord_y = 7;
defparam syncload_ctrl_X10004_Y10001.coord_z = 1;
defparam syncload_ctrl_X10004_Y10001.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10004_Y10002(
	.Din(),
	.Dout(SyncLoad_X10004_Y10002_GND));
defparam syncload_ctrl_X10004_Y10002.coord_x = 19;
defparam syncload_ctrl_X10004_Y10002.coord_y = 1;
defparam syncload_ctrl_X10004_Y10002.coord_z = 1;
defparam syncload_ctrl_X10004_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10004_Y10003(
	.Din(),
	.Dout(SyncLoad_X10004_Y10003_GND));
defparam syncload_ctrl_X10004_Y10003.coord_x = 17;
defparam syncload_ctrl_X10004_Y10003.coord_y = 3;
defparam syncload_ctrl_X10004_Y10003.coord_z = 1;
defparam syncload_ctrl_X10004_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10005_Y10001(
	.Din(),
	.Dout(SyncLoad_X10005_Y10001_GND));
defparam syncload_ctrl_X10005_Y10001.coord_x = 19;
defparam syncload_ctrl_X10005_Y10001.coord_y = 5;
defparam syncload_ctrl_X10005_Y10001.coord_z = 1;
defparam syncload_ctrl_X10005_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10005_Y10002(
	.Din(\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y ),
	.Dout(\i2c_device|i2c_state_A_0_1_Y_A_Y_A_Y_B_Y__SyncLoad_X10005_Y10002_SIG ));
defparam syncload_ctrl_X10005_Y10002.coord_x = 11;
defparam syncload_ctrl_X10005_Y10002.coord_y = 3;
defparam syncload_ctrl_X10005_Y10002.coord_z = 1;
defparam syncload_ctrl_X10005_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10005_Y10003(
	.Din(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y ),
	.Dout(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_1_Y__SyncLoad_X10005_Y10003_SIG ));
defparam syncload_ctrl_X10005_Y10003.coord_x = 9;
defparam syncload_ctrl_X10005_Y10003.coord_y = 1;
defparam syncload_ctrl_X10005_Y10003.coord_z = 1;
defparam syncload_ctrl_X10005_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10006_Y10001(
	.Din(),
	.Dout(SyncLoad_X10006_Y10001_GND));
defparam syncload_ctrl_X10006_Y10001.coord_x = 18;
defparam syncload_ctrl_X10006_Y10001.coord_y = 6;
defparam syncload_ctrl_X10006_Y10001.coord_z = 1;
defparam syncload_ctrl_X10006_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10006_Y10002(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10006_Y10002_SIG ));
defparam syncload_ctrl_X10006_Y10002.coord_x = 15;
defparam syncload_ctrl_X10006_Y10002.coord_y = 6;
defparam syncload_ctrl_X10006_Y10002.coord_z = 1;
defparam syncload_ctrl_X10006_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10006_Y10003(
	.Din(\i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y ),
	.Dout(\i2c_device|i2c_state_A_0_1_Y_A_1_Y_A_1_Y_B_Y__SyncLoad_X10006_Y10003_SIG ));
defparam syncload_ctrl_X10006_Y10003.coord_x = 11;
defparam syncload_ctrl_X10006_Y10003.coord_y = 2;
defparam syncload_ctrl_X10006_Y10003.coord_z = 1;
defparam syncload_ctrl_X10006_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10007_Y10001(
	.Din(),
	.Dout(SyncLoad_X10007_Y10001_GND));
defparam syncload_ctrl_X10007_Y10001.coord_x = 18;
defparam syncload_ctrl_X10007_Y10001.coord_y = 7;
defparam syncload_ctrl_X10007_Y10001.coord_z = 1;
defparam syncload_ctrl_X10007_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10007_Y10002(
	.Din(),
	.Dout(SyncLoad_X10007_Y10002_GND));
defparam syncload_ctrl_X10007_Y10002.coord_x = 16;
defparam syncload_ctrl_X10007_Y10002.coord_y = 2;
defparam syncload_ctrl_X10007_Y10002.coord_z = 1;
defparam syncload_ctrl_X10007_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10007_Y10003(
	.Din(),
	.Dout(SyncLoad_X10007_Y10003_GND));
defparam syncload_ctrl_X10007_Y10003.coord_x = 18;
defparam syncload_ctrl_X10007_Y10003.coord_y = 2;
defparam syncload_ctrl_X10007_Y10003.coord_z = 1;
defparam syncload_ctrl_X10007_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10008_Y10001(
	.Din(),
	.Dout(SyncLoad_X10008_Y10001_GND));
defparam syncload_ctrl_X10008_Y10001.coord_x = 17;
defparam syncload_ctrl_X10008_Y10001.coord_y = 11;
defparam syncload_ctrl_X10008_Y10001.coord_z = 1;
defparam syncload_ctrl_X10008_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10008_Y10002(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q2_RAW_B_Y__SyncLoad_X10008_Y10002_INV ));
defparam syncload_ctrl_X10008_Y10002.coord_x = 15;
defparam syncload_ctrl_X10008_Y10002.coord_y = 3;
defparam syncload_ctrl_X10008_Y10002.coord_z = 1;
defparam syncload_ctrl_X10008_Y10002.SyncCtrlMux = 2'b11;

alta_syncctrl syncload_ctrl_X10008_Y10003(
	.Din(\i2c_device|bit_pos_dataa_0_combout_B_Y ),
	.Dout(\i2c_device|bit_pos_dataa_0_combout_B_Y__SyncLoad_X10008_Y10003_SIG ));
defparam syncload_ctrl_X10008_Y10003.coord_x = 11;
defparam syncload_ctrl_X10008_Y10003.coord_y = 1;
defparam syncload_ctrl_X10008_Y10003.coord_z = 1;
defparam syncload_ctrl_X10008_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10009_Y10001(
	.Din(),
	.Dout(SyncLoad_X10009_Y10001_GND));
defparam syncload_ctrl_X10009_Y10001.coord_x = 17;
defparam syncload_ctrl_X10009_Y10001.coord_y = 10;
defparam syncload_ctrl_X10009_Y10001.coord_z = 1;
defparam syncload_ctrl_X10009_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10009_Y10002(
	.Din(CLKOSC_clk_2_q_A_3_Y),
	.Dout(CLKOSC_clk_2_q_A_3_Y__SyncLoad_X10009_Y10002_SIG));
defparam syncload_ctrl_X10009_Y10002.coord_x = 11;
defparam syncload_ctrl_X10009_Y10002.coord_y = 4;
defparam syncload_ctrl_X10009_Y10002.coord_z = 1;
defparam syncload_ctrl_X10009_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10009_Y10003(
	.Din(),
	.Dout(SyncLoad_X10009_Y10003_GND));
defparam syncload_ctrl_X10009_Y10003.coord_x = 14;
defparam syncload_ctrl_X10009_Y10003.coord_y = 4;
defparam syncload_ctrl_X10009_Y10003.coord_z = 1;
defparam syncload_ctrl_X10009_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10010_Y10001(
	.Din(),
	.Dout(SyncLoad_X10010_Y10001_GND));
defparam syncload_ctrl_X10010_Y10001.coord_x = 19;
defparam syncload_ctrl_X10010_Y10001.coord_y = 8;
defparam syncload_ctrl_X10010_Y10001.coord_z = 1;
defparam syncload_ctrl_X10010_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10010_Y10002(
	.Din(\i2c_device|brip_rec_A_0_Y ),
	.Dout(\i2c_device|brip_rec_A_0_Y__SyncLoad_X10010_Y10002_SIG ));
defparam syncload_ctrl_X10010_Y10002.coord_x = 18;
defparam syncload_ctrl_X10010_Y10002.coord_y = 10;
defparam syncload_ctrl_X10010_Y10002.coord_z = 1;
defparam syncload_ctrl_X10010_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10010_Y10003(
	.Din(\i2c_device|start_B_0_Y ),
	.Dout(\i2c_device|start_B_0_Y__SyncLoad_X10010_Y10003_SIG ));
defparam syncload_ctrl_X10010_Y10003.coord_x = 9;
defparam syncload_ctrl_X10010_Y10003.coord_y = 4;
defparam syncload_ctrl_X10010_Y10003.coord_z = 1;
defparam syncload_ctrl_X10010_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10011_Y10002(
	.Din(\i2c_device|sda_A_0_1_Y_B_Y_B_Y ),
	.Dout(\i2c_device|sda_A_0_1_Y_B_Y_B_Y__SyncLoad_X10011_Y10002_SIG ));
defparam syncload_ctrl_X10011_Y10002.coord_x = 10;
defparam syncload_ctrl_X10011_Y10002.coord_y = 3;
defparam syncload_ctrl_X10011_Y10002.coord_z = 1;
defparam syncload_ctrl_X10011_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10011_Y10003(
	.Din(\i2c_device|brin_rec_A_0_Y ),
	.Dout(\i2c_device|brin_rec_A_0_Y__SyncLoad_X10011_Y10003_SIG ));
defparam syncload_ctrl_X10011_Y10003.coord_x = 17;
defparam syncload_ctrl_X10011_Y10003.coord_y = 6;
defparam syncload_ctrl_X10011_Y10003.coord_z = 1;
defparam syncload_ctrl_X10011_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10012_Y10001(
	.Din(),
	.Dout(SyncLoad_X10012_Y10001_GND));
defparam syncload_ctrl_X10012_Y10001.coord_x = 19;
defparam syncload_ctrl_X10012_Y10001.coord_y = 9;
defparam syncload_ctrl_X10012_Y10001.coord_z = 1;
defparam syncload_ctrl_X10012_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10012_Y10002(
	.Din(),
	.Dout(SyncLoad_X10012_Y10002_VCC));
defparam syncload_ctrl_X10012_Y10002.coord_x = 17;
defparam syncload_ctrl_X10012_Y10002.coord_y = 4;
defparam syncload_ctrl_X10012_Y10002.coord_z = 1;
defparam syncload_ctrl_X10012_Y10002.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10012_Y10003(
	.Din(\i2c_device|bit_pos_dataa_1_combout_A_Y ),
	.Dout(\i2c_device|bit_pos_dataa_1_combout_A_Y__SyncLoad_X10012_Y10003_SIG ));
defparam syncload_ctrl_X10012_Y10003.coord_x = 14;
defparam syncload_ctrl_X10012_Y10003.coord_y = 1;
defparam syncload_ctrl_X10012_Y10003.coord_z = 1;
defparam syncload_ctrl_X10012_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10014_Y10001(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10014_Y10001_SIG ));
defparam syncload_ctrl_X10014_Y10001.coord_x = 18;
defparam syncload_ctrl_X10014_Y10001.coord_y = 3;
defparam syncload_ctrl_X10014_Y10001.coord_z = 1;
defparam syncload_ctrl_X10014_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10014_Y10002(
	.Din(\i2c_device|bit_pos_A_2_1_Y ),
	.Dout(\i2c_device|bit_pos_A_2_1_Y__SyncLoad_X10014_Y10002_SIG ));
defparam syncload_ctrl_X10014_Y10002.coord_x = 12;
defparam syncload_ctrl_X10014_Y10002.coord_y = 2;
defparam syncload_ctrl_X10014_Y10002.coord_z = 1;
defparam syncload_ctrl_X10014_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10014_Y10003(
	.Din(\i2c_device|lockb_rec_A_0_Y ),
	.Dout(\i2c_device|lockb_rec_A_0_Y__SyncLoad_X10014_Y10003_SIG ));
defparam syncload_ctrl_X10014_Y10003.coord_x = 20;
defparam syncload_ctrl_X10014_Y10003.coord_y = 6;
defparam syncload_ctrl_X10014_Y10003.coord_z = 1;
defparam syncload_ctrl_X10014_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10015_Y10001(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_B_Y__SyncLoad_X10015_Y10001_SIG ));
defparam syncload_ctrl_X10015_Y10001.coord_x = 16;
defparam syncload_ctrl_X10015_Y10001.coord_y = 4;
defparam syncload_ctrl_X10015_Y10001.coord_z = 1;
defparam syncload_ctrl_X10015_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10015_Y10002(
	.Din(CLKOSC_clk_2_q_A_Y),
	.Dout(CLKOSC_clk_2_q_A_Y__SyncLoad_X10015_Y10002_SIG));
defparam syncload_ctrl_X10015_Y10002.coord_x = 12;
defparam syncload_ctrl_X10015_Y10002.coord_y = 4;
defparam syncload_ctrl_X10015_Y10002.coord_z = 1;
defparam syncload_ctrl_X10015_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10015_Y10003(
	.Din(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y ),
	.Dout(\i2c_device|bit_pos_dataa_2_combout_A_Y_B_Y__SyncLoad_X10015_Y10003_SIG ));
defparam syncload_ctrl_X10015_Y10003.coord_x = 10;
defparam syncload_ctrl_X10015_Y10003.coord_y = 1;
defparam syncload_ctrl_X10015_Y10003.coord_z = 1;
defparam syncload_ctrl_X10015_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10016_Y10001(
	.Din(),
	.Dout(SyncLoad_X10016_Y10001_VCC));
defparam syncload_ctrl_X10016_Y10001.coord_x = 17;
defparam syncload_ctrl_X10016_Y10001.coord_y = 2;
defparam syncload_ctrl_X10016_Y10001.coord_z = 1;
defparam syncload_ctrl_X10016_Y10001.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10016_Y10002(
	.Din(CLKOSC_clk_2_q_A_2_Y),
	.Dout(CLKOSC_clk_2_q_A_2_Y__SyncLoad_X10016_Y10002_SIG));
defparam syncload_ctrl_X10016_Y10002.coord_x = 12;
defparam syncload_ctrl_X10016_Y10002.coord_y = 3;
defparam syncload_ctrl_X10016_Y10002.coord_z = 1;
defparam syncload_ctrl_X10016_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10016_Y10003(
	.Din(CLKOSC_clk_2_q_A_1_Y),
	.Dout(CLKOSC_clk_2_q_A_1_Y__SyncLoad_X10016_Y10003_SIG));
defparam syncload_ctrl_X10016_Y10003.coord_x = 18;
defparam syncload_ctrl_X10016_Y10003.coord_y = 1;
defparam syncload_ctrl_X10016_Y10003.coord_z = 1;
defparam syncload_ctrl_X10016_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10017_Y10001(
	.Din(),
	.Dout(SyncLoad_X10017_Y10001_VCC));
defparam syncload_ctrl_X10017_Y10001.coord_x = 15;
defparam syncload_ctrl_X10017_Y10001.coord_y = 2;
defparam syncload_ctrl_X10017_Y10001.coord_z = 1;
defparam syncload_ctrl_X10017_Y10001.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10017_Y10002(
	.Din(),
	.Dout(SyncLoad_X10017_Y10002_GND));
defparam syncload_ctrl_X10017_Y10002.coord_x = 14;
defparam syncload_ctrl_X10017_Y10002.coord_y = 3;
defparam syncload_ctrl_X10017_Y10002.coord_z = 1;
defparam syncload_ctrl_X10017_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10017_Y10003(
	.Din(),
	.Dout(SyncLoad_X10017_Y10003_VCC));
defparam syncload_ctrl_X10017_Y10003.coord_x = 20;
defparam syncload_ctrl_X10017_Y10003.coord_y = 10;
defparam syncload_ctrl_X10017_Y10003.coord_z = 1;
defparam syncload_ctrl_X10017_Y10003.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10018_Y10001(
	.Din(),
	.Dout(SyncLoad_X10018_Y10001_VCC));
defparam syncload_ctrl_X10018_Y10001.coord_x = 10;
defparam syncload_ctrl_X10018_Y10001.coord_y = 4;
defparam syncload_ctrl_X10018_Y10001.coord_z = 1;
defparam syncload_ctrl_X10018_Y10001.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10018_Y10002(
	.Din(),
	.Dout(SyncLoad_X10018_Y10002_GND));
defparam syncload_ctrl_X10018_Y10002.coord_x = 14;
defparam syncload_ctrl_X10018_Y10002.coord_y = 6;
defparam syncload_ctrl_X10018_Y10002.coord_z = 1;
defparam syncload_ctrl_X10018_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10018_Y10003(
	.Din(\i2c_device|locka_rec_A_0_Y ),
	.Dout(\i2c_device|locka_rec_A_0_Y__SyncLoad_X10018_Y10003_SIG ));
defparam syncload_ctrl_X10018_Y10003.coord_x = 20;
defparam syncload_ctrl_X10018_Y10003.coord_y = 8;
defparam syncload_ctrl_X10018_Y10003.coord_z = 1;
defparam syncload_ctrl_X10018_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10019_Y10001(
	.Din(),
	.Dout(SyncLoad_X10019_Y10001_GND));
defparam syncload_ctrl_X10019_Y10001.coord_x = 16;
defparam syncload_ctrl_X10019_Y10001.coord_y = 3;
defparam syncload_ctrl_X10019_Y10001.coord_z = 1;
defparam syncload_ctrl_X10019_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X10019_Y10002(
	.Din(CLKOSC_clk_2_q_A_1_Y),
	.Dout(CLKOSC_clk_2_q_A_1_Y__SyncLoad_X10019_Y10002_SIG));
defparam syncload_ctrl_X10019_Y10002.coord_x = 15;
defparam syncload_ctrl_X10019_Y10002.coord_y = 1;
defparam syncload_ctrl_X10019_Y10002.coord_z = 1;
defparam syncload_ctrl_X10019_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10019_Y10003(
	.Din(),
	.Dout(SyncLoad_X10019_Y10003_VCC));
defparam syncload_ctrl_X10019_Y10003.coord_x = 20;
defparam syncload_ctrl_X10019_Y10003.coord_y = 7;
defparam syncload_ctrl_X10019_Y10003.coord_z = 1;
defparam syncload_ctrl_X10019_Y10003.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X10020_Y10001(
	.Din(\i2c_device|bit_pos_dataa_0_combout_A_Y ),
	.Dout(\i2c_device|bit_pos_dataa_0_combout_A_Y__SyncLoad_X10020_Y10001_SIG ));
defparam syncload_ctrl_X10020_Y10001.coord_x = 10;
defparam syncload_ctrl_X10020_Y10001.coord_y = 2;
defparam syncload_ctrl_X10020_Y10001.coord_z = 1;
defparam syncload_ctrl_X10020_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10020_Y10002(
	.Din(\i2c_device|bit_pos_A_2_2_Y ),
	.Dout(\i2c_device|bit_pos_A_2_2_Y__SyncLoad_X10020_Y10002_SIG ));
defparam syncload_ctrl_X10020_Y10002.coord_x = 16;
defparam syncload_ctrl_X10020_Y10002.coord_y = 1;
defparam syncload_ctrl_X10020_Y10002.coord_z = 1;
defparam syncload_ctrl_X10020_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncload_ctrl_X10020_Y10003(
	.Din(\i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y ),
	.Dout(\i2c_device|bit_pos_dataa_2_combout_A_1_Y_B_Y__SyncLoad_X10020_Y10003_SIG ));
defparam syncload_ctrl_X10020_Y10003.coord_x = 9;
defparam syncload_ctrl_X10020_Y10003.coord_y = 3;
defparam syncload_ctrl_X10020_Y10003.coord_z = 1;
defparam syncload_ctrl_X10020_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10001_Y10001(
	.Din(),
	.Dout(SyncReset_X10001_Y10001_GND));
defparam syncreset_ctrl_X10001_Y10001.coord_x = 20;
defparam syncreset_ctrl_X10001_Y10001.coord_y = 9;
defparam syncreset_ctrl_X10001_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10001_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10001_Y10002(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|normal|clk_div[0]_reg_q_A_1_Y_A_Y_A_Y__SyncReset_X10001_Y10002_SIG ));
defparam syncreset_ctrl_X10001_Y10002.coord_x = 18;
defparam syncreset_ctrl_X10001_Y10002.coord_y = 4;
defparam syncreset_ctrl_X10001_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10001_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10001_Y10003(
	.Din(),
	.Dout(SyncReset_X10001_Y10003_GND));
defparam syncreset_ctrl_X10001_Y10003.coord_x = 12;
defparam syncreset_ctrl_X10001_Y10003.coord_y = 1;
defparam syncreset_ctrl_X10001_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10001_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10002_Y10001(
	.Din(\i2c_device|lockb_rec_A_0_Y ),
	.Dout(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10002_Y10001_SIG ));
defparam syncreset_ctrl_X10002_Y10001.coord_x = 19;
defparam syncreset_ctrl_X10002_Y10001.coord_y = 6;
defparam syncreset_ctrl_X10002_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10002_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10002_Y10002(
	.Din(),
	.Dout(SyncReset_X10002_Y10002_GND));
defparam syncreset_ctrl_X10002_Y10002.coord_x = 15;
defparam syncreset_ctrl_X10002_Y10002.coord_y = 4;
defparam syncreset_ctrl_X10002_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10002_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10002_Y10003(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10002_Y10003_SIG ));
defparam syncreset_ctrl_X10002_Y10003.coord_x = 14;
defparam syncreset_ctrl_X10002_Y10003.coord_y = 2;
defparam syncreset_ctrl_X10002_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10002_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10003_Y10002(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10003_Y10002_SIG ));
defparam syncreset_ctrl_X10003_Y10002.coord_x = 19;
defparam syncreset_ctrl_X10003_Y10002.coord_y = 3;
defparam syncreset_ctrl_X10003_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10003_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10003_Y10003(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10003_Y10003_SIG ));
defparam syncreset_ctrl_X10003_Y10003.coord_x = 9;
defparam syncreset_ctrl_X10003_Y10003.coord_y = 2;
defparam syncreset_ctrl_X10003_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10003_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10004_Y10001(
	.Din(),
	.Dout(SyncReset_X10004_Y10001_GND));
defparam syncreset_ctrl_X10004_Y10001.coord_x = 19;
defparam syncreset_ctrl_X10004_Y10001.coord_y = 7;
defparam syncreset_ctrl_X10004_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10004_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10004_Y10002(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|normal|output_de_A_8_Y_B_Y_A_Y__SyncReset_X10004_Y10002_SIG ));
defparam syncreset_ctrl_X10004_Y10002.coord_x = 19;
defparam syncreset_ctrl_X10004_Y10002.coord_y = 1;
defparam syncreset_ctrl_X10004_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10004_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10004_Y10003(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10004_Y10003_SIG ));
defparam syncreset_ctrl_X10004_Y10003.coord_x = 17;
defparam syncreset_ctrl_X10004_Y10003.coord_y = 3;
defparam syncreset_ctrl_X10004_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10004_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10005_Y10001(
	.Din(\i2c_device|lockb_rec_A_0_Y ),
	.Dout(\i2c_device|lockb_rec_A_0_Y__SyncReset_X10005_Y10001_SIG ));
defparam syncreset_ctrl_X10005_Y10001.coord_x = 19;
defparam syncreset_ctrl_X10005_Y10001.coord_y = 5;
defparam syncreset_ctrl_X10005_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10005_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10005_Y10002(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10002_SIG ));
defparam syncreset_ctrl_X10005_Y10002.coord_x = 11;
defparam syncreset_ctrl_X10005_Y10002.coord_y = 3;
defparam syncreset_ctrl_X10005_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10005_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10005_Y10003(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10005_Y10003_SIG ));
defparam syncreset_ctrl_X10005_Y10003.coord_x = 9;
defparam syncreset_ctrl_X10005_Y10003.coord_y = 1;
defparam syncreset_ctrl_X10005_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10005_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10006_Y10001(
	.Din(\i2c_device|brin_rec_A_0_Y ),
	.Dout(\i2c_device|brin_rec_A_0_Y__SyncReset_X10006_Y10001_SIG ));
defparam syncreset_ctrl_X10006_Y10001.coord_x = 18;
defparam syncreset_ctrl_X10006_Y10001.coord_y = 6;
defparam syncreset_ctrl_X10006_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10006_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10006_Y10002(
	.Din(),
	.Dout(SyncReset_X10006_Y10002_GND));
defparam syncreset_ctrl_X10006_Y10002.coord_x = 15;
defparam syncreset_ctrl_X10006_Y10002.coord_y = 6;
defparam syncreset_ctrl_X10006_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10006_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10006_Y10003(
	.Din(),
	.Dout(SyncReset_X10006_Y10003_GND));
defparam syncreset_ctrl_X10006_Y10003.coord_x = 11;
defparam syncreset_ctrl_X10006_Y10003.coord_y = 2;
defparam syncreset_ctrl_X10006_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10006_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10007_Y10001(
	.Din(\i2c_device|brin_rec_A_0_Y ),
	.Dout(\i2c_device|brin_rec_A_0_Y__SyncReset_X10007_Y10001_SIG ));
defparam syncreset_ctrl_X10007_Y10001.coord_x = 18;
defparam syncreset_ctrl_X10007_Y10001.coord_y = 7;
defparam syncreset_ctrl_X10007_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10007_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10007_Y10002(
	.Din(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y ),
	.Dout(\i2c_device|sda_d_0_9_q_A_Y_B_Y_A_Y__SyncReset_X10007_Y10002_INV ));
defparam syncreset_ctrl_X10007_Y10002.coord_x = 16;
defparam syncreset_ctrl_X10007_Y10002.coord_y = 2;
defparam syncreset_ctrl_X10007_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10007_Y10002.SyncCtrlMux = 2'b11;

alta_syncctrl syncreset_ctrl_X10007_Y10003(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10007_Y10003_SIG ));
defparam syncreset_ctrl_X10007_Y10003.coord_x = 18;
defparam syncreset_ctrl_X10007_Y10003.coord_y = 2;
defparam syncreset_ctrl_X10007_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10007_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10008_Y10001(
	.Din(\i2c_device|brip_rec_A_0_Y ),
	.Dout(\i2c_device|brip_rec_A_0_Y__SyncReset_X10008_Y10001_SIG ));
defparam syncreset_ctrl_X10008_Y10001.coord_x = 17;
defparam syncreset_ctrl_X10008_Y10001.coord_y = 11;
defparam syncreset_ctrl_X10008_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10008_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10008_Y10002(
	.Din(),
	.Dout(SyncReset_X10008_Y10002_GND));
defparam syncreset_ctrl_X10008_Y10002.coord_x = 15;
defparam syncreset_ctrl_X10008_Y10002.coord_y = 3;
defparam syncreset_ctrl_X10008_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10008_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10008_Y10003(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10008_Y10003_SIG ));
defparam syncreset_ctrl_X10008_Y10003.coord_x = 11;
defparam syncreset_ctrl_X10008_Y10003.coord_y = 1;
defparam syncreset_ctrl_X10008_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10008_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10009_Y10001(
	.Din(\i2c_device|brip_rec_A_0_Y ),
	.Dout(\i2c_device|brip_rec_A_0_Y__SyncReset_X10009_Y10001_SIG ));
defparam syncreset_ctrl_X10009_Y10001.coord_x = 17;
defparam syncreset_ctrl_X10009_Y10001.coord_y = 10;
defparam syncreset_ctrl_X10009_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10009_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10009_Y10002(
	.Din(),
	.Dout(SyncReset_X10009_Y10002_GND));
defparam syncreset_ctrl_X10009_Y10002.coord_x = 11;
defparam syncreset_ctrl_X10009_Y10002.coord_y = 4;
defparam syncreset_ctrl_X10009_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10009_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10009_Y10003(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|normal|bpo_A_2_Y_B_Y_A_1_Y__SyncReset_X10009_Y10003_SIG ));
defparam syncreset_ctrl_X10009_Y10003.coord_x = 14;
defparam syncreset_ctrl_X10009_Y10003.coord_y = 4;
defparam syncreset_ctrl_X10009_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10009_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10010_Y10001(
	.Din(\i2c_device|locka_rec_A_0_Y ),
	.Dout(\i2c_device|locka_rec_A_0_Y__SyncReset_X10010_Y10001_SIG ));
defparam syncreset_ctrl_X10010_Y10001.coord_x = 19;
defparam syncreset_ctrl_X10010_Y10001.coord_y = 8;
defparam syncreset_ctrl_X10010_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10010_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10010_Y10002(
	.Din(),
	.Dout(SyncReset_X10010_Y10002_GND));
defparam syncreset_ctrl_X10010_Y10002.coord_x = 18;
defparam syncreset_ctrl_X10010_Y10002.coord_y = 10;
defparam syncreset_ctrl_X10010_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10010_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10010_Y10003(
	.Din(),
	.Dout(SyncReset_X10010_Y10003_GND));
defparam syncreset_ctrl_X10010_Y10003.coord_x = 9;
defparam syncreset_ctrl_X10010_Y10003.coord_y = 4;
defparam syncreset_ctrl_X10010_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10010_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10011_Y10002(
	.Din(),
	.Dout(SyncReset_X10011_Y10002_GND));
defparam syncreset_ctrl_X10011_Y10002.coord_x = 10;
defparam syncreset_ctrl_X10011_Y10002.coord_y = 3;
defparam syncreset_ctrl_X10011_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10011_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10011_Y10003(
	.Din(),
	.Dout(SyncReset_X10011_Y10003_GND));
defparam syncreset_ctrl_X10011_Y10003.coord_x = 17;
defparam syncreset_ctrl_X10011_Y10003.coord_y = 6;
defparam syncreset_ctrl_X10011_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10011_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10012_Y10001(
	.Din(\i2c_device|locka_rec_A_0_Y ),
	.Dout(\i2c_device|locka_rec_A_0_Y__SyncReset_X10012_Y10001_SIG ));
defparam syncreset_ctrl_X10012_Y10001.coord_x = 19;
defparam syncreset_ctrl_X10012_Y10001.coord_y = 9;
defparam syncreset_ctrl_X10012_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10012_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10012_Y10002(
	.Din(),
	.Dout(SyncReset_X10012_Y10002_GND));
defparam syncreset_ctrl_X10012_Y10002.coord_x = 17;
defparam syncreset_ctrl_X10012_Y10002.coord_y = 4;
defparam syncreset_ctrl_X10012_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10012_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10012_Y10003(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10012_Y10003_SIG ));
defparam syncreset_ctrl_X10012_Y10003.coord_x = 14;
defparam syncreset_ctrl_X10012_Y10003.coord_y = 1;
defparam syncreset_ctrl_X10012_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10012_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10014_Y10001(
	.Din(),
	.Dout(SyncReset_X10014_Y10001_GND));
defparam syncreset_ctrl_X10014_Y10001.coord_x = 18;
defparam syncreset_ctrl_X10014_Y10001.coord_y = 3;
defparam syncreset_ctrl_X10014_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10014_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10014_Y10002(
	.Din(),
	.Dout(SyncReset_X10014_Y10002_GND));
defparam syncreset_ctrl_X10014_Y10002.coord_x = 12;
defparam syncreset_ctrl_X10014_Y10002.coord_y = 2;
defparam syncreset_ctrl_X10014_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10014_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10014_Y10003(
	.Din(),
	.Dout(SyncReset_X10014_Y10003_GND));
defparam syncreset_ctrl_X10014_Y10003.coord_x = 20;
defparam syncreset_ctrl_X10014_Y10003.coord_y = 6;
defparam syncreset_ctrl_X10014_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10014_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10015_Y10001(
	.Din(),
	.Dout(SyncReset_X10015_Y10001_GND));
defparam syncreset_ctrl_X10015_Y10001.coord_x = 16;
defparam syncreset_ctrl_X10015_Y10001.coord_y = 4;
defparam syncreset_ctrl_X10015_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10015_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10015_Y10002(
	.Din(),
	.Dout(SyncReset_X10015_Y10002_GND));
defparam syncreset_ctrl_X10015_Y10002.coord_x = 12;
defparam syncreset_ctrl_X10015_Y10002.coord_y = 4;
defparam syncreset_ctrl_X10015_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10015_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10015_Y10003(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10015_Y10003_SIG ));
defparam syncreset_ctrl_X10015_Y10003.coord_x = 10;
defparam syncreset_ctrl_X10015_Y10003.coord_y = 1;
defparam syncreset_ctrl_X10015_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10015_Y10003.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10016_Y10001(
	.Din(),
	.Dout(SyncReset_X10016_Y10001_GND));
defparam syncreset_ctrl_X10016_Y10001.coord_x = 17;
defparam syncreset_ctrl_X10016_Y10001.coord_y = 2;
defparam syncreset_ctrl_X10016_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10016_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10016_Y10002(
	.Din(),
	.Dout(SyncReset_X10016_Y10002_GND));
defparam syncreset_ctrl_X10016_Y10002.coord_x = 12;
defparam syncreset_ctrl_X10016_Y10002.coord_y = 3;
defparam syncreset_ctrl_X10016_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10016_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10016_Y10003(
	.Din(),
	.Dout(SyncReset_X10016_Y10003_GND));
defparam syncreset_ctrl_X10016_Y10003.coord_x = 18;
defparam syncreset_ctrl_X10016_Y10003.coord_y = 1;
defparam syncreset_ctrl_X10016_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10016_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10017_Y10001(
	.Din(),
	.Dout(SyncReset_X10017_Y10001_GND));
defparam syncreset_ctrl_X10017_Y10001.coord_x = 15;
defparam syncreset_ctrl_X10017_Y10001.coord_y = 2;
defparam syncreset_ctrl_X10017_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10017_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10017_Y10002(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10017_Y10002_SIG ));
defparam syncreset_ctrl_X10017_Y10002.coord_x = 14;
defparam syncreset_ctrl_X10017_Y10002.coord_y = 3;
defparam syncreset_ctrl_X10017_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10017_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10017_Y10003(
	.Din(),
	.Dout(SyncReset_X10017_Y10003_GND));
defparam syncreset_ctrl_X10017_Y10003.coord_x = 20;
defparam syncreset_ctrl_X10017_Y10003.coord_y = 10;
defparam syncreset_ctrl_X10017_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10017_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10018_Y10001(
	.Din(),
	.Dout(SyncReset_X10018_Y10001_GND));
defparam syncreset_ctrl_X10018_Y10001.coord_x = 10;
defparam syncreset_ctrl_X10018_Y10001.coord_y = 4;
defparam syncreset_ctrl_X10018_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10018_Y10001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10018_Y10002(
	.Din(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y ),
	.Dout(\i2s_osd_select_2|pcm_to_pdm_select|raw|Q1_PRE_A_Y__SyncReset_X10018_Y10002_SIG ));
defparam syncreset_ctrl_X10018_Y10002.coord_x = 14;
defparam syncreset_ctrl_X10018_Y10002.coord_y = 6;
defparam syncreset_ctrl_X10018_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10018_Y10002.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10018_Y10003(
	.Din(),
	.Dout(SyncReset_X10018_Y10003_GND));
defparam syncreset_ctrl_X10018_Y10003.coord_x = 20;
defparam syncreset_ctrl_X10018_Y10003.coord_y = 8;
defparam syncreset_ctrl_X10018_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10018_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10019_Y10001(
	.Din(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y ),
	.Dout(\i2s_osd_select_1|pcm_to_pdm_select|normal|clk_div_count_A_2_Y_A_Y_A_Y_A_Y__SyncReset_X10019_Y10001_SIG ));
defparam syncreset_ctrl_X10019_Y10001.coord_x = 16;
defparam syncreset_ctrl_X10019_Y10001.coord_y = 3;
defparam syncreset_ctrl_X10019_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10019_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10019_Y10002(
	.Din(),
	.Dout(SyncReset_X10019_Y10002_GND));
defparam syncreset_ctrl_X10019_Y10002.coord_x = 15;
defparam syncreset_ctrl_X10019_Y10002.coord_y = 1;
defparam syncreset_ctrl_X10019_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10019_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10019_Y10003(
	.Din(),
	.Dout(SyncReset_X10019_Y10003_GND));
defparam syncreset_ctrl_X10019_Y10003.coord_x = 20;
defparam syncreset_ctrl_X10019_Y10003.coord_y = 7;
defparam syncreset_ctrl_X10019_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10019_Y10003.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10020_Y10001(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10020_Y10001_SIG ));
defparam syncreset_ctrl_X10020_Y10001.coord_x = 10;
defparam syncreset_ctrl_X10020_Y10001.coord_y = 2;
defparam syncreset_ctrl_X10020_Y10001.coord_z = 0;
defparam syncreset_ctrl_X10020_Y10001.SyncCtrlMux = 2'b10;

alta_syncctrl syncreset_ctrl_X10020_Y10002(
	.Din(),
	.Dout(SyncReset_X10020_Y10002_GND));
defparam syncreset_ctrl_X10020_Y10002.coord_x = 16;
defparam syncreset_ctrl_X10020_Y10002.coord_y = 1;
defparam syncreset_ctrl_X10020_Y10002.coord_z = 0;
defparam syncreset_ctrl_X10020_Y10002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X10020_Y10003(
	.Din(\i2c_device|stop_B_0_Y_B_Y_A_4_Y ),
	.Dout(\i2c_device|stop_B_0_Y_B_Y_A_4_Y__SyncReset_X10020_Y10003_SIG ));
defparam syncreset_ctrl_X10020_Y10003.coord_x = 9;
defparam syncreset_ctrl_X10020_Y10003.coord_y = 3;
defparam syncreset_ctrl_X10020_Y10003.coord_z = 0;
defparam syncreset_ctrl_X10020_Y10003.SyncCtrlMux = 2'b10;

endmodule
