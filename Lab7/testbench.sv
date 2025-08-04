module testbench;
    logic clk;
    logic reset;
    logic [6:0] outputs;

    control dut (
        .clk(clk),
        .reset(reset),
        .outputs(outputs)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        $display("Time\tState\tOutputs");
        $monitor("%0t\t%b\t%b", $time, dut.state, outputs);

        // Reset
        reset = 1;
        #15 reset = 0;

        // Run for 80ns to see 8 cycles
        #80 $finish;
    end

endmodule