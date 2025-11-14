module digital_clock(
    input  clk,          // 1 Hz clock input
    input  rst_n,        // Active-low reset
    output reg [5:0] ss, // seconds  (00-59)
    output reg [5:0] mm, // minutes  (00-59)
    output reg [4:0] hh  // hours    (00-23)
);

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ss <= 0;
            mm <= 0;
            hh <= 0;
        end
        else begin
            // SECOND counter
            if (ss == 6'd59) begin
                ss <= 0;

                // MINUTE counter rollover
                if (mm == 6'd59) begin
                    mm <= 0;

                    // HOUR counter rollover
                    if (hh == 5'd23)
                        hh <= 0;
                    else
                        hh <= hh + 1;
                end
                else
                    mm <= mm + 1;
            end
            else
                ss <= ss + 1;
        end
    end
endmodule
