// 2x1 Multiplexer (Basic Building Block)
module mux2x1(
    input i0, i1, sel,
    output y
);
    assign y = sel ? i1 : i0;
endmodule


// 7 Gates Implemented Using Only 2x1 MUX
module gates_using_mux(
    input a, b,
    output and_out, or_out, xor_out, not_out, nand_out, nor_out, xnor_out
);
    // NOT gate
    mux2x1 m_not (.i0(1'b1), .i1(1'b0), .sel(a), .y(not_out));

    // AND gate
    mux2x1 m_and (.i0(1'b0), .i1(b), .sel(a), .y(and_out));

    // OR gate
    mux2x1 m_or  (.i0(b), .i1(1'b1), .sel(a), .y(or_out));

    // XOR gate
    mux2x1 m_xor (.i0(b), .i1(~b), .sel(a), .y(xor_out));

    // NAND gate
    mux2x1 m_nand(.i0(1'b1), .i1(~b), .sel(a), .y(nand_out));

    // NOR gate
    mux2x1 m_nor (.i0(~b), .i1(1'b0), .sel(a), .y(nor_out));

    // XNOR gate
    mux2x1 m_xnor(.i0(~b), .i1(b), .sel(a), .y(xnor_out));
endmodule
