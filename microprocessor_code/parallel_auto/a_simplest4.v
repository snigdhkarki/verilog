`timescale 1ns/1ps

module simplest4(
    input clk,
    input preset,
    input [15:0] count_out,
    input [15:0] ram8_out,
    input d,
    input [16:0] dataout_address_and_condition,
    // input counter_ram8_reset,
    output [15:0] stack_out,
    output accumulator_output
);
    
    wire p_out, nand_out, mux_out;
    // wire [15:0] stack_out;
    // wire [15:0] count_out;
    // wire [15:0] ram8_out;
    // wire [16:0] dataout_address_and_condition;
    reg preset_flipflop_input;
    reg accumulator_flipflop_preset;
    // reg ram8_clear;
    // reg ram1_clear;
    initial begin
        preset_flipflop_input = 1'b0;
        accumulator_flipflop_preset = 1'b0;
        // ram8_clear = 1'b0;
        // ram1_clear = 1'b0;
    end
    d_flipflop preset_flipflop (
        .datain(preset_flipflop_input),
        .clk(clk),
        .preset((ram8_out[15] | ram8_out[14] | preset)),
        .q(p_out)
    );
    d_flipflop accumulator_flipflop (
        .datain(mux_out),
        .clk(clk),
        .preset(accumulator_flipflop_preset),
        .q(accumulator_output)
    );
    mux_2to1 mux (
        .A(~(d & accumulator_output)),
        .B(d),
        .Sel(p_out),
        .Y(mux_out)
    );
    // counter_16bit_better counter_ram8 (
    //     .clk(clk),
    //     .reset(counter_ram8_reset),
    //     .datain((ram8_out[14] & ram8_out[15]) ? stack_out : 
    //     (ram8_out[14] & ~ram8_out[15]) ? ({dataout_address_and_condition[15], dataout_address_and_condition[14], dataout_address_and_condition[13], dataout_address_and_condition[12], dataout_address_and_condition[11], dataout_address_and_condition[10], dataout_address_and_condition[9], dataout_address_and_condition[8], dataout_address_and_condition[7], dataout_address_and_condition[6], dataout_address_and_condition[5], dataout_address_and_condition[4], dataout_address_and_condition[3], dataout_address_and_condition[2], dataout_address_and_condition[1], dataout_address_and_condition[0]}):16'b0),
    //     .load(ram8_out[14]),
    //     .dataout(count_out)
    // );
    // ram_8bit_16bit_addr ram8 (
    //     .address(count_out),
    //     .clear(ram8_clear),
    //     .dataout(ram8_out)
    // );
    // ram_1bit_6bit_addr_better ram1 (
    //     .address({ram8_out[13],ram8_out[12],ram8_out[11],ram8_out[10],ram8_out[9],ram8_out[8],ram8_out[7],ram8_out[6], ram8_out[5],ram8_out[4],ram8_out[3],ram8_out[2],ram8_out[1],ram8_out[0]}),
    //     .datain(accumulator_output),
    //     .clear(ram1_clear),
    //     .store(ram8_out[15]),
    //     .clk(clk),
    //     .dataout(d),
    //     .dataout_address_and_condition(dataout_address_and_condition)
    // );
    stack stack_jump (
        .datain({15'b0, dataout_address_and_condition[16]}+count_out),
        .clk(clk),
        .push(ram8_out[14] & ~ram8_out[15]),
        .pop(ram8_out[14] & ram8_out[15]),
        .dataout(stack_out)

    );

endmodule