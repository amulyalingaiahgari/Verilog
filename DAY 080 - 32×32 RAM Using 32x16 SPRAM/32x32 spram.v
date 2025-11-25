//32x32 spram using 32x16 spram
module mem2(d_out, clk, rst, r_w, addr, d_in) ;
  input clk;
  input rst;
  input r_w;
  input [4:0]addr;
  input [31:0]d_in;
  output [31:0]d_out;
  
  wire [15:0] d_out1;
  wire [15:0] d_out2;
  
  mem ml (.clk(clk), .rst(rst), .r_w(r_w), .addr(addr), .d_in(d_in[15:0]), .d_out(d_out1));
  mem m2 (.clk(clk), .rst(rst), .r_w(r_w), .addr(addr), .d_in(d_in[31:16]), .d_out(d_out2));
  assign d_out = {d_out2,d_out1};

endmodule


//32x16 spram
module mem (
    input              clk,
    input              rst,
    input              r_w,         // 1=write , 0=read
    input      [4:0]   addr,
    input      [15:0]  d_in,
    output reg [15:0]  d_out
);

    reg [15:0] memory [0:31];   // 32 x 16 RAM

    always @(posedge clk) begin
        if (rst) begin
            d_out <= 16'h0000;
        end
        else begin
            if (r_w) begin
                memory[addr] <= d_in;    // WRITE
            end
            else begin
                d_out <= memory[addr];   // READ
            end
        end
    end

endmodule
