module tb_adder_4bit;

    // Testbench signals
    logic [3:0] ina, inb;
    logic carry_in;
    logic [3:0] sum_out;
    logic carry_out;

    // Instantiate the DUT (Device Under Test)
    adder_4bit uut (
        .ina(ina),
        .inb(inb),
        .carry_in(carry_in),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    // Test procedure
    initial begin
        $display("Time\tina\tinb\tcin\t| sum\tcout");
        $display("------------------------------------------------");

        // Test Case 1
        ina = 4'b0001; inb = 4'b0010; carry_in = 0;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test Case 2
        ina = 4'b0101; inb = 4'b0011; carry_in = 1;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test Case 3
        ina = 4'b1111; inb = 4'b0001; carry_in = 0;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test Case 4
        ina = 4'b1111; inb = 4'b1111; carry_in = 1;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test Case 5
        ina = 4'b0000; inb = 4'b0000; carry_in = 0;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        $finish;
    end

endmodule
