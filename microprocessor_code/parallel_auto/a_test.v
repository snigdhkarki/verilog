// module tb_mux_2to1;
//     reg A, B, Sel;         // Declare inputs as reg
//     wire Y;           

//     mux_2to1 uut (
//         .A(A),
//         .B(B),
//         .Sel(Sel),
//         .Y(Y)
//     );
//     integer i; 

//     initial begin
//         $monitor("Time=%0t A=%b B=%b Sel=%b Y=%b", $time, A, B, Sel, Y);
//         for (i = 0; i < 8; i = i + 1) begin
//             {A, B, Sel} = i;  // Assign i(3 bit number) to A, B, and Sel
//             #10;              // Wait for 10 time units
//         end
//         $finish;
//     end
// endmodule

// `timescale 1ns / 1ps

// module d_flipflop_tb;
//     reg datain;
//     reg clk;
//     reg preset;
//     wire q;

//     d_flipflop uut (
//         .datain(datain),
//         .clk(clk),
//         .preset(preset),
//         .q(q)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         $dumpfile("d_flipflop.vcd");  
//         $dumpvars(0, d_flipflop_tb); //look at all variables

//         clk = 0;
//         datain = 0;
//         preset = 0;

//         #10 preset = 1; 
//         #10 preset = 0; 
        
//         #10 datain = 1;  
//         #10;             
//         #10 datain = 0;  
//         #10;             

//         #20 $finish;
//     end
// endmodule

// module counter_4bit_tb;

//     reg clk;  
//     reg reset;
//     wire [15:0] count; 

//     counter_4bit uut (
//         .clk(clk),
//         .reset(reset),
//         .count(count)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         clk = 0;
//         reset = 0;

//         $monitor("Time: %0t, count: %d, reset: %b", $time, count, reset);

//         #5 reset = 1;  
//         #10 reset = 0; 

//         #50; 

//         #10 reset = 1;   
//         #10 reset = 0;   

//         #50;

//         #10 $finish;
//     end

// endmodule

// `timescale 1ns/1ps

// module ram_8bit_16bit_addr_tb;

//     reg [15:0] address;
//     reg clear;
//     wire [7:0] dataout;

//     ram_8bit_16bit_addr uut (
//         .address(address),
//         .clear(clear),
//         .dataout(dataout)
//     );

//     initial begin
//         $dumpfile("ram_8bit_16bit_addr.vcd");
//         $dumpvars(0, ram_8bit_16bit_addr_tb);

//         clear = 0;
//         address = 16'h0000;

//         #10 address = 16'h0001;
//         #10 address = 16'h0002;

//         #10 clear = 1;   
//         #10 clear = 0;   
//         #10 address = 16'h0001;
//         #10 address = 16'h0002;

//         #10 address = 16'hFFFF;

//         #50 $finish;
//     end

// endmodule

// `timescale 1ns/1ps

// module ram_1bit_6bit_addr_tb;

//     reg [5:0] address;
//     reg datain;
//     reg clear;
//     reg clk;
//     reg store;

//     wire dataout;

//     ram_1bit_6bit_addr uut (
//         .address(address),
//         .datain(datain),
//         .clear(clear),
//         .clk(clk),
//         .store(store),
//         .dataout(dataout)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         $dumpfile("ram_1bit_6bit_addr.vcd");
//         $dumpvars(0, ram_1bit_6bit_addr_tb);

//         clk = 0;
//         clear = 0;
//         store = 0;
//         address = 6'b000000;
//         datain = 0;

//         #10 clear = 1;     
//         #10 clear = 0;     
//         #10 store = 1; datain = 1; address = 6'b000001;
//         #10 store = 1; datain = 0; address = 6'b000010;
//         #10 store = 0; address = 6'b000001;            
//         #10 address = 6'b000010;                       
//         #10 address = 6'b000000;

//         #20 $finish;
//     end

// endmodule


// `timescale 1ns/1ps

// module simplest_tb;

//     reg d;
//     reg clk;
//     reg preset;

//     wire accumulator_output;

//     simplest uut (
//         .d(d),
//         .clk(clk),
//         .preset(preset),
//         .accumulator_output(accumulator_output)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         $dumpfile("main.vcd");
//         $dumpvars(0, main_tb);

//         d=1;
//         clk=0;
//         preset=0;
//         #2
//         preset=1;
//         #1 
//         preset=0;
//         #7
//         d=0;
//         #10
//         d=1;
//         #10
//         d=1;
//         #10
//         d=0;
//         #10
//         d=1;
//         #10
//         d=1;
//         #10
//         d=1;
//         #10
//         d=0;
//         #10
//         d=0;
//         #10
//         d=1;
//         #10
//         d=0;
//         #10
//         preset=1;
//         d=0;
//         #10
//         d=1;
//         preset=0;
//         #10
//         d=0;
//         #10
//         d=1;
//         #10
//         d=1;
//         #20 $finish;
//     end

// endmodule

// `timescale 1ns/1ps

// module simplest2_tb;

//     reg clk;
//     reg preset;
//     reg counter_ram8_reset;

//     wire accumulator_output;

//     simplest2 uut (
//         .clk(clk),
//         .preset(preset),
//         .counter_ram8_reset(counter_ram8_reset),
//         .accumulator_output(accumulator_output)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         $dumpfile("simplest2.vcd");
//         $dumpvars(0, simplest2_tb);

//         clk=0;
//         preset=0;
//         counter_ram8_reset=0;
//         #1
//         preset=1;
//         counter_ram8_reset=1;
//         #2
//         preset=0;
//         counter_ram8_reset=0;
//         #2
//         #120
//         $finish;

//     end

// endmodule

// module stack_tb;

//     reg [15:0] datain;
//     reg clk;
//     reg push, pop;
//     wire [15:0] dataout;

//     stack uut (
//         .datain(datain),
//         .clk(clk),
//         .push(push),
//         .pop(pop),
//         .dataout(dataout)
//     );
//     always #5 clk = ~clk;

//     initial begin
//         clk = 0;
//     end

//     initial begin
//         $dumpfile("stack.vcd");
//         $dumpvars(0, stack_tb);

//         datain = 0;
//         push = 0;
//         pop = 0;

//         #10 datain = 16'hAAAA; push = 1; #10 push = 0;
//         #10 datain = 16'hBBBB; push = 1; #10 push = 0;
//         #10 datain = 16'hCCCC; push = 1; #10 push = 0;

//         #10 pop = 1; #10 pop = 0;
//         #10 pop = 1; #10 pop = 0;
//         #10 pop = 1; #10 pop = 0;


//         $finish;
//     end
// endmodule

// module counter_16bit_tb;

//     reg clk;
//     reg reset;
//     reg load;
//     reg [15:0] datain;
//     wire [15:0] dataout;

//     counter_16bit uut (
//         .clk(clk),
//         .reset(reset),
//         .datain(datain),
//         .load(load),
//         .dataout(dataout)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         $dumpfile("counter_better.vcd");
//         $dumpvars(0, counter_16bit_tb);


//         clk = 0;
//         reset = 0;
//         load = 0;
//         datain = 16'b0000000000000000;

//         #10 reset = 1;
//         #10 reset = 0;

//         #10 load = 1; datain = 16'h1234;
//         #10 load = 0;                   

//         #50;                            

//         #10 load = 1; datain = 16'h1567;
//         #10 load = 0;                   

//         #50;                            


//         #10 reset = 1;                  
//         #10 reset = 0;

//         #50 $finish;                    
//     end

// endmodule

// `timescale 1ns/1ps

// module simplest3_tb;

//     reg clk;
//     reg preset;
//     reg counter_ram8_reset;

//     wire accumulator_output;

//     simplest3 uut (
//         .clk(clk),
//         .preset(preset),
//         .counter_ram8_reset(counter_ram8_reset),
//         .accumulator_output(accumulator_output)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         $dumpfile("simplest3.vcd");
//         $dumpvars(0, simplest3_tb);

//         clk=0;
//         preset=0;
//         counter_ram8_reset=0;
//         #1
//         preset=1;
//         counter_ram8_reset=1;
//         #2
//         preset=0;
//         counter_ram8_reset=0;
//         #2
//         #800
//         $finish;

//     end

// endmodule

`timescale 1ns/1ps

module simplest4_para_tb;

    reg clk;
    reg preset;
    reg counter_ram8_reset;
// change the value of 3 to n-1
    wire accumulator_output[3:0];

    simplest4_para uut (
        .clk(clk),
        .preset(preset),
        .counter_ram8_reset(counter_ram8_reset),
        .accumulator_output(accumulator_output)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("simplest4_para.vcd");
        $dumpvars(0, simplest4_para_tb);

        clk=0;
        preset=0;
        #1
        preset=1;
        #2
        preset=0;
        #2
        #35
        $finish;

    end

endmodule

