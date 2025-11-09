module tb_demux1x16;
    reg din;
    reg [3:0] sel;
    wire [15:0] y;

    demux1x16_using_4x1 DUT (.din(din), .sel(sel), .y(y));

    initial begin
        $monitor("T=%0t | din=%b sel=%b | y=%b", $time, din, sel, y);
        
        din = 1;
        for (integer i = 0; i < 16; i = i + 1) begin
            sel = i;
            #10;
        end

        din = 0;
        #10;
        $finish;
    end
endmodule
