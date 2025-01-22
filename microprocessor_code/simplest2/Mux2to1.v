module mux_2to1 (
    input A, B, Sel,
    output Y
);

    assign Y = (Sel & B) | (~Sel & A);

endmodule