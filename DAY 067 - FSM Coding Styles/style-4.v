//Style–4 → “Three-Process FSM / 3-Always Block FSM”
//-One block: State register
//-One block: Next-state logi
//-One block: Output register logic (registered outputs)
////3-Process Moore FSM (Registered Outputs)////

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
  
  //state register
  always @(posedge clk) begin
    if(rst)
      state <= IDLE;
    else
      state <= next_state;
  end
  
  //next state logic
  always @(state, g0, ws) begin
    next_state = IDLE;
    case (state)
      IDLE:begin
        if(g0)
          next_state = s1;
      end
      sl:begin
        next_state = s2;
      end
      s2:begin
        if (ws)
          next_state = s1;
        else
          next_state = s3;
      end
      s3:begin
        next_state = IDLE;
      end
    endcase
  end
  
  //registered output logic
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      rd <= 0;
      ds <= 0;
    end
    else begin
      rd <= 0;
      ds <= 0;
      case (state)
        IDLE: begin rd <= 0; ds <= 0; end
        s1:   begin rd <= 1; ds <= 0; end
        s2:   begin rd <= 1; ds <= 0; end
        s3:   begin rd <= 0; ds <= 1; end
      endcase
    end
  end
endmodule
