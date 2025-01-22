module stack (
    input [15:0] datain,
    input clk,          
    input push,         
    input pop,          
    output reg [15:0] dataout
);

    reg [15:0] stack_mem [0:31];
    reg [4:0] sp;               

    initial begin
        sp = 0; 
    end

    always @(posedge clk) begin
        if (push) begin
            if (sp < 32) begin
                stack_mem[sp] <= datain;
                sp <= sp + 1;           
            end
        end
    end

    always @(posedge clk) begin
        if (pop && sp > 0) begin
            sp <= sp - 1; 
        end
    end

    always @* begin
        if (pop) begin
            if (sp > 0) begin
                dataout = stack_mem[sp - 1]; 
            end else begin
                dataout = 16'b0;
            end
        end else begin
            dataout = 16'b0;
        end
    end

endmodule
