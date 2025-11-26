module stop_watch(
  input clk, rst,
  input start_stop,
  output reg [5:0] sec,
  output reg [5:0] min,
  output reg [3:0] hour
);

  reg run;
  reg [5:0] sec_count;
  reg [5:0] min_count;
  reg [3:0] hour_count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      sec_count  <= 0;
      min_count  <= 0;
      hour_count <= 0;
      sec  <= 0;
      min  <= 0;
      hour <= 0;
      run  <= 0;
    end 
    
    else if (start_stop) begin
      run <= ~run;   // toggle run flag
    end 

    else if (run) begin
      if (sec_count == 59) begin
        sec_count <= 0;
        if (min_count == 59) begin
          min_count <= 0;
          if (hour_count == 23)
            hour_count <= 0;
          else
            hour_count <= hour_count + 1;
        end
        else
          min_count <= min_count + 1;
      end
      else
        sec_count <= sec_count + 1;

      // update visible values
      sec  <= sec_count;
      min  <= min_count;
      hour <= hour_count;
    end
  end

endmodule
