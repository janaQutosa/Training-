`timescale 1ns/1ps

module control (
    input logic clk,
    input logic reset,
    output logic [6:0] outputs
);

    // Enum for CPU operation 
    typedef enum logic [2:0] {
        LOAD = 3'b000,
        STORE = 3'b001,
        ADD = 3'b010,
        SUB = 3'b011,
        MUL = 3'b100,
        DIV = 3'b101,
        JMP = 3'b110
    } cpu_op_t;

    // Enum for sequencer states
    typedef enum logic [2:0] {
        INST_ADDR = 3'b000,
        FETCH = 3'b001,
        DECODE = 3'b010,
        EXECUTE = 3'b011,
        MEM_READ = 3'b100,
        MEM_WRITE = 3'b101,
        WRITE_BACK = 3'b110,
        STORE = 3'b111
    } state_t;

    state_t state, next_state;

    // State transition
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= INST_ADDR;
        else
            state <= next_state;
    end

    // Next state logic 
    always_comb begin
        unique case (state)
            INST_ADDR: next_state = FETCH;
            FETCH: next_state = DECODE;
            DECODE: next_state = EXECUTE;
            EXECUTE: next_state = MEM_READ;
            MEM_READ: next_state = MEM_WRITE;
            MEM_WRITE: next_state = WRITE_BACK;
            WRITE_BACK: next_state = STORE;
            STORE: next_state = INST_ADDR;
            default: next_state = INST_ADDR;
        endcase
    end

    // Output decode logic
    always_comb begin
        unique case (state)
            INST_ADDR: outputs = 7'b0000001; // Output for INST_ADDR
            FETCH: outputs = 7'b0000010;    // Output for FETCH
            DECODE: outputs = 7'b0000100;   // Output for DECODE
            EXECUTE: outputs = 7'b0001000;  // Output for EXECUTE
            MEM_READ: outputs = 7'b0010000; // Output for MEM_READ
            MEM_WRITE: outputs = 7'b0100000;// Output for MEM_WRITE
            WRITE_BACK: outputs = 7'b1000000;// Output for WRITE_BACK
            STORE: outputs = 7'b0000001;    // Output for STORE (back to INST_ADDR pattern)
            default: outputs = 7'b0000000;
        endcase
    end

endmodule