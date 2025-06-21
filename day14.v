al to use /* Developed Module
1.test - whether we can access any signal of testbench from module
*/

module sub();
  
  initial tb.a = 10;
endmodule


module temp(input a,b,output c);
  initial begin
    tb.a = 30; // Its illegal to use 
  end
  assign c = a+b;
endmodule