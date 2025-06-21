module tb;
  
  integer a;
  reg d,b;
  wire c;
  
 // sub sub_inst();
  temp temp_inst(d,b,c);
  
  initial begin
    a=20; d=1;b=1;
    #1
    $display("The value of a = %0d, %0d",a,c);
    
  end
  
endmodule
