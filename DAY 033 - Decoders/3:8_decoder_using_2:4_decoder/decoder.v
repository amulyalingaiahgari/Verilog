module decoder_2x4 (
    input  [1:0] in,
    input        en,
    output [3:0] out
);
    assign out[0] = en & ~in[1] & ~in[0];
    assign out[1] = en & ~in[1] &  in[0];
    assign out[2] = en &  in[1] & ~in[0];
    assign out[3] = en &  in[1] &  in[0];
endmodule


module decoder_3x8_struct (
    input  [2:0] in,
    input        en,
    output [7:0] out
);
    wire [1:0] in_low = in[1:0];
    wire en0 = en & ~in[2];
    wire en1 = en &  in[2];

    wire [3:0] d0, d1;

    decoder_2x4 d_low  (.in(in_low), .en(en0), .out(d0));
    decoder_2x4 d_high (.in(in_low), .en(en1), .out(d1));

    assign out = {d1, d0};
endmodule
