module d_flipflop (
    input datain,  
    input clk,    
    input preset, 
    output q 
);

    reg q_reg;

    always @(posedge clk or posedge preset) begin
        if (preset)
            q_reg <= 1'b1;      
        else
            q_reg <= datain;    
    end

    assign q = q_reg;

endmodule
