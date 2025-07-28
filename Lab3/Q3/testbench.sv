module tb_dff_proc;

    logic d, clear, preset, clock;
    logic q;

    // Instantiate the DUT
    dff_proc uut (
        .d(d),
        .clear(clear),
        .preset(preset),
        .clock(clock),
        .q(q)
    );

    // Clock generator
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10 time unit period
    end

    // Test sequence
    initial begin
        $display("Time\tclr\tpre\td\tq");

        // Initial values
        d = 0; clear = 0; preset = 0;
        #2;

        // Apply preset
        preset = 1; #2;
        preset = 0; #8;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clear, preset, d, q);

        // Apply clear
        clear = 1; #2;
        clear = 0; #8;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clear, preset, d, q);

        // Normal operation
        d = 1; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clear, preset, d, q);

        d = 0; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clear, preset, d, q);

        d = 1; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, clear, preset, d, q);

        $finish;
    end

endmodule
