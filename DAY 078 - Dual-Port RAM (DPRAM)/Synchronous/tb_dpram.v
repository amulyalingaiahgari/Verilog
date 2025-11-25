module dpram_tb;
    // Parameters
    parameter DEPTH = 8;
    parameter WIDTH = 8;
    localparam ADDR_W = $clog2(DEPTH);

    // TB Signals
    reg clk, rst;

    reg we_a, we_b;
    reg [ADDR_W-1:0] addr_a, addr_b;
    reg [WIDTH-1:0]  din_a, din_b;
    wire [WIDTH-1:0] dout_a, dout_b;

    // Instantiate DUT
    dpram #(.DEPTH(DEPTH), .WIDTH(WIDTH)) dut (.clk(clk), .rst(rst), .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a), .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b));

    // Clock
    always #5 clk = ~clk;

    integer i;

    initial begin
        $display("===== DPRAM TEST STARTED =====");

        // Initialize
        clk = 0; rst = 1;
        we_a = 0; we_b = 0;
        addr_a = 0; addr_b = 0;
        din_a = 0; din_b = 0;

        // Release Reset
        #10 rst = 0;

        // --------------------------------------
        // WRITE PHASE (Port A writes)
        // --------------------------------------
        for(i = 0; i < DEPTH; i = i + 1) begin
            we_a   = 1;
            addr_a = i;
            din_a  = i + 8'hA0;
            #10;
            $display("PORT-A WRITE: Addr=%0d Data=%0h", addr_a, din_a);
        end
        we_a = 0;

        // --------------------------------------
        // READ USING PORT B
        // --------------------------------------
        we_b = 0;
        #10;

        for(i = 0; i < DEPTH; i = i + 1) begin
            addr_b = i;
            #10;
            $display("PORT-B READ : Addr=%0d Data=%0h", addr_b, dout_b);
        end

        $display("===== DPRAM TEST COMPLETED =====");
        $finish;
    end

endmodule
