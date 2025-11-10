module fa_using_demux_tb;
    reg a, b, cin;
    wire sum, cout;

    full_adder_using_demux dut(.a(a), .b(b), .cin(cin),.sum(sum), .cout(cout));

    initial begin
        $display("A  B  Cin | Sum  Cout");
        $display("---------------------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #5;
            $display("%b  %b   %b   |  %b     %b", a, b, cin, sum, cout);
        end
        $finish;
    end
endmodule
