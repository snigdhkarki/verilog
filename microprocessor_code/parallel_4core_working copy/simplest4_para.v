`timescale 1ns/1ps

module simplest4_para(
    input clk,
    input preset,
    input counter_ram8_reset,
    output accumulator_output0,
    output accumulator_output1,
    output accumulator_output2,
    output accumulator_output3
);
    reg ram8_clear;
    reg ram1_clear;
    wire [15:0] ram8_out0;
    wire [15:0] ram8_out1;
    wire [15:0] ram8_out2;
    wire [15:0] ram8_out3; 
    wire [16:0] dataout_address_and_condition0;
    wire [16:0] dataout_address_and_condition1;
    wire [16:0] dataout_address_and_condition2;
    wire [16:0] dataout_address_and_condition3;
    wire [15:0] count_out0;
    wire [15:0] count_out1;
    wire [15:0] count_out2;
    wire [15:0] count_out3;
    wire [15:0] stack_out0;
    wire [15:0] stack_out1;
    wire [15:0] stack_out2;
    wire [15:0] stack_out3;



    initial begin
        ram8_clear = 1'b0;
        ram1_clear = 1'b0;
    end
    
    counter_16bit_better_big counter_ram8_0 (
        .clk(clk),
        .reset(counter_ram8_reset),
        .datain((ram8_out0[14] & ram8_out0[15]) ? stack_out0 : 
        (ram8_out0[14] & ~ram8_out0[15]) ? ({dataout_address_and_condition0[15], dataout_address_and_condition0[14], dataout_address_and_condition0[13], dataout_address_and_condition0[12], dataout_address_and_condition0[11], dataout_address_and_condition0[10], dataout_address_and_condition0[9], dataout_address_and_condition0[8], dataout_address_and_condition0[7], dataout_address_and_condition0[6], dataout_address_and_condition0[5], dataout_address_and_condition0[4], dataout_address_and_condition0[3], dataout_address_and_condition0[2], dataout_address_and_condition0[1], dataout_address_and_condition0[0]}):16'b0),
        .load(ram8_out0[14]),
        .initial_value(16'h00),
        .dataout(count_out0)
    );
    counter_16bit_better_big counter_ram8_1 (
        .clk(clk),
        .reset(counter_ram8_reset),
        .datain((ram8_out1[14] & ram8_out1[15]) ? stack_out1 : 
        (ram8_out1[14] & ~ram8_out1[15]) ? ({dataout_address_and_condition1[15], dataout_address_and_condition1[14], dataout_address_and_condition1[13], dataout_address_and_condition1[12], dataout_address_and_condition1[11], dataout_address_and_condition1[10], dataout_address_and_condition1[9], dataout_address_and_condition1[8], dataout_address_and_condition1[7], dataout_address_and_condition1[6], dataout_address_and_condition1[5], dataout_address_and_condition1[4], dataout_address_and_condition1[3], dataout_address_and_condition1[2], dataout_address_and_condition1[1], dataout_address_and_condition1[0]}):16'b0),
        .load(ram8_out1[14]),
        .initial_value(16'h06),
        .dataout(count_out1)
    );
    counter_16bit_better_big counter_ram8_2 (
        .clk(clk),
        .reset(counter_ram8_reset),
        .datain((ram8_out2[14] & ram8_out2[15]) ? stack_out2 : 
        (ram8_out2[14] & ~ram8_out2[15]) ? ({dataout_address_and_condition2[15], dataout_address_and_condition2[14], dataout_address_and_condition2[13], dataout_address_and_condition2[12], dataout_address_and_condition2[11], dataout_address_and_condition2[10], dataout_address_and_condition2[9], dataout_address_and_condition2[8], dataout_address_and_condition2[7], dataout_address_and_condition2[6], dataout_address_and_condition2[5], dataout_address_and_condition2[4], dataout_address_and_condition2[3], dataout_address_and_condition2[2], dataout_address_and_condition2[1], dataout_address_and_condition2[0]}):16'b0),
        .load(ram8_out2[14]),
        .initial_value(16'h0C),
        .dataout(count_out2)
    );
    counter_16bit_better_big counter_ram8_3 (
        .clk(clk),
        .reset(counter_ram8_reset),
        .datain((ram8_out3[14] & ram8_out3[15]) ? stack_out3 : 
        (ram8_out3[14] & ~ram8_out3[15]) ? ({dataout_address_and_condition3[15], dataout_address_and_condition3[14], dataout_address_and_condition3[13], dataout_address_and_condition3[12], dataout_address_and_condition3[11], dataout_address_and_condition3[10], dataout_address_and_condition3[9], dataout_address_and_condition3[8], dataout_address_and_condition3[7], dataout_address_and_condition3[6], dataout_address_and_condition3[5], dataout_address_and_condition3[4], dataout_address_and_condition3[3], dataout_address_and_condition3[2], dataout_address_and_condition3[1], dataout_address_and_condition3[0]}):16'b0),
        .load(ram8_out3[14]),
        .initial_value(16'h12),
        .dataout(count_out3)
    );
 
    ram_8bit_16bit_addr_big ram8 (
        .address0(count_out0),
        .address1(count_out1),
        .address2(count_out2),
        .address3(count_out3),
        .clear(ram8_clear),
        .dataout0(ram8_out0),
        .dataout1(ram8_out1),
        .dataout2(ram8_out2),
        .dataout3(ram8_out3)
    );

    ram_1bit_6bit_addr_better_big ram1 (
        .address0({ram8_out0[13],ram8_out0[12],ram8_out0[11],ram8_out0[10],ram8_out0[9],ram8_out0[8],ram8_out0[7],ram8_out0[6], ram8_out0[5],ram8_out0[4],ram8_out0[3],ram8_out0[2],ram8_out0[1],ram8_out0[0]}),
        .address1({ram8_out1[13],ram8_out1[12],ram8_out1[11],ram8_out1[10],ram8_out1[9],ram8_out1[8],ram8_out1[7],ram8_out1[6], ram8_out1[5],ram8_out1[4],ram8_out1[3],ram8_out1[2],ram8_out1[1],ram8_out1[0]}),
        .address2({ram8_out2[13],ram8_out2[12],ram8_out2[11],ram8_out2[10],ram8_out2[9],ram8_out2[8],ram8_out2[7],ram8_out2[6], ram8_out2[5],ram8_out2[4],ram8_out2[3],ram8_out2[2],ram8_out2[1],ram8_out2[0]}),
        .address3({ram8_out3[13],ram8_out3[12],ram8_out3[11],ram8_out3[10],ram8_out3[9],ram8_out3[8],ram8_out3[7],ram8_out3[6], ram8_out3[5],ram8_out3[4],ram8_out3[3],ram8_out3[2],ram8_out3[1],ram8_out3[0]}),
        .datain0(accumulator_output0),
        .datain1(accumulator_output1),
        .datain2(accumulator_output2),
        .datain3(accumulator_output3),
        .clear(ram1_clear),
        .store0(ram8_out0[15]),
        .store1(ram8_out1[15]),
        .store2(ram8_out2[15]),
        .store3(ram8_out3[15]),
        .clk(clk),
        .dataout0(d0),
        .dataout_address_and_condition0(dataout_address_and_condition0),
        .dataout1(d1),
        .dataout_address_and_condition1(dataout_address_and_condition1),
        .dataout2(d2),
        .dataout_address_and_condition2(dataout_address_and_condition2),
        .dataout3(d3),
        .dataout_address_and_condition3(dataout_address_and_condition3)
    );
    simplest4 core0 (
        .clk(clk),
        .preset(preset),
        .accumulator_output0(accumulator_output0),
        .accumulator_output1(accumulator_output1),
        .accumulator_output2(accumulator_output2),
        .accumulator_output3(accumulator_output3),
        .count_out(count_out0),
        .ram8_out(ram8_out0),
        .d(d0),
        .dataout_address_and_condition(dataout_address_and_condition0),
        .stack_out(stack_out0),
        .accumulator_output(accumulator_output0)
    );
    simplest4 core1 (
        .clk(clk),
        .preset(preset),
        .accumulator_output0(accumulator_output0),
        .accumulator_output1(accumulator_output1),
        .accumulator_output2(accumulator_output2),
        .accumulator_output3(accumulator_output3),
        .count_out(count_out1),
        .ram8_out(ram8_out1),
        .d(d1),
        .dataout_address_and_condition(dataout_address_and_condition1),
        .stack_out(stack_out1),
        .accumulator_output(accumulator_output1)
    );
    simplest4 core2 (
        .clk(clk),
        .preset(preset),
        .accumulator_output0(accumulator_output0),
        .accumulator_output1(accumulator_output1),
        .accumulator_output2(accumulator_output2),
        .accumulator_output3(accumulator_output3),
        .count_out(count_out2),
        .ram8_out(ram8_out2),
        .d(d2),
        .dataout_address_and_condition(dataout_address_and_condition2),
        .stack_out(stack_out2),
        .accumulator_output(accumulator_output2)
    );
    simplest4 core3 (
        .clk(clk),
        .preset(preset),
        .accumulator_output0(accumulator_output0),
        .accumulator_output1(accumulator_output1),
        .accumulator_output2(accumulator_output2),
        .accumulator_output3(accumulator_output3),
        .count_out(count_out3),
        .ram8_out(ram8_out3),
        .d(d3),
        .dataout_address_and_condition(dataout_address_and_condition3),
        .stack_out(stack_out3),
        .accumulator_output(accumulator_output3)
    );

endmodule 