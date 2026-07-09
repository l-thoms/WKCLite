`define I2C_IDLE            0
`define I2C_ADDRESS         1
`define I2C_ACK_ADDR        2
`define I2C_WRITE_REG       3
`define I2C_ACK_REG         4
`define I2C_WRITE_VALUE     5
`define I2C_ACK_WRITE       6
`define I2C_READ_VALUE      7

`define DEVICE_ADDRESS      6'h2c
`define CLK_SLOW_DIV        7999

`define I2C_REG_POWER       0
`define I2C_REG_DISP_CTRL   1
`define I2C_REG_LOCK_BRI    2
`define I2C_REG_OFFSET_1    3
`define I2C_REG_OFFSET_2    4

module i2c_peripheral (
    SCL, SDA, MCLK, INTR_EDGE,
    LOCKA, LOCKB,
    BRIP, BRIN,
    STDBY, CHRG,
    DISP, PWDN, OUTPUT_MODE,
    CSEL1, CSEL2,
    OFFSET_PRIMARY, OFFSET_SECONDARY
);
    input SCL;
    inout SDA;
    input MCLK;

    // Reg 0: Power state, STDBY CHRG
    //                     RO    RO
    input STDBY, CHRG;

    // Reg 1: Display control, OUTPUT_MODE INTR_EDGE PWDN CSEL1 CSEL2
    //                         RW          RW        RW   RW    RW
    input DISP;
    output PWDN;
    output reg OUTPUT_MODE = 0;
    output reg INTR_EDGE = 0;
    output reg CSEL1 = 0;
    output reg CSEL2 = 0;
    reg pwdn_val = 1;
    // Automatically power down when DISP lows
    assign PWDN = pwdn_val & DISP;

    // Reg 2: Lock/Brightness, LOCKA LOCKB BRIP BRIN
    //                         RWC   RWC   RWC  RWC
    output LOCKA, LOCKB, BRIP, BRIN;

    // Reg 3, 4: Offset
    output reg [7:0] OFFSET_PRIMARY = 0;
    output reg [7:0] OFFSET_SECONDARY = 0;

    reg [1:0] locka_rec = 0;
    reg [1:0] lockb_rec = 0;
    reg [1:0] brip_rec = 0;
    reg [1:0] brin_rec = 0;
    reg [22:0] locka_cnt = 0;
    reg [22:0] lockb_cnt = 0;
    reg [22:0] brip_cnt = 0;
    reg [22:0] brin_cnt = 0;

    assign LOCKA = locka_cnt > 3000000;
    assign LOCKB = lockb_cnt > 4000000;
    assign BRIP = brip_cnt > 800000 ? 0 : 'bz;
    assign BRIN = brin_cnt > 800000 ? 0 : 'bz;

    reg sda_out = 1;
    wire sda_in = SDA & 1;
    assign SDA = sda_out ? 'bz : 0;
    reg [2:0] scl = 0;
    reg [2:0] sda = 0;
    wire stable_en = scl[0] == scl[1] && sda[0] == sda[1];
    wire scl_posedge = scl[2] == 0 && scl[0] == 1 && stable_en;
    wire scl_negedge = scl[2] == 1 && scl[0] == 0 && stable_en;
    wire sda_posedge = sda[2] == 0 && sda[0] == 1 && stable_en;
    wire sda_negedge = sda[2] == 1 && sda[0] == 0 && stable_en;

    reg [2:0] hp = 0;
    wire hp_stable_en = hp[0] == hp[1];
    wire hp_posedge = hp[2] == 0 && hp[0] == 1 && hp_stable_en;
    wire hp_negedge = hp[2] == 1 && hp[0] == 0 && hp_stable_en;

    reg [1:0] start = 0;
    reg [1:0] stop = 0;
    reg [2:0] i2c_state = 0;
    reg [2:0] bit_pos = 7;
    reg [6:0] current_address = 0;
    reg [7:0] reg_address = 0;
    reg [7:0] read_value = 0;
    reg [7:0] write_value = 0;
    reg read_write = 0;
    reg read_end = 0;
    reg ack = 1;

    // Calculate Timeout
    always @(posedge MCLK) begin

            if (locka_rec[1] != locka_rec[0]) begin
                locka_cnt <= 8000000;
            end else begin
                if (locka_cnt != 0) locka_cnt <= locka_cnt - 1;
            end

            if (lockb_rec[1] != lockb_rec[0]) begin
                lockb_cnt <= 8000000;
            end else begin
                if (lockb_cnt != 0) lockb_cnt <= lockb_cnt - 1;
            end

            if (brip_rec[1] != brip_rec[0]) begin
                brip_cnt <= 16000000;
            end else begin
                if (brip_cnt != 0) brip_cnt <= brip_cnt - 1;
            end

            if (brin_rec[1] != brin_rec[0]) begin
                brin_cnt <= 16000000;
            end else begin
                if (brin_cnt != 0) brin_cnt <= brin_cnt - 1;
            end

            locka_rec[1] <= locka_rec[0];
            lockb_rec[1] <= lockb_rec[0];
            brip_rec[1] <= brip_rec[0];
            brin_rec[1] <= brin_rec[0];
    end

    // All components managed by MCLK
    always @(posedge MCLK) begin
        if (stable_en) begin
            scl[2] <= scl[0];
            sda[2] <= sda[0];
        end
        scl[0] <= SCL;
        scl[1] <= scl[0];
        sda[0] <= sda_in;
        sda[1] <= sda[0];
    end

    // Begin and end condition
    always @(posedge MCLK) begin
        if (sda_negedge) begin
            if (scl[0] == 1) begin
                start[0] <= !start[0];
            end
        end else if (sda_posedge) begin
            if (scl[0] == 1) begin
                stop[0] <= !stop[0];
            end
        end
    end

    always @(posedge MCLK) begin
        if (start[1] != start[0]) begin
            bit_pos <= 7;
            current_address <= 0;
            i2c_state <= `I2C_ADDRESS;
            start[1] <= start[0];
        end else if (stop[1] != stop[0]) begin
            bit_pos <= 7;
            current_address <= 0;
            i2c_state <= `I2C_IDLE;
            stop[1] <= stop[0];
        end

        // Posedge for input
        else if (scl_posedge) begin
            case (i2c_state)
                `I2C_ADDRESS: begin
                    if (bit_pos > 0) begin
                        current_address[bit_pos - 1] <= sda[0];
                        bit_pos <= bit_pos - 1;
                    end else begin
                        read_write <= sda[0];
                        if (current_address == `DEVICE_ADDRESS) begin
                            i2c_state <= `I2C_ACK_ADDR;
                            ack <= 1;
                        end else begin
                            i2c_state <= `I2C_IDLE;
                        end
                    end
                end
                `I2C_WRITE_REG: begin
                    reg_address[bit_pos] <= sda[0];
                    if (bit_pos > 0) begin
                        bit_pos <= bit_pos - 1;
                    end else begin
                        i2c_state <= `I2C_ACK_REG;
                        ack <= 1;
                    end
                end
                `I2C_WRITE_VALUE: begin
                    write_value[bit_pos] <= sda[0];
                    if (bit_pos > 0) begin
                        bit_pos <= bit_pos - 1;
                    end else begin
                        i2c_state <= `I2C_ACK_WRITE;
                        ack <= 1;
                    end
                end
            endcase
        end

        // Negedge for output
        else if (scl_negedge) begin
            case (i2c_state)
                `I2C_ACK_ADDR: begin
                    if (read_write) begin // Read
                        sda_out <= 0;
                        i2c_state <= `I2C_READ_VALUE;
                        read_end <= 0;
                        case (reg_address)
                            `I2C_REG_POWER: begin
                                read_value <= (STDBY << 1) |
                                              CHRG;
                            end
                            `I2C_REG_DISP_CTRL: begin
                                read_value <= (OUTPUT_MODE << 4) |
                                              (INTR_EDGE << 3) |
                                              (pwdn_val << 2) |
                                              (CSEL1 << 1) |
                                              CSEL2;
                            end
                            `I2C_REG_LOCK_BRI: begin
                                read_value <= ((locka_cnt != 0) << 3) |
                                              ((lockb_cnt != 0) << 2) |
                                              ((brip_cnt != 0) << 1) |
                                              (brin_cnt != 0);
                            end
                            `I2C_REG_OFFSET_1: begin
                                read_value <= OFFSET_PRIMARY;
                            end
                            `I2C_REG_OFFSET_2: begin
                                read_value <= OFFSET_SECONDARY;
                            end
                            default: begin
                                read_value <= 0;
                            end
                        endcase
                        ack <= 0;
                        bit_pos <= 7;
                    end else begin // Write
                        if (ack) begin
                            sda_out <= 0;
                            ack <= 0;
                        end else begin
                            sda_out <= 1;
                            i2c_state <= `I2C_WRITE_REG;
                            bit_pos <= 7;
                        end
                    end
                end
                `I2C_ACK_REG: begin
                    if (ack) begin
                        sda_out <= 0;
                        ack <= 0;
                    end else begin
                        sda_out <= 1;
                        i2c_state <= `I2C_WRITE_VALUE;
                        bit_pos <= 7;
                    end
                end
                `I2C_ACK_WRITE: begin
                    if (ack) begin
                        sda_out <= 0;
                        ack <= 0;
                        case (reg_address)
                            `I2C_REG_DISP_CTRL: begin
                                OUTPUT_MODE <= write_value[4];
                                INTR_EDGE <= write_value[3];
                                pwdn_val <= write_value[2];
                                CSEL1 <= write_value[1];
                                CSEL2 <= write_value[0];
                            end
                            `I2C_REG_LOCK_BRI: begin
                                if (locka_cnt == 0 && lockb_cnt == 0 &&
                                    write_value[3] != write_value[2]) begin
                                    if (write_value[3]) locka_rec[0] <= !locka_rec[0];
                                    if (write_value[2]) lockb_rec[0] <= !lockb_rec[0];
                                end
                                if (brip_cnt == 0 && brin_cnt == 0 &&
                                    write_value[1] != write_value[0]) begin
                                    if (write_value[1]) brip_rec[0] <= !brip_rec[0];
                                    if (write_value[0]) brin_rec[0] <= !brin_rec[0];
                                end
                            end
                            `I2C_REG_OFFSET_1: begin
                                OFFSET_PRIMARY <= write_value;
                            end
                            `I2C_REG_OFFSET_2: begin
                                OFFSET_SECONDARY <= write_value;
                            end
                        endcase
                    end else begin
                        sda_out <= 1;
                        i2c_state <= `I2C_WRITE_VALUE;
                        bit_pos <= 7;
                    end
                end
                `I2C_READ_VALUE: begin
                    if (read_end == 0)
                        sda_out <= read_value[bit_pos];
                    else
                        sda_out <= 1;

                    if (bit_pos > 0) begin
                        bit_pos <= bit_pos - 1;
                    end else begin
                        read_end <= 1;
                    end
                end
                default: begin
                    sda_out <= 1;
                end
            endcase
        end
    end

endmodule