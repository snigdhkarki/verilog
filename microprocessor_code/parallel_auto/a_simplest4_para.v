`timescale 1ns/1ps

module simplest4_para#( 
    parameter NUM_PORTS = 4,  
    parameter integer n = 4
)(

    input clk,
    input preset,
    input counter_ram8_reset,
    output accumulator_output[0:NUM_PORTS-1]
);
    reg ram8_clear;
    reg ram1_clear;
    reg [15:0] counter_initial[0:NUM_PORTS-1];
    wire [15:0] ram8_out[0:NUM_PORTS-1];
    wire [16:0] dataout_address_and_condition[0:NUM_PORTS-1];
    wire [15:0] count_out[0:NUM_PORTS-1];
    wire [15:0] stack_out[0:NUM_PORTS-1];
    wire [3:0] d;

    initial begin
        ram8_clear = 1'b0;
        ram1_clear = 1'b0;
        counter_initial[0] = 16'h00;
        counter_initial[1] = 16'h03;
        counter_initial[2] = 16'h06;
        counter_initial[3] = 16'h09;
    end

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : counter_ram8_loop
            counter_16bit_better_big counter_ram8 (
                .clk(clk),
                .reset(counter_ram8_reset),
                .datain((ram8_out[i][14] & ram8_out[i][15]) ? stack_out[i] : 
                        (ram8_out[i][14] & ~ram8_out[i][15]) ? 
                        ({dataout_address_and_condition[i][15], dataout_address_and_condition[i][14], dataout_address_and_condition[i][13], 
                        dataout_address_and_condition[i][12], dataout_address_and_condition[i][11], dataout_address_and_condition[i][10], 
                        dataout_address_and_condition[i][9], dataout_address_and_condition[i][8], dataout_address_and_condition[i][7], 
                        dataout_address_and_condition[i][6], dataout_address_and_condition[i][5], dataout_address_and_condition[i][4], 
                        dataout_address_and_condition[i][3], dataout_address_and_condition[i][2], dataout_address_and_condition[i][1], 
                        dataout_address_and_condition[i][0]}):16'b0),
                .load(ram8_out[i][14]),
                .initial_value(counter_initial[i]),
                .dataout(count_out[i])
            );
        end
    endgenerate


    ram_8bit_16bit_addr_big ram8 (
        .address(count_out),
        .clear(ram8_clear),
        .dataout(ram8_out)
    );

    ram_1bit_6bit_addr_better_big ram1 (
        .address({ram8_out[13],ram8_out[12],ram8_out[11],ram8_out[10],ram8_out[9],ram8_out[8],ram8_out[7],ram8_out[6], ram8_out[5],ram8_out[4],ram8_out[3],ram8_out[2],ram8_out[1],ram8_out[0]}),
        .datain(accumulator_output),
        .clear(ram1_clear),
        .store(ram8_out[15]),
        .clk(clk),
        .dataout(d),
        .dataout_address_and_condition(dataout_address_and_condition)
    );

    genvar i1;
        generate
            for (i1 = 0; i1 < n; i1 = i1 + 1) begin : core_loop
                simplest4 core (
                    .clk(clk),
                    .preset(preset),
                    .count_out(count_out[i1]),
                    .ram8_out(ram8_out[i1]),
                    .d(d[i1]),
                    .dataout_address_and_condition(dataout_address_and_condition[i1]),
                    .stack_out(stack_out[i1]),
                    .accumulator_output(accumulator_output[i1])
                );
            end
        endgenerate
endmodule 