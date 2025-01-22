module ram_1bit_6bit_addr (
    input [5:0] address, 
    input datain,        
    input clear,         
    input store,
    input clk,         
    output dataout       
);

    reg memory [0:63];   
    assign dataout = (clear) ? 1'b0 : memory[address]; 
    integer i;
    initial begin
        memory[0] = 1'b1; 
        memory[1] = 1'b0; 
        memory[2] = 1'b0;
        memory[3] = 1'b0;
        memory[4] = 1'b0;
        memory[5] = 1'b0;

    end


   always @(posedge clk or posedge clear) begin
        if (clear) begin
            for (i = 0; i < 64; i = i + 1) begin
                memory[i] <= 1'b0; 
            end
        end else if (store) begin
            memory[address] <= datain;
        end
        $display("At time %0t, data =  %h, %h, %h, %h, %h, %h", $time, memory[0],memory[1],memory[2],memory[3],memory[4],memory[5]);
    end

endmodule
