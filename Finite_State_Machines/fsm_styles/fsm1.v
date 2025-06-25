module fsm
  input clk,
  input rst,
  input g0,
  input ws,
  output reg rd,
  output reg ds );
  reg [1:0]state, next_state;
  parameter IDLE=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;
  
  always @(posedge clk) begin
    if(rst)
      state <= IDLE;
    else
      state <= next_state;
  end
  
  always @(state,g0,ws) begin
    case (state)
      IDLE:begin
        rd <= 0; ds <= 0;
        if(g0)
          next_state <= s1;
        else
        next_state <= IDLE;
      end
      sl:begin
        rd <= 1; ds=0;
        next_state <= s2;
      end
      s2:begin
        rd <= 1; ds=0;
        if (ws)
          next_state <= s1;
        else
        next_state <= s3;
      end
      s3:begin
        rd<=0; ds<=1;
        next_state<=IDLE;
      end
    endcase
  end
endmodule
