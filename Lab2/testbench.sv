module test_register_file_16x4;

    // Inputs
    logic clk, reset;
    logic sel, wr;
    logic [15:0] wdata;
    logic [1:0] addr;

    // Output
    logic [15:0] rdata;

    // Instantiate the DUT
    register_file_16x4 dut (
        .clk(clk),
        .reset(reset),
        .wdata(wdata),
        .sel(sel),
        .wr(wr),
        .addr(addr),
        .rdata(rdata)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10 time unit clock period

    // Test logic
    int errors = 0;

    initial begin
        $display("Time\tSel\tWr\tAddr\tWData\t\tRData\t\tExpected");

        // Initial state
        sel = 0; wr = 0; wdata = 0; addr = 0; reset = 1;

        // Apply synchronous reset
        @(posedge clk);
        reset = 0;

        // Write to all 4 locations
        for (int i = 0; i < 4; i++) begin
            @(posedge clk);
            sel = 1;
            wr = 1;
            addr = i[1:0];
            wdata = 16'hA0A0 + i;  // example data
        end

        // Disable write
        @(posedge clk);
        wr = 0;

        // Read from all 4 locations and check
        for (int i = 0; i < 4; i++) begin
            @(posedge clk);
            sel = 1;
            wr = 0;
            addr = i[1:0];

            // Wait for rdata to update
            @(posedge clk);
            $display("%0t\t%b\t%b\t%0d\t%h\t\t%h\t\t%h",
                     $time, sel, wr, addr, wdata, rdata, (16'hA0A0 + i));

            if (rdata !== (16'hA0A0 + i)) begin
                $display(" Error: rdata mismatch at addr %0d", i);
                errors++;
            end
        end

        // Read while sel = 0 → expect rdata = 0
        @(posedge clk);
        sel = 0;
        wr = 0;
        addr = 2;
        @(posedge clk);
        $display("Checking when sel = 0 → rdata = %h (should be 0)", rdata);
        if (rdata !== 16'h0000) begin
            $display(" Error: rdata not zero when sel=0");
            errors++;
        end

        // Final result
        if (errors == 0)
            $display(" All tests passed!");
        else
            $display(" Total errors: %0d", errors);

        $finish;
    end

endmodule
