module counter_16bit_better (
    input clk,  
    input reset,
    input [15:0] datain,
    input load,         
    output [15:0] dataout 
);
    reg [15:0] dataout_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            dataout_reg <= 16'b0000000000000000; 
        end else if (load) begin
            dataout_reg <= datain;
        end else begin
            dataout_reg <= dataout_reg + 1;
        end
    end
    assign dataout = dataout_reg;
endmodule
