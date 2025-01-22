`timescale 1ns/1ps

module simplest(
    input d,
    input clk,
    input preset,
    output accumulator_output
);
    
    wire p_out, nand_out, mux_out;
    reg preset_flipflop_input;
    reg accumulator_flipflop_preset;
    initial begin
        preset_flipflop_input = 1'b0;
        accumulator_flipflop_preset = 1'b0;
    end
    d_flipflop preset_flipflop (
        .datain(preset_flipflop_input),
        .clk(clk),
        .preset(preset),
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


endmodule