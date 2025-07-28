module dff_proc (
    input  logic d,
    input  logic clear,     // asynchronous clear (active high)
    input  logic preset,    // asynchronous preset (active high)
    input  logic clock,
    output logic q
);

    always_ff @(posedge clock or posedge clear or posedge preset) begin
        if (clear)
            q <= 1'b0;
        else if (preset)
            q <= 1'b1;
        else
            q <= d;
    end

endmodule
