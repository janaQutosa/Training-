module slsr( input logic sl,      
    input logic sr,     
    input logic din, 
    input logic clk,
    input logic reset,
    output logic [7:0] Q);

    logic [7:0] temp;  

    always_ff @(posedge clk or posedge reset) begin

        if (reset) begin
            Q <= 8'b0;
        end

        else begin
            temp = Q;

            if (sl && !sr) begin
                temp = {Q[6:0], din}; // shift left
            end
            else if (sr && !sl) begin
                temp = {din, Q[7:1]}; // shift right
            end
            
            Q <= temp;
        end

    end

endmodule 