// Gray to Excess-3 Converter
module gray_to_excess3(
    input  [3:0] gray,
    output [3:0] ex3
);
    reg [3:0] bcd;
    integer i;
    always @(*) begin
        bcd[3] = gray[3];
        for (i = 2; i >= 0; i = i - 1)
            bcd[i] = bcd[i+1] ^ gray[i];
    end
    assign ex3 = bcd + 4'd3;
endmodule
