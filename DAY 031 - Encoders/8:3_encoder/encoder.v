module en8 (
    input  [7:0] d_in,       // 8 input lines
    output reg [2:0] d_out   // 3-bit binary output
);
    always @(*) begin
            case (d_in)
                8'b00000001: d_out = 3'b000;
                8'b00000010: d_out = 3'b001;
                8'b00000100: d_out = 3'b010;
                8'b00001000: d_out = 3'b011;
                8'b00010000: d_out = 3'b100;
                8'b00100000: d_out = 3'b101;
                8'b01000000: d_out = 3'b110;
                8'b10000000: d_out = 3'b111;
                default: d_out = 3'bxxx; // invalid (multiple or no inputs)
            endcase
        end
endmodule
