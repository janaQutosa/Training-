module adder_4bit (
    input  logic [3:0] ina,
    input  logic [3:0] inb,
    input  logic       carry_in,
    output logic [3:0] sum_out,
    output logic       carry_out
);

    // Intermediate 5-bit result to capture carry
    logic [4:0] result;

    // Continuous assignment
    assign result     = ina + inb + carry_in;
    assign sum_out    = result[3:0];  // lower 4 bits
    assign carry_out  = result[4];    // carry out (5th bit)

endmodule
