module test_prbs;

    logic clk, reset;
    logic rand;

    // Instantiate DUT
    prbs uut (
        .clk(clk),
        .reset(reset),
        .rand(rand)
    );

    // Clock generator: toggle every 5 time units
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $display("Time\tReset\tRand");
        $display("----------------------");

        reset = 1;
        #10;
        reset = 0;

        repeat (20) begin
            @(posedge clk);
            $display("%0t\t%b\t%b", $time, reset, rand);
        end

        $finish;
    end

endmodule
