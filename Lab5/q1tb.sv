// Code your testbench here
// or browse Examples
module tb;
  Register r1;

  initial begin
    r1 = new();          // default 0
    $display("Initial value: %0h", r1.get_data());

    r1.load(8'hA5);      // load value A5
    $display("After load: %0h", r1.get_data());
  end
endmodule
