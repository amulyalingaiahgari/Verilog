//rtl for real hardware
module factorial (
  input        clk,
  input        rst,
  input        start,
  input  [7:0] in,
  output reg [31:0] result,
  output reg        done
);

  reg [7:0]  counter;
  reg        busy;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      result  <= 1;
      counter <= 0;
      busy    <= 0;
      done    <= 0;
    end
    else begin
      
      // Start condition
      if (start && !busy) begin
        result  <= 1;
        counter <= in;
        busy    <= 1;
        done    <= 0;
      end

      // Run calculation
      else if (busy) begin
        if (counter > 1) begin
          result  <= result * counter;
          counter <= counter - 1;
        end
        else begin
          busy <= 0;
          done <= 1;          // Signal completion
        end
      end

    end
  end

endmodule
