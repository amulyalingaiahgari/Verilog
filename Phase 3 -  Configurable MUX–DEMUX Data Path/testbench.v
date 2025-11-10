module tb_mux_demux_datapath;
    parameter N = 8;
    parameter M = 8;

    reg  [N-1:0] data_in;
    reg  [$clog2(N)-1:0] sel_mux;
    reg  [$clog2(M)-1:0] sel_demux;
    wire [M-1:0] data_out;

    mux_demux_datapath #(.N(N), .M(M)) DUT (.data_in(data_in),.sel_mux(sel_mux),.sel_demux(sel_demux),.data_out(data_out));

    initial begin
      $display("Time | sel_mux | sel_demux | data_in | data_out");
      $monitor("%0t | %0d | %0d | %b | %b", $time, sel_mux, sel_demux, data_in, data_out);

        data_in = 8'b10110010;  // Example pattern

        // Try all combinations
        sel_mux = 0; sel_demux = 0; #10;
        sel_mux = 1; sel_demux = 2; #10;
        sel_mux = 2; sel_demux = 4; #10;
        sel_mux = 3; sel_demux = 6; #10;
        sel_mux = 4; sel_demux = 1; #10;
        sel_mux = 5; sel_demux = 5; #10;
        sel_mux = 6; sel_demux = 3; #10;
        sel_mux = 7; sel_demux = 7; #10;

        $finish;
    end
endmodule
