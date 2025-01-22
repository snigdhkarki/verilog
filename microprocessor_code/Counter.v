module counter_4bit(
    input clk, 
    input reset,
    output [15:0] count
);

    reg [15:0] count_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) 
            count_reg <= 16'b0000000000000000;
        else
            count_reg <= count_reg + 1;
    end

    assign count = count_reg;

endmodule
