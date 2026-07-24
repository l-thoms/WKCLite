`define CLK_DIV_PAL 10          // 7.2MHz
`define CLK_DIV_NTSC 12         // 6MHz
`define IMAGE_WIDTH_PAL 384
`define IMAGE_WIDTH_NTSC 320
`define MAX_OUTPUT_RANGE 3840
`define MAX_OUTPUT_RANGE_RAW 400

module i2s_osd_pdm (
    BPO, CO,
    WS, I2S,
    Q1, Q2,
    GCLK, OFFSET, INTR_EDGE,
    FORMAT
);
    input BPO, CO, GCLK, INTR_EDGE;
    input WS, I2S;
    output Q1 = Q1I && (output_de != 0);
    output Q2 = Q2I && (output_de != 0);
    reg Q1I = 0, Q2I = 0;
    input [7:0] OFFSET;
    wire WS_INV = !WS;
    input FORMAT;

    //reg clk_div_id = 0;
    wire [3:0] clk_div = FORMAT ? `CLK_DIV_PAL : `CLK_DIV_NTSC;
    reg [8:0] clk_div_count = 0;
    reg [12:0] output_de = 0;

    reg [1:0] data_in = 0;
    reg [8:0] address_in = 0;
    reg [8:0] address_out = 0;
    wire [1:0] data_out;

    reg [1:0] current_pixel = 0;
    wire [8:0] image_width = FORMAT ? `IMAGE_WIDTH_PAL : `IMAGE_WIDTH_NTSC;
    reg reset = 0;
    reg [7:0] current_offset = 0;

    reg [2:0] bpo = 0;

    i2s_osd_buffer buffer (
        .Clk0(WS_INV), .Clk1(GCLK), .ClkEn0(1'b1), .ClkEn1(1'b1),
        .AsyncReset0(1'b0), .AsyncReset1(1'b0), .WeA(1'b1), .ReB(1'b1),
        .DataInA(data_in), .DataOutB(data_out), .AddressA(address_in), .AddressB(address_out)
    );

    // Store pixels by WS
    always @(posedge WS_INV) begin
        if(current_pixel == 2'b00) begin
            reset <= 1;
            address_in <= 0;
            data_in <= 0;
        end else if (reset == 1) begin
            //if (current_pixel == 2'b10) begin
            //    clk_div_id <= 0;
            //end else if (current_pixel == 2'b11) begin
            //    clk_div_id <= 1;
            //end
            reset <= 0;
        end else if (address_in < image_width) begin
            data_in <= current_pixel;
            address_in <= address_in + 1;
        end

        current_pixel[0] <= I2S;
    end

    always @(negedge WS_INV) begin
        current_pixel[1] <= I2S;
    end

    // Detect hsync and read osd from buffer by GCLK
    always @(posedge GCLK) begin
        // Limit output range
        if (bpo == 'b011) begin
            output_de <= 1;
        end else if (output_de == `MAX_OUTPUT_RANGE) begin
            output_de <= 0;
        end else if (output_de != 0) begin
            output_de <= output_de + 1;
        end

        if (bpo == 'b011 && !INTR_EDGE || bpo == 'b100 && INTR_EDGE) begin
            clk_div_count <= 0;
            address_out <= 0;
            current_offset <= 0;
        end
        else if (clk_div_count == clk_div - 1) begin
            if (current_offset < OFFSET) begin
                current_offset <= current_offset + 1;
                Q1I <= 0;
                Q2I <= 0;
            end else if (address_out < image_width) begin
                Q1I <= data_out[0] && BPO && CO;
                Q2I <= data_out[1] && BPO && CO;
                address_out <= address_out + 1;
            end else begin
                Q1I <= 0;
                Q2I <= 0;
            end
            clk_div_count <= 0;
        end else begin
            clk_div_count <= clk_div_count + 1;
        end
        if (bpo[1] == bpo[0])
            bpo[2] <= bpo[1];
        bpo[1] <= bpo[0];
        bpo[0] <= BPO;
    end

endmodule

// Use i2s data to control switches directly
module i2s_osd_pdm_raw (
    BPO, CO,
    WS, I2S,
    Q1, Q2,
);
    input BPO, CO;
    input WS, I2S;
    reg Q1_PRE, Q1_RAW, Q2_RAW;
    reg [9:0] output_de = 0;
    reg [2:0] bpo = 0;
    output Q1 = Q1_RAW && BPO && CO && (output_de != 0);
    output Q2 = Q2_RAW && BPO && CO && (output_de != 0);

    always @(negedge WS) begin
        if (bpo == 'b011) begin
            output_de <= 1;
        end else if (output_de == `MAX_OUTPUT_RANGE_RAW) begin
            output_de <= 0;
        end else if (output_de != 0) begin
            output_de <= output_de + 1;
        end

        Q1_PRE <= I2S;

        if (bpo[1] == bpo[0])
            bpo[2] <= bpo[1];
        bpo[1] <= bpo[0];
        bpo[0] <= BPO;
    end
    always @(posedge WS) begin
        Q1_RAW <= Q1_PRE;
        Q2_RAW <= I2S;
    end
endmodule

module i2s_osd_pdm_select (
    BPO, CO,
    WS, I2S,
    Q1, Q2,
    GCLK, MODE,
    OFFSET, INTR_EDGE,
    FORMAT
);
    input BPO, CO, GCLK, MODE, INTR_EDGE;
    input WS, I2S;
    output Q1, Q2;
    wire Q1_NORMAL, Q2_NORMAL;
    wire Q1_RAW, Q2_RAW;
    input [7:0] OFFSET;
    input FORMAT;

    i2s_osd_pdm normal (
        .BPO(BPO), .CO(CO),
        .WS(WS), .I2S(I2S),
        .Q1(Q1_NORMAL), .Q2(Q2_NORMAL),
        .GCLK(GCLK), .OFFSET(OFFSET), .INTR_EDGE(INTR_EDGE),
        .FORMAT(FORMAT)
    );

    i2s_osd_pdm_raw raw (
        .BPO(BPO), .CO(CO),
        .WS(WS), .I2S(I2S),
        .Q1(Q1_RAW), .Q2(Q2_RAW)
    );

    assign Q1 = Q1_NORMAL && !MODE || Q1_RAW && MODE && BPO && CO;
    assign Q2 = Q2_NORMAL && !MODE || Q2_RAW && MODE && BPO && CO;
endmodule

// Convert pcm to pdm format
module i2s_osd_pcm_select (
    BPO, CO,
    BCLK, I2S,
    Q1, Q2,
    GCLK, MODE,
    OFFSET, INTR_EDGE,
    FORMAT
);
    input BPO, CO, GCLK, MODE, INTR_EDGE;
    input BCLK, I2S;
    output Q1, Q2;
    reg BCLKD = 0;
    reg [2:0] i2s_record = 0;
    input [7:0] OFFSET;
    input FORMAT;

    always @(posedge BCLK) begin
        if (i2s_record == 0 && I2S == 1) begin
            BCLKD <= 0;
        end else begin
            BCLKD <= !BCLKD;
        end
        i2s_record[2:1] <= i2s_record[1:0];
        i2s_record[0] <= I2S;
    end

    i2s_osd_pdm_select pcm_to_pdm_select (
        .BPO(BPO), .CO(CO),
        .WS(BCLKD), .I2S(I2S),
        .Q1(Q1), .Q2(Q2),
        .GCLK(GCLK), .MODE(MODE),
        .OFFSET(OFFSET), .INTR_EDGE(INTR_EDGE),
        .FORMAT(FORMAT)
    );
endmodule

module main (
    CLKOSC,
    BPO1, CO1, BPO2, CO2,
    BCLK1, I2S1, BCLK2, I2S2,
    Q11, Q12,
    Q21, Q22,
    SCL, SDA,
    STDBY, CHRG,
    PWDN, DISP,
    LOCKA, LOCKB,
    BRIP, BRIN,
    CSEL1, CSEL2
);
    input CLKOSC;
    input BPO1, CO1, BPO2, CO2;
    input BCLK1, I2S1, BCLK2, I2S2;

    output Q11, Q12, Q21, Q22;
    input SCL;
    inout SDA;
    input STDBY, CHRG;
    output PWDN;
    input DISP;
    output LOCKA, LOCKB, BRIP, BRIN;
    output CSEL1, CSEL2;
    wire GCLK, CLKFB, MODE, INTR_EDGE, F1, F2;
    wire [7:0] OFFSET_PRIMARY, OFFSET_SECONDARY;

    i2c_peripheral i2c_device (
        .SCL(SCL), .SDA(SDA), .MCLK(CLKOSC), .INTR_EDGE(INTR_EDGE),
        .LOCKA(LOCKA), .LOCKB(LOCKB),
        .BRIP(BRIP), .BRIN(BRIN),
        .STDBY(STDBY), .CHRG(CHRG),
        .DISP(DISP), .PWDN(PWDN), .OUTPUT_MODE(MODE),
        .CSEL1(CSEL1), .CSEL2(CSEL2),
        .OFFSET_PRIMARY(OFFSET_PRIMARY), .OFFSET_SECONDARY(OFFSET_SECONDARY),
        .F1(F1), .F2(F2)
    );

    global_clock gclk (
        .clkin(CLKOSC), .clkfb(CLKFB), .clkfbout(CLKFB), .pfden(1'b1), .resetn(1'b1),
        .phasecounterselect(3'b0), .phaseupdown(1'b0), .phasestep(1'b0), .phasedone(),
        .scanclk(1'b0), .scanclkena(1'b0), .scandata(1'b0),
        .configupdate(1'b0), .lock(),
        .clkout0(GCLK)
    );

    i2s_osd_pcm_select i2s_osd_select_1 (
        .BPO(BPO1), .CO(CO1),
        .BCLK(BCLK1), .I2S(I2S1),
        .Q1(Q11), .Q2(Q12),
        .GCLK(GCLK), .MODE(MODE), .INTR_EDGE(INTR_EDGE),
        .OFFSET(OFFSET_PRIMARY),
        .FORMAT(F1)
    );

    i2s_osd_pcm_select i2s_osd_select_2 (
        .BPO(BPO2), .CO(CO2),
        .BCLK(BCLK2), .I2S(I2S2),
        .Q1(Q21), .Q2(Q22),
        .GCLK(GCLK), .MODE(MODE), .INTR_EDGE(INTR_EDGE),
        .OFFSET(OFFSET_SECONDARY),
        .FORMAT(F2)
    );

endmodule
