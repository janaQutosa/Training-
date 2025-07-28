class Calculator;
    real result;
    
    function new();
        result = 0.0;
    endfunction
    
    task add(input real a, input real b, output real res);
        res = a + b;
    endtask
    
    task sub(input real a, input real b, output real res);
        res = a - b;
    endtask
    
    task div(input real a, input real b, output real res);
        if (b == 0.0) begin
            $display("Error: Division by zero!");
            res = 0.0;
        end else begin
            res = a / b;
        end
    endtask
    
    task multi(input real a, input real b, output real res);
        res = a * b;
    endtask
    
    static task power(input real base, input real exp, output real res);
        real temp = 1.0;
        for (int i = 0; i < exp; i++) begin
            temp = temp * base;
            #10; // Delay for simulation time
        end
        res = temp;
    endtask
endclass