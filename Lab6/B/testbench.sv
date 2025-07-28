module testbench;
    Calculator calc = new();
    real result;
    
    initial begin
        calc.add(5.0, 3.0, result);
        $display("Addition: %f", result);
        calc.sub(5.0, 3.0, result);
        $display("Subtraction: %f", result);
        calc.multi(5.0, 3.0, result);
        $display("Multiplication: %f", result);
        calc.div(6.0, 2.0, result);
        $display("Division: %f", result);
        calc.div(6.0, 0.0, result);
        $display("Division by zero: %f", result);
        
        $display("\nStatic Power Function:");
        Calculator::power(2.0, 3.0, result);
        $display("2^3 = %f", result);
        
        $display("\nWith Time Delays:");
        #50 Calculator::power(2.0, 3.0, result);
        $display("After 50ns delay, 2^3 = %f", result);
    end
endmodule