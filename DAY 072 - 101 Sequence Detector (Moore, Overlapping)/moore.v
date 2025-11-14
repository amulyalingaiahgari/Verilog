//overlap
module moore (
  input clk,
  input rst,
  input data_in,
  output reg data_out );
  
  reg [1:0] state, next_state;

  parameter s0=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;

  always @(posedge clk) begin
    if(rst)
      state <= s0;
    else
      state <= next state;
  end

  always @(state,data_in) begin
    case (state)
      s0:begin
        data out = 0;
        if(data_in)
          next_state = s1;
        else
          next_state = s0;
      end
      sl:begin
        data_out = 0;
        if(data_in)
          next_state = s1;
        else
          next_state = s2;
      end
      s2:begin
        data out = 0;
        if(data_in)
          next_state = s3;
        else
        next_state = s0;
      end
      s3:begin
        data_out = 1;
        if(data_in)
          next_state = s1;
        else
          next_state = s2;
      end
    endcase
  end
endmodule
