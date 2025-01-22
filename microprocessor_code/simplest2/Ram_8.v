module ram_8bit_16bit_addr (
    input [15:0] address, 
    input clear,          
    output [7:0] dataout  
);

    reg [7:0] memory [0:65535];  
    integer i;

    initial begin
        memory[0] = 8'h00; 
        memory[1] = 8'h01; 
        memory[2] = 8'h82; 
        memory[3] = 8'h01; 
        memory[4] = 8'h02; 
        memory[5] = 8'h83; 
        memory[6] = 8'h02; 
        memory[7] = 8'h03; 
        memory[8] = 8'h84; 
        memory[9] = 8'h03; 
        memory[10] = 8'h04; 
        memory[11] = 8'h85; 
        // memory[0] = 8'h00; 
        // memory[1] = 8'h01; 
        // memory[2] = 8'h82; 
        // memory[3] = 8'h44; 
        // memory[4] = 8'h02;
        // memory[5] = 8'h02;
        // memory[6] = 8'h82;
        // memory[7] = 8'hFF;
        // memory[10] = 8'h00; 
        // memory[11] = 8'h02; 
        // memory[12] = 8'h80; 
        // memory[13] = 8'h01; 
        // memory[14] = 8'h02; 
        // memory[15] = 8'h81; 
        // memory[16] = 8'hC0; 
 
    end

    assign dataout = (clear) ? 8'b00000000 : memory[address]; 

    always @* begin
        if (clear) begin
            for (i = 0; i < 65536; i = i + 1) begin
                memory[i] = 8'b00000000;  
            end
        end
    end



endmodule
