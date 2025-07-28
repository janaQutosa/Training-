module adder_4bit_proc (
    input  logic [3:0] ina,
    input  logic [3:0] inb,
    input  logic       carry_in,
    output logic [3:0] sum_out,
    output logic       carry_out
);

    logic [4:0] result;

    always_comb begin
        result = ina + inb + carry_in;
        sum_out   = result[3:0];
        carry_out = result[4];
    end

endmodule
