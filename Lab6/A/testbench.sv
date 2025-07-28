module testbench;
    Calculator calc = new();
    
    initial begin
        $display("Addition: %f", calc.add(5.0, 3.0));
        $display("Subtraction: %f", calc.sub(5.0, 3.0));
        $display("Multiplication: %f", calc.multi(5.0, 3.0));
        $display("Division: %f", calc.div(6.0, 2.0));
        $display("Division by zero: %f", calc.div(6.0, 0.0));
        
        $display("\nStatic Power Function:");
        $display("2^3 = %f", Calculator::power(2.0, 3.0));
        
        $display("\nWith Time Delays:");
        #50 $display("After 50ns delay, 2^3 = %f", Calculator::power(2.0, 3.0));
    end
endmodule