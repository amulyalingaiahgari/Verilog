//fsm coding style 2
module fsm (
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
//present state sequential block
  always @(posedge clk) begin
    if(rst)
      state <= IDLE;
    else
      state <= next_state;
  end
//next state combinational always block
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
        next_state<=IDLE;
      end
    endcase
  end
  //continuous assignment outputs
  assign rd=(state==s1)||(state==s2);
  assign ds=(state==s3);
endmodule
