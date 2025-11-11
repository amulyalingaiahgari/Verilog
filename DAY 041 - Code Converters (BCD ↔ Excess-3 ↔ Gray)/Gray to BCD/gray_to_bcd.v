// Gray to BCD Converter
module gray_to_bcd(
    input  [3:0] gray,
    output reg [3:0] bcd
);
    integer i;
    always @(*) begin
        bcd[3] = gray[3];
        for (i = 2; i >= 0; i = i - 1)
            bcd[i] = bcd[i+1] ^ gray[i];
    end
endmodule
