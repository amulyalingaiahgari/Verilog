module encoder_4x2(
    input  [3:0] din,   // 4 input lines
    output reg [1:0] dout  // 2-bit output
);
    always @(*) begin
        case (din)
            4'b0001: dout = 2'b00;
            4'b0010: dout = 2'b01;
            4'b0100: dout = 2'b10;
            4'b1000: dout = 2'b11;
            default: dout = 2'bxx; // invalid input (more than one line active)
        endcase
    end
endmodule
