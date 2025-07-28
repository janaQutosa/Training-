module tb_adder_4bit_proc;

    // DUT inputs
    logic [3:0] ina, inb;
    logic carry_in;

    // DUT outputs
    logic [3:0] sum_out;
    logic carry_out;

    // Instantiate DUT
    adder_4bit_proc uut (
        .ina(ina),
        .inb(inb),
        .carry_in(carry_in),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    // Test sequence
    initial begin
        $display("Time\tina\tinb\tcin\t| sum\tcout");
        $display("------------------------------------------------");

        // Test 1
        ina = 4'b0001; inb = 4'b0010; carry_in = 0;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test 2
        ina = 4'b0101; inb = 4'b0011; carry_in = 1;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test 3
        ina = 4'b1111; inb = 4'b0001; carry_in = 0;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test 4
        ina = 4'b1111; inb = 4'b1111; carry_in = 1;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        // Test 5
        ina = 4'b0000; inb = 4'b0000; carry_in = 0;
        #1 $display("%0t\t%b\t%b\t%b\t| %b\t%b", $time, ina, inb, carry_in, sum_out, carry_out);

        $finish;
    end

endmodule
