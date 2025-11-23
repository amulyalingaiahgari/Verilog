module seq_11011_mealy (
  input clk,
  input rst,
  input x,
  output reg y
);

  reg [2:0] state, next_state;

  // State encoding
  localparam S0 = 3'b000,
             S1 = 3'b001,  // seen 1
             S2 = 3'b010,  // seen 11
             S3 = 3'b011,  // seen 110
             S4 = 3'b100;  // seen 1101

  // Sequential block – state update
  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= S0;
    else
      state <= next_state;
  end

  // Combinational block – next state + Mealy output
  always @(state, x) begin
    y = 0;           // default output
    next_state = S0; // default next state

    case (state)
      S0: begin
        if (x) next_state = S1;
        else   next_state = S0;
      end
      S1: begin
        if (x) next_state = S2;
        else   next_state = S0;
      end
      S2: begin
        if (x) next_state = S2;  // 111… keep last two bits "11"
        else   next_state = S3;  // got 110
      end
      S3: begin
        if (x) next_state = S4;  // 1101
        else   next_state = S0;  // 1100 breaks pattern
      end
      S4: begin
        if (x) begin
          y = 1'b1;              // → Mealy output on receiving final 1
          next_state = S2;       // because last two bits are "11"
        end
        else begin
          next_state = S3;       // 1101 + 0 → treat as "110"
        end
      end
      default: next_state = S0;

    endcase
  end

endmodule
