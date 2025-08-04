class Register;
  // attribute
  logic [7:0] data;

  // constructor with default value
  function new(logic [7:0] d = 0);
    data = d;
  endfunction

  // method to load new value
  function void load(logic [7:0] d);
    data = d;
  endfunction

  // method to get current value
  function logic [7:0] get_data();
    return data;
  endfunction
  
endclass
  
  // subclass shiftleft 
  class shiftLeftRegister extends Register;
    
    // constructor
    function new(logic [7:0] data);
      super.new(data);
      this.data = data;
    endfunction
    
    function void shiftLeft();
      data = {data [6:0], 1'b0};
      // or data = data << 1;
    endfunction
      
  endclass
  
  // subclass shiftright
  class shiftRightRegister extends Register;
    
    // constructor
    function new(logic [7:0] data);
      super.new(data);
      this.data = data;
    endfunction
    
    function void shiftRight();
      data = {1'b0, data [7:1]};
      // or data = data >> 1;
    endfunction
  endclass

