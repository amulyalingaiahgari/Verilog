module code (result, clk, rst) ;
  input clk;
  input rst;
  output reg [3:0]result;
  reg uds;
  reg skip3;
  reg [1:0]skip5;
//counting result
  always @(posedge clk) begin
    if(rst)
      result <= 0;
    else begin
      if(uds) begin
        if(skip5[1]&skip5[0])
          result <= result-2;
        else
        result <= result-1;
      end
      else begin
        if(skip3)
          result <= result+2;
        else
        result <= result+1;
      end
    end
  end
//selecting upcount or downcount
  always @(posedge clk) begin
    if(rst || result == 1)
      uds <= 0;
    else if(result == 4'he)
      uds <= 1;
    else
    uds <= uds;
  end
//skip3 logic
  always @(posedge clk) begin
    if (rst || result == 1)
      skip3 <= 0;
    else begin
      if (!uds)
        skip3 <= ~skip3;
      else
        skip3 <= skip3;
    end
  end
//skip5 logic
  always @(posedge clk) begin
    if(rst)
      skip5 <= 0;
    else begin
      if(result == 2)
        skip5 <= skip5;
      else if (uds)
        skip5 <= skip5+1;
      else
      skip5 <= 0;
    end
  end
endmodule
