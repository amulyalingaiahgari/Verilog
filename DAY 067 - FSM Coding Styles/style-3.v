//Style–3 → “Mealy-Style FSM with Combined Output & Next-State Block”
//-Outputs derived inside the same combinational block as next-state
//-Classic Mealy structure (though depends on transitions)
//// 2-Process Mealy FSM (Combined Output + Next-State Logic) ////

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
  
  // state register
  always @(posedge clk) begin
    if(rst)
      state <= IDLE;
    else
      state <= next_state;
  end

  // combined output + next state logic
  always @(*) begin
    next_state=IDLE;
    ds=1'b0; rd=1'b0;
    case (state)
      IDLE:begin
        if(g0)
          next_state = s1;
       end
      sl:begin
        rd = 1;
        next_state = s2;
      end
      s2:begin
        rd = 1;
        if(ws)
          next_state=s1;
        else
          next_state=s3;
      end
      s3:begin
        ds=1;
        next_state=IDLE;
      end
    endcase
  end
endmodule
