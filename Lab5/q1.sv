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
