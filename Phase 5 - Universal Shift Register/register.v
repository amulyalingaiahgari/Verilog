// 4-bit Universal Shift Register
module universal_shift_register (
    input  [3:0] P_in,      // Parallel Data Input
    input        SLin,      // Serial Left Input
    input        SRin,      // Serial Right Input
    input  [1:0] mode,      // Mode Select
    input        clk,       // Clock
    input        rst_n,     // Active-Low Reset
    output reg [3:0] P_out  // Parallel Data Output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            P_out <= 4'b0000;             // Reset
        else begin
            case (mode)
                2'b00: P_out <= P_out;                         // Hold
                2'b01: P_out <= {SRin, P_out[3:1]};            // Shift Right
                2'b10: P_out <= {P_out[2:0], SLin};            // Shift Left
                2'b11: P_out <= P_in;                          // Parallel Load
                default: P_out <= P_out;
            endcase
        end
    end
endmodule
