module ram_1bit_6bit_addr_better_big (
    input [13:0] address0,
    input [13:0] address1,
    input [13:0] address2,
    input [13:0] address3,
    input datain0, 
    input datain1, 
    input datain2, 
    input datain3,        
    input clear,         
    input store0,
    input store1,
    input store2,
    input store3,
    input clk,         
    output dataout0,
    output [16:0] dataout_address_and_condition0,
    output dataout1,
    output [16:0] dataout_address_and_condition1, 
    output dataout2,
    output [16:0] dataout_address_and_condition2, 
    output dataout3,
    output [16:0] dataout_address_and_condition3       
);

    reg memory [0:16383];   
    assign dataout0 = (clear) ? 1'b0 : memory[address0]; 
    assign dataout_address_and_condition0 = (clear) ? 17'b00000000000000000 : {memory[address0], memory[address0+1], memory[address0+2], memory[address0+3], memory[address0+4], memory[address0+5], memory[address0+6], memory[address0+7], memory[address0+8], memory[address0+9], memory[address0+10], memory[address0+11], memory[address0+12], memory[address0+13], memory[address0+14], memory[address0+15], memory[address0+16]};
    assign dataout1 = (clear) ? 1'b0 : memory[address1]; 
    assign dataout_address_and_condition1 = (clear) ? 17'b00000000000000000 : {memory[address1], memory[address1+1], memory[address1+2], memory[address1+3], memory[address1+4], memory[address1+5], memory[address1+6], memory[address1+7], memory[address1+8], memory[address1+9], memory[address1+10], memory[address1+11], memory[address1+12], memory[address1+13], memory[address1+14], memory[address1+15], memory[address1+16]};
    assign dataout2 = (clear) ? 1'b0 : memory[address2]; 
    assign dataout_address_and_condition2 = (clear) ? 17'b00000000000000000 : {memory[address2], memory[address2+1], memory[address2+2], memory[address2+3], memory[address2+4], memory[address2+5], memory[address2+6], memory[address2+7], memory[address2+8], memory[address2+9], memory[address2+10], memory[address2+11], memory[address2+12], memory[address2+13], memory[address2+14], memory[address2+15], memory[address2+16]};
    assign dataout3 = (clear) ? 1'b0 : memory[address3]; 
    assign dataout_address_and_condition3 = (clear) ? 17'b00000000000000000 : {memory[address3], memory[address3+1], memory[address3+2], memory[address3+3], memory[address3+4], memory[address3+5], memory[address3+6], memory[address3+7], memory[address3+8], memory[address3+9], memory[address3+10], memory[address3+11], memory[address3+12], memory[address3+13], memory[address3+14], memory[address3+15], memory[address3+16]};

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
        if (store0) begin
            memory[address0] <= datain0;
        end
        
        if (store1) begin
            memory[address1] <= datain1;
        end 
        if (store2) begin
            memory[address2] <= datain2;
        end 
        if (store3) begin
            memory[address3] <= datain3;
        end 
        
   

        $display("At time %0t, data =  %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h", $time, memory[0],memory[1],memory[2], memory[3], memory[4],memory[5],memory[6], memory[7], memory[8], memory[9], memory[10], memory[11]);
    end

endmodule
