module ram_8bit_16bit_addr_big (
    input [15:0] address0, 
    input [15:0] address1,
    input [15:0] address2,
    input [15:0] address3,
    input clear,          
    output [15:0] dataout0,
    output [15:0] dataout1, 
    output [15:0] dataout2, 
    output [15:0] dataout3   
);

    reg [15:0] memory [0:65535];  
    integer i;

    initial begin
    //     memory[0] = 8'h00; 
    //     memory[1] = 8'h01; 
    //     memory[2] = 8'h82; 
    //     memory[3] = 8'h01; 
    //     memory[4] = 8'h02; 
    //     memory[5] = 8'h83; 
    //     memory[6] = 8'h02; 
    //     memory[7] = 8'h03; 
    //     memory[8] = 8'h84; 
    //     memory[9] = 8'h03; 
    //     memory[10] = 8'h04; 
    //     memory[11] = 8'h85; 
        // memory[0] = 16'h0000; 
        // memory[1] = 16'h0001; 
        // memory[2] = 16'h8002; 
        // memory[3] = 16'h0003; 
        // memory[4] = 16'h0004; 
        // memory[5] = 16'h8005; 
        // memory[6] = 16'h0006; 
        // memory[7] = 16'h0007; 
        // memory[8] = 16'h8008; 
        // memory[9] = 16'h0009; 
        // memory[10] = 16'h000A; 
        // memory[11] = 16'h800B; 
        memory[0] = 16'h0000;
        memory[1] = 16'h0001;
        memory[2] = 16'h0002;
        memory[3] = 16'h2002; //nand with second core
        memory[4] = 16'h2004; //nand with third core
        memory[5] = 16'h800A;

        memory[6] = 16'h0003;
        memory[7] = 16'h0004;
        memory[8] = 16'h800B; 
        memory[9] = 16'h2010; //nop
        memory[10] = 16'h2010; //nop
        memory[11] = 16'h2010; //nop

        memory[12] = 16'h0005;
        memory[13] = 16'h0006;
        memory[14] = 16'h2004; //nand with third core (itself)
        memory[15] = 16'h2008; //nand with fourth core
        memory[16] = 16'h800C;
        memory[17] = 16'h2010; //nop
        
        memory[18] = 16'h0007;
        memory[19] = 16'h0008;
        memory[20] = 16'h0009;
        memory[21] = 16'h800D;
        memory[22] = 16'h2010; //nop
        memory[23] = 16'h2010; //nop




    end

    assign dataout0 = (clear) ? 16'b0000000000000000 : memory[address0]; 
    assign dataout1 = (clear) ? 16'b0000000000000000 : memory[address1]; 
    assign dataout2 = (clear) ? 16'b0000000000000000 : memory[address2]; 
    assign dataout3 = (clear) ? 16'b0000000000000000 : memory[address3]; 

    always @* begin
        if (clear) begin
            for (i = 0; i < 65536; i = i + 1) begin
                memory[i] = 16'b0000000000000000;  
            end
        end
    end

    always @(posedge address0[0]) begin
        if (memory[address0] == 16'b1111111111111111) begin 
            $display("halt0");          
        end
        if (memory[address1] == 16'b1111111111111111) begin 
            $display("halt1");          
        end
        if (memory[address2] == 16'b1111111111111111) begin 
            $display("halt2");          
        end
        if (memory[address3] == 16'b1111111111111111) begin 
            $display("halt3");          
        end
    end

endmodule
