module lifo_stack #(
  parameter WIDTH = 8,
  parameter DEPTH = 16,
  parameter PTR_WIDTH = 4        // log2(DEPTH)
)(
  input                clk,
  input                rst,
  input                push,
  input                pop,
  input  [WIDTH-1:0]   data_in,
  output reg [WIDTH-1:0] data_out,
  output reg           full,
  output reg           empty
);

  reg [WIDTH-1:0] stack_mem [0:DEPTH-1];
  reg [PTR_WIDTH:0] sp;   // stack pointer

  integer i;

  always @(posedge clk) begin
    if (rst) begin
      sp <= 0;
      data_out <= 0;
      empty <= 1;
      full <= 0;
      for(i = 0; i < DEPTH; i = i + 1)
        stack_mem[i] <= 0;
    end
    else begin
      // PUSH operation
      if (push && !full) begin
        stack_mem[sp] <= data_in;
        sp <= sp + 1;
      end

      // POP operation
      if (pop && !empty) begin
        sp <= sp - 1;
        data_out <= stack_mem[sp - 1];
      end

      // Full & Empty detection
      full  <= (sp == DEPTH);
      empty <= (sp == 0);
    end
  end

endmodule
