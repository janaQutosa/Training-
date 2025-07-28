class Calculator;
    real result;
    
    function new();
        result = 0.0;
    endfunction
    
    function real add(real a, real b);
        return a + b;
    endfunction
    
    function real sub(real a, real b);
        return a - b;
    endfunction
    
    function real div(real a, real b);
        if (b == 0.0) begin
            $display("Error: Division by zero!");
            return 0.0;
        end
        return a / b;
    endfunction
    
    function real multi(real a, real b);
        return a * b;
    endfunction
    
    static function real power(real base, real exp);
        real temp = 1.0;
        for (int i = 0; i < exp; i++) begin
            temp = temp * base;
            #10; // Delay for simulation time
        end
        return temp;
    endfunction
endclass