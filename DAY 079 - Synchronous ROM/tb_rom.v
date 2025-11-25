module sync_rom_tb;
    // Parameters
    parameter DEPTH = 8;
    parameter WIDTH = 8;
    localparam ADDR_W = $clog2(DEPTH);

    // TB signals
    reg                   clk;
    reg  [ADDR_W-1:0]     addr;
    wire [WIDTH-1:0]      dout;

    // Instantiate DUT
    sync_rom #(.DEPTH(DEPTH), .WIDTH(WIDTH)) dut (.clk(clk), .addr(addr), .dout(dout));

    // Generate Clock
    always #5 clk = ~clk;

    integer i;

    initial begin
        $display("===== SYNC ROM TEST STARTED =====");

        // Initialize
        clk  = 0;
        addr = 0;

        // Read each ROM location
        for(i = 0; i < DEPTH; i = i + 1) begin
            addr = i;
            #10;
            $display("READ ADDR=%0d DATA=%0h", addr, dout);
        end

        $display("===== SYNC ROM TEST COMPLETE =====");
        $finish;
    end

endmodule
