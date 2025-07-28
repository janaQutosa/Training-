module register_file_16x4 (
    input  logic        clk,
    input  logic        reset,
    input  logic [15:0] wdata,
    input  logic        sel,
    input  logic        wr,
    input  logic [1:0]  addr,
    output logic [15:0] rdata
);

    logic [15:0] mem [3:0];  // 4 registers, each 16 bits

    always_ff @(posedge clk) begin
        if (reset) begin
            // synchronous reset: zero output
            rdata <= 16'b0;
        end
        else if (sel) begin
            if (wr) begin
                // Write operation
                mem[addr] <= wdata;
                rdata <= 16'b0;  // output stays zero on write
            end
            else begin
                // Read operation
                rdata <= mem[addr];
            end
        end
        else begin
            rdata <= 16'b0;  // if not selected, output 0
        end
    end

endmodule
