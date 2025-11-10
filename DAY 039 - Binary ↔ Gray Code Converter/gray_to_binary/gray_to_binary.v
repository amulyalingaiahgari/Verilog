// Gray to Binary Converter
module gray_to_binary #(parameter N = 4)(
    input  [N-1:0] gray,
    output reg [N-1:0] bin
);
    integer i;
    always @(*) begin
        bin[N-1] = gray[N-1]; // MSB same
        for (i = N-2; i >= 0; i = i - 1)
            bin[i] = bin[i+1] ^ gray[i];
    end
endmodule
