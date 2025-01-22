module ram_1bit_6bit_addr_better_big #( 
    parameter NUM_PORTS = 4,  
    parameter integer n = 4
)(
    input [13:0] address[0:NUM_PORTS-1],
    input datain[0:NUM_PORTS-1], 
    input clear,         
    input store[0:NUM_PORTS-1],
    input clk,         
    output dataout[0:NUM_PORTS-1],
    output [16:0] dataout_address_and_condition[0:NUM_PORTS-1]
);

    reg memory [0:16383];

    genvar i1;
    generate
        for (i1 = 0; i1 < n; i1 = i1 + 1) begin : dataout_loop
            assign dataout[i1] = (clear) ? 1'b0 : memory[address[i1]]; 
            assign dataout_address_and_condition[i1] = (clear) ? 17'b00000000000000000 : 
                {memory[address[i1]], memory[address[i1]+1], memory[address[i1]+2], memory[address[i1]+3], memory[address[i1]+4], 
                memory[address[i1]+5], memory[address[i1]+6], memory[address[i1]+7], memory[address[i1]+8], memory[address[i1]+9], 
                memory[address[i1]+10], memory[address[i1]+11], memory[address[i1]+12], memory[address[i1]+13], memory[address[i1]+14], 
                memory[address[i1]+15], memory[address[i1]+16]};
        end
    endgenerate   
    integer i;
    initial begin
        memory[0] = 1'b0; 
        memory[1] = 1'b1; 
        memory[2] = 1'b0;
        memory[3] = 1'b1;
        memory[4] = 1'b0;
        memory[5] = 1'b0;
        memory[6] = 1'b1;
        memory[7] = 1'b1;
        memory[8] = 1'b1;
        memory[9] = 1'b0;
        memory[10] = 1'b0;
        memory[11] = 1'b0;
    end


   always @(posedge clk or posedge clear) begin
        if (clear) begin
            for (i = 0; i < 16384; i = i + 1) begin
                memory[i] <= 1'b0; 
            end
        end
        for (i = 0; i < n; i = i + 1) begin
            if (store[i]) begin
                memory[address[i]] <= datain[i];
            end
        end

        $display("At time %0t, data =  %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h", $time, memory[0],memory[1],memory[2], memory[3], memory[4],memory[5],memory[6], memory[7], memory[8], memory[9], memory[10], memory[11]);
    end

endmodule
