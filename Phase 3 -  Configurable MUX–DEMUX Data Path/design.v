// Configurable MUX–DEMUX Data Path

module mux_demux_datapath #(
    parameter N = 8,               // number of MUX inputs
    parameter M = 8                // number of DEMUX outputs
)(
    input  [N-1:0] data_in,        // N parallel inputs
    input  [$clog2(N)-1:0] sel_mux,// select input for MUX
    input  [$clog2(M)-1:0] sel_demux,// select input for DEMUX
    output [M-1:0] data_out        // M parallel outputs
);
    wire mux_out;  // intermediate connection

    // MUX: select one of N inputs
    assign mux_out = data_in[sel_mux];

    // DEMUX: route mux_out to one of M outputs
    assign data_out = (mux_out) ? (1'b1 << sel_demux) : {M{1'b0}};

endmodule
