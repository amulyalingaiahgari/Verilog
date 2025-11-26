module palindrome_checker #(
  parameter WIDTH = 5
)(
  input  logic [WIDTH-1:0] a,
  output logic             y
);

  logic [WIDTH-1:0] rev;

  // Generate reversed bits (PPA optimal)
  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1) begin : REVERSE_BITS
      assign rev[i] = a[WIDTH-1-i];
    end
  endgenerate

  // Final check – best PPA: 1 comparator
  assign y = (a == rev);

endmodule
