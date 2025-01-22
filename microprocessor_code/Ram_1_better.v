module ram_1bit_6bit_addr_better (
    input [5:0] address, 
    input datain,        
    input clear,         
    input store,
    input clk,         
    output dataout,
    output [16:0] dataout_address_and_condition       
);

    reg memory [0:63];   
    assign dataout = (clear) ? 1'b0 : memory[address]; 
    assign dataout_address_and_condition = (clear) ? 17'b00000000000000000 : {memory[address], memory[address+1], memory[address+2], memory[address+3], memory[address+4], memory[address+5], memory[address+6], memory[address+7], memory[address+8], memory[address+9], memory[address+10], memory[address+11], memory[address+12], memory[address+13], memory[address+14], memory[address+15], memory[address+16]};
    integer i;
    initial begin
        memory[0] = 1'b1; 
        memory[1] = 1'b0; 
        memory[2] = 1'b0;
        memory[3] = 1'b0;
        memory[4] = 1'b1;
        memory[5] = 1'b0;
        memory[6] = 1'b0;
        memory[7] = 1'b0;
        memory[8] = 1'b0;
        memory[9] = 1'b0;
        memory[10] = 1'b0;
        memory[11] = 1'b0;
        memory[12] = 1'b0;
        memory[13] = 1'b0;
        memory[14] = 1'b0;
        memory[15] = 1'b0;
        memory[16] = 1'b0;
        memory[17] = 1'b1;
        memory[18] = 1'b0;
        memory[19] = 1'b1;
        memory[20] = 1'b0;

    end


   always @(posedge clk or posedge clear) begin
        if (clear) begin
            for (i = 0; i < 64; i = i + 1) begin
                memory[i] <= 1'b0; 
            end
        end else if (store) begin
            memory[address] <= datain;
        end
        $display("At time %0t, data =  %h, %h, %h", $time, memory[0],memory[1],memory[2]);
    end

endmodule
