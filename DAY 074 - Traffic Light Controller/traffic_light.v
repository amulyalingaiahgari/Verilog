module traffic_light_controller (
    input clk,
    input reset,
    output reg [2:0] light   // {Red, Yellow, Green}
);

    // FSM States
    typedef enum logic [1:0] {
        RED    = 2'b00,
        GREEN  = 2'b01,
        YELLOW = 2'b10
    } state_t;

    state_t state, next_state;

    // Timings (in clock cycles)
    parameter RED_TIME    = 5;
    parameter GREEN_TIME  = 5;
    parameter YELLOW_TIME = 2;

    reg [3:0] timer;  // counts cycles in each state

    // --------------------------------------
    // Present State Update
    // --------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= RED;
            timer <= 0;
        end
        else begin
            state <= next_state;
            timer <= (state != next_state) ? 0 : timer + 1;
        end
    end

    // --------------------------------------
    // Next State Logic
    // --------------------------------------
    always @(*) begin
        case (state)
            RED:
                next_state = (timer == RED_TIME-1) ? GREEN : RED;

            GREEN:
                next_state = (timer == GREEN_TIME-1) ? YELLOW : GREEN;

            YELLOW:
                next_state = (timer == YELLOW_TIME-1) ? RED : YELLOW;

            default: next_state = RED;
        endcase
    end

    // --------------------------------------
    // Output Logic
    // --------------------------------------
    always @(*) begin
        case (state)
            RED:    light = 3'b100;
            YELLOW: light = 3'b010;
            GREEN:  light = 3'b001;
            default: light = 3'b100;
        endcase
    end

endmodule
