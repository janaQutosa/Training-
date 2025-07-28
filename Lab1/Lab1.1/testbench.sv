module testslsr;

    // DUT Inputs
    logic sl, sr, din, clk, reset;
    // DUT Output
    logic [7:0] Q;

    // Error counter
    int errors = 0;

    // Instantiate DUT
    slsr dut(
        .sl(sl),
        .sr(sr),
        .din(din),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  

    initial begin
        // Initialize inputs
        sl = 0;
        sr = 0;
        din = 0;
        reset = 1;

        #10 reset = 0;

        // Stimulus 1: Shift left with din=1
        sl = 1; sr = 0; din = 1;
        repeat(4) @(posedge clk);
        sl = 0;

        // Expected value after 4 left shifts of 1
        if (Q !== 8'b00001111) begin
            $display("Test 1 Failed: Q = %b, Expected = 00001111", Q);
            errors++;
        end else begin
            $display("Test 1 Passed");
        end

        // Stimulus 2: Shift right with din=0
        sr = 1; din = 0;
        repeat(2) @(posedge clk);
        sr = 0;

        // Expected value: 2 shifts right with 0 din
        if (Q !== 8'b00000011) begin
            $display("Test 2 Failed: Q = %b, Expected = 00000011", Q);
            errors++;
        end else begin
            $display("Test 2 Passed");
        end

        // Stimulus 3: Reset
        reset = 1;
        @(posedge clk);
        reset = 0;

        if (Q !== 8'b00000000) begin
            $display("Test 3 Failed: Q = %b, Expected = 00000000", Q);
            errors++;
        end else begin
            $display("Test 3 Passed");
        end

        // Final result
        if (errors == 0)
            $display("All tests passed!");
        else
            $display("%0d test(s) failed.", errors);

        $finish;
    end
endmodule
