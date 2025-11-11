module tb_multi_code_system;
  reg  [3:0] A, B;
  reg  [1:0] mode;
  wire gt, lt, eq;
  wire [3:0] convA, convB;

  // Instantiate DUT
  multi_code_system dut (.A(A), .B(B),.mode(mode),.gt(gt), .lt(lt), .eq(eq),.convA(convA), .convB(convB));

  initial begin
    $display("-------------------------------------------------------------");
    $display("Mode |\t\t\tCode Type |   A   |   B   |  ConvA  |  ConvB  | gt lt eq");
    $display("-------------------------------------------------------------");

    // Test all modes
    mode = 2'b00; A = 4'd6; B = 4'd3; #5;
    show_status(mode, A, B, convA, convB, gt, lt, eq);

    mode = 2'b01; A = 4'd5; B = 4'd7; #5;
    show_status(mode, A, B, convA, convB, gt, lt, eq);

    mode = 2'b10; A = 4'd2; B = 4'd6; #5;
    show_status(mode, A, B, convA, convB, gt, lt, eq);

    mode = 2'b11; A = 4'd9; B = 4'd4; #5;
    show_status(mode, A, B, convA, convB, gt, lt, eq);

    $display("-------------------------------------------------------------");
    $finish;
  end

  // Task to display results clearly
  task show_status;
    input [1:0] mode;
    input [3:0] A, B, convA, convB;
    input gt, lt, eq;
    reg [20*8:1] mode_name;
    begin
      case(mode)
        2'b00: mode_name = "Binary";
        2'b01: mode_name = "Gray";
        2'b10: mode_name = "Excess-3";
        2'b11: mode_name = "BCD";
      endcase
      $display(" %b | %s | %d(%b) | %d(%b) | %b | %b |  %b  %b  %b",
                mode, mode_name, A, A, B, B, convA, convB, gt, lt, eq);
    end
  endtask

endmodule
