`timescale 1ns/1ps

module simplest2(
    input clk,
    input preset,
    input counter_ram8_reset,
    output accumulator_output
);
    
    wire d, p_out, nand_out, mux_out;
    wire [15:0] count_out;
    wire [7:0] ram8_out;
    reg preset_flipflop_input;
    reg accumulator_flipflop_preset;
    reg ram8_clear;
    reg ram1_clear;
    initial begin
        preset_flipflop_input = 1'b0;
        accumulator_flipflop_preset = 1'b0;
        ram8_clear = 1'b0;
        ram1_clear = 1'b0;
    end
    d_flipflop preset_flipflop (
        .datain(preset_flipflop_input),
        .clk(clk),
        .preset((ram8_out[7] | preset)),
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
    counter_4bit counter_ram8 (
        .clk(clk),
        .reset(counter_ram8_reset),
        .count(count_out)
    );
    ram_8bit_16bit_addr ram8 (
        .address(count_out),
        .clear(ram8_clear),
        .dataout(ram8_out)
    );
    ram_1bit_6bit_addr ram1 (
        .address({ram8_out[5],ram8_out[4],ram8_out[3],ram8_out[2],ram8_out[1],ram8_out[0]}),
        .datain(accumulator_output),
        .clear(ram1_clear),
        .store(ram8_out[7]),
        .clk(clk),
        .dataout(d)
    );

endmodule