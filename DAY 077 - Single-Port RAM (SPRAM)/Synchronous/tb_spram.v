module spram_tb;
    // Parameters
    parameter DEPTH = 8;
    parameter WIDTH = 8;
    localparam ADDR_WIDTH = $clog2(DEPTH);

    // Testbench signals
    reg                   clk;
    reg                   rst;
    reg                   we;
    reg  [ADDR_WIDTH-1:0] addr;
    reg  [WIDTH-1:0]      din;
    wire [WIDTH-1:0]      dout;

    // Instantiate DUT
    spram #(.DEPTH(DEPTH), .WIDTH(WIDTH)) dut (.clk(clk), .rst(rst), .we(we), .addr(addr), .din(din), .dout(dout));

    // Generate clock
    always #5 clk = ~clk;

    // Test sequence
    integer i;

    initial begin
        $display("===== SPRAM TEST STARTED =====");

        // Initial values
        clk  = 0;
        rst  = 1;
        we   = 0;
        addr = 0;
        din  = 0;

        // Apply reset
        #10 rst = 0;

        // -------------------------
        // WRITE PHASE
        // -------------------------
        for(i = 0; i < DEPTH; i = i + 1) begin
            we   = 1;
            addr = i;
            din  = i + 8'hA0;   // Sample data
            #10;
            $display("Writing: Addr=%0d Data=%0h", addr, din);
        end

        // -------------------------
        // READ PHASE
        // -------------------------
        we = 0;
        #10;
        for(i = 0; i < DEPTH; i = i + 1) begin
            addr = i;
            #10;
            $display("Reading : Addr=%0d Data=%0h", addr, dout);
        end

        $display("===== SPRAM TEST COMPLETED =====");
        $finish;
    end

endmodule
