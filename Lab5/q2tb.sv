// Code your testbench here
// or browse Examples
module tb;
  shiftLeftRegister sl;
  shiftRightRegister sr;

  initial begin
    sl = new(8'b01001101);     
    sr = new(8'b11000100); 
    
    $display("Initial value of sl register: %b", sl.get_data());
    $display("Initial value of sr register: %b", sr.get_data());
    
    sl.shiftLeft();
    $display("value of sl register after shift left: %b", sl.get_data());
    
    sr.shiftRight();
    $display("value of sr register after shift right: %b", sr.get_data());

  end
endmodule
