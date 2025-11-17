module arbiter (
    input  wire        clk,
    input  wire        rst,
    input  wire [2:0]  request,
    output reg  [2:0]  grant
);

    // State definitions
    parameter IDLE = 3'b000,
              S0   = 3'b001,   // last granted = req0
              S1   = 3'b010,   // last granted = req1
              S2   = 3'b011;   // last granted = req2

    reg [2:0] state, nextstate;

    // 1. Sequential logic for state register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= nextstate;
    end

    // 2. Combinational logic: next state + grant generation
    always @(*) begin
        // Default outputs
        nextstate = state;
        grant     = 3'b000;
        case (state)
        // IDLE → priority: 0 > 1 > 2
          IDLE: begin
                if (request[0]) begin
                    grant = 3'b001;
                    nextstate = S0;
                end else if (request[1]) begin
                    grant = 3'b010;
                    nextstate = S1;
                end else if (request[2]) begin
                    grant = 3'b100;
                    nextstate = S2;
                end
            end
            // Last served = 0 → next priority: 1 > 2 > 0
            S0: begin
                if (request[1]) begin
                    grant = 3'b010;
                    nextstate = S1;
                end else if (request[2]) begin
                    grant = 3'b100;
                    nextstate = S2;
                end else if (request[0]) begin
                    grant = 3'b001;
                    nextstate = S0;
                end else begin
                    grant = 3'b000;
                    nextstate = IDLE;
                end
            end
            // Last served = 1 → next priority: 2 > 0 > 1
            S1: begin
                if (request[2]) begin
                    grant = 3'b100;
                    nextstate = S2;
                end else if (request[0]) begin
                    grant = 3'b001;
                    nextstate = S0;
                end else if (request[1]) begin
                    grant = 3'b010;
                    nextstate = S1;
                end else begin
                    grant = 3'b000;
                    nextstate = IDLE;
                end
            end
            // Last served = 2 → next priority: 0 > 1 > 2
            S2: begin
                if (request[0]) begin
                    grant = 3'b001;
                    nextstate = S0;
                end else if (request[1]) begin
                    grant = 3'b010;
                    nextstate = S1;
                end else if (request[2]) begin
                    grant = 3'b100;
                    nextstate = S2;
                end else begin
                    grant = 3'b000;
                    nextstate = IDLE;
                end
            end
            default: begin
                nextstate = IDLE;
                grant = 3'b000;
            end
        endcase
    end
endmodule
