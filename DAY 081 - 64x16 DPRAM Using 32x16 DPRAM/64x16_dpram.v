//64x16 dpram using 32x16 dpram
module mem64 (
  output reg [15:0] d_out,
  input [15:0] d_in,
  input rd,
  input [5:0] raddr,
  input wr,
  input [5:0] waddr,
  input clk,
  input rst );

  wire [15:0] dout0, dout1;
  wire rd0, rd1, wr0, wr1;
  wire [4:0] raddr0, raddr1, waddr0, waddr1;

  // Address select
  assign rd0 = rd & (raddr[5] == 1'b0);
  assign rd1 = rd & (raddr[5] == 1'b1);
  assign wr0 = wr & (waddr[5] == 1'b0);
  assign wr1 = wr & (waddr[5] == 1'b1);

  assign raddr0 = raddr[4:0];
  assign raddr1 = raddr[4:0];
  assign waddr0 = waddr[4:0];
  assign waddr1 = waddr[4:0];

  // Instantiate two 16x32 memories
  mem mem0(
    .d_out(dout0),
    .d_in(d_in),
    .rd(rd0),
    .raddr(raddr0),
    .wr(wr0),
    .waddr(waddr0),
    .clk(clk),
    .rst(rst)
  );

  mem mem1(
    .d_out(dout1),
    .d_in(d_in),
    .rd(rd1),
    .raddr(raddr1),
    .wr(wr1),
    .waddr(waddr1),
    .clk(clk),
    .rst(rst)
  );

  // Output MUX
  always @(*) begin
    case (raddr[5])
      1'b0: d_out = dout0;
      1'b1: d_out = dout1;
    endcase
  end

endmodule



//32x16 dpram
module mem (
  input         clk,
  input         rst,
  input         rd,
  input         wr,
  input  [4:0]  raddr,
  input  [4:0]  waddr,
  input  [15:0] d_in,
  output reg [15:0] d_out
);

  reg [15:0] memory [0:31];   // 32 x 16 RAM  
  integer i;

  always @(posedge clk) begin
    // Reset – clear entire memory and output
    if (rst) begin
      d_out <= 16'b0;
      for (i = 0; i < 32; i = i + 1)
        memory[i] <= 16'b0;
    end
    // Write operation
    else if (wr) begin
      memory[waddr] <= d_in;
    end
    // Read operation
    else if (rd) begin
      d_out <= memory[raddr];
    end
    // Idle: No action
  end
endmodule
