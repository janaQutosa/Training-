// Code your testbench here
// or browse Examples
module tb;
  Register r1;
  shiftLeftRegister sl;
  shiftRightRegister sr;

  initial begin
    r1 = new();
    sl = new(8'h12);
    sr = new(8'hA5);

    $display("r1 = %0h, sl = %0h, sr = %0h", r1.get_data(), sl.get_data(), sr.get_data());
    $display("Total Objects Created = %0d", Register::get_count());

    // check through child classes
    $display("Via ShiftLeftRegister = %0d", shiftLeftRegister::get_count());
    $display("Via ShiftRightRegister = %0d", shiftRightRegister::get_count());
  end
endmodule
