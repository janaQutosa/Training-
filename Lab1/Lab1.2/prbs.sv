module prbs(
    input  logic clk,
    input  logic reset,
    output logic rand
);

    logic [3:0] lfsr; // linear feedback shift reg 

    logic feedback;

    always_ff @(posedge clk or posedge reset) begin

        if (reset)
            lfsr <= 4'b0001;  // seed (non-zero)
            
        else begin
            feedback = lfsr[3] ^ lfsr[0];  // bit 4 and bit 1 (x^4 + x + 1)
            lfsr <= {lfsr[2:0], feedback};  // shift left 
        end
    end

    assign rand = lfsr[3];  

endmodule
