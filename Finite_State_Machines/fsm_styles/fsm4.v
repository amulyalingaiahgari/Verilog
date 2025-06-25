//fsm coding style 4
module fsm (
  input clk,
  input rst
  input g0,
  input ws,
  output reg rd,
  output reg ds );
  reg [1:0]state, next_state;
  parameter IDLE=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;
//present state sequential block
  always @(posedge clk) begin
    if(rst)
      state <= IDLE;
    else
      state <= next_state;
  end
//next state ombinational always block
  always @(state, g0, ws) begin
    next_state <= IDLE;
    case (state)
      IDLE:begin
        if(g0)
          next_state <= s1;
        else
          next_state <= IDLE;
      end
      sl:begin
        next_state <= s2;
      end
      s2:begin
        if (ws)
          next_state <= s1;
        else
          next_state <= s3;
      end
      s3:begin
        next_state <= IDLE;
      end
    endcase
  end
//registered outputs sequential always block
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      rd <= 0;
      ds <= 0;
    end
    else begin
      rd <= 0;
      ds <= 0;
      case (state)
        IDLE: {rd, ds} <= {0, 0};
        s1,s2: rd <= 1;
        s3 <= ds <= 1;
      endcase
    end
  end
endmodule
