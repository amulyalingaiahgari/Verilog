module tb_traffic_light_controller;
    reg clk, reset;
    wire [2:0] light;

    traffic_light_controller dut ( .clk(clk), .reset(reset), .light(light));

    // 10ns clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #12 reset = 0;

        #200 $finish;
    end

    initial begin
        $display("Time\tState");
        $monitor("%0t\tRED=%b YEL=%b GRN=%b",$time, light[2], light[1], light[0]);
    end
endmodule
