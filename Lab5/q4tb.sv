// Code your testbench here
// or browse Examples
module tb;
  Register #(8) r1;
  shiftLeftRegister #(16) sl16;
  shiftRightRegister #(4) sr4;

  initial begin
    r1 = new(8'hA5);       // 8-bit register
    sl16 = new(16'h1234);  // 16-bit shift-left register
    sr4 = new(4'b1010);    // 4-bit shift-right register

    $display("r1 = %h", r1.get_data());
    $display("sl16 = %h", sl16.get_data());
    $display("sr4 = %b", sr4.get_data());

    sl16.shiftLeft();
    sr4.shiftRight();

    $display("After shift: sl16 = %h", sl16.get_data());
    $display("After shift: sr4 = %b", sr4.get_data());
  end
endmodule