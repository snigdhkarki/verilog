module ram_8bit_16bit_addr_big #( 
    parameter NUM_PORTS = 4,  
    parameter integer n = 4
)(
    input [15:0] address[0:NUM_PORTS-1], 
    input clear,          
    output [15:0] dataout[0:NUM_PORTS-1]
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
        memory[0] = 16'h0000; 
        memory[1] = 16'h0001; 
        memory[2] = 16'h8002; 
        memory[3] = 16'h0003; 
        memory[4] = 16'h0004; 
        memory[5] = 16'h8005; 
        memory[6] = 16'h0006; 
        memory[7] = 16'h0007; 
        memory[8] = 16'h8008; 
        memory[9] = 16'h0009; 
        memory[10] = 16'h000A; 
        memory[11] = 16'h800B; 


    end

    genvar i1;
    generate
        for (i1 = 0; i1 < n; i1 = i1 + 1) begin : dataout_loop1
            assign dataout[i1] = (clear) ? 16'b0000000000000000 : memory[address[i1]];
        
        end
    endgenerate   
 
    always @* begin
        if (clear) begin
            for (i = 0; i < 65536; i = i + 1) begin
                memory[i] = 16'b0000000000000000;  
            end
        end
    end

    always @(posedge address[0]) begin
        for (i = 0; i < n; i = i + 1) begin
            if(memory[address[i]] == 16'b1111111111111111) begin 
                $display("halt0");
            end
        end
    end

endmodule
