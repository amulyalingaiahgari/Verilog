// 8x3 Low-Priority Encoder
module low_priority_encoder_8x3 (
    input  [7:0] in,
    output reg [2:0] out,
    output reg valid
);
    always @(*) begin
       // valid = 1'b1;
        casez (in)
          8'b???????1:begin out = 3'b000;valid=1;end// LSB bit has highest priority
          8'b??????10:begin out = 3'b001;valid=1;end
          8'b?????100:begin out = 3'b010;valid=1;end
          8'b????1000:begin out = 3'b011;valid=1;end
          8'b???10000:begin out = 3'b100;valid=1;end
          8'b??100000:begin out = 3'b101;valid=1;end
          8'b?1000000:begin out = 3'b110;valid=1;end
          8'b10000000:begin out = 3'b111;valid=1;end
            default: begin
                out   = 3'b000;
                valid = 1'b0;
            end
        endcase
    end
endmodule
