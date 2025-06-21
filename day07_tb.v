/*
module tb;
  
  reg [4:0]h1,h2;
  reg [5:0]m1,s1,m2,s2;
  wire gt,eq,lt;
  
  hrsComp24 hrsComp24_inst(h1,m1,s1,h2,m2,s2,gt,eq,lt);
  
  initial begin
    
    repeat(10) begin
      h1 = $urandom_range(0,23);
      h2 = $urandom_range(0,23);
      m1 = $urandom_range(0,59);
      s1 = $urandom_range(0,59);
      m2 = $urandom_range(0,59);
      s2 = $urandom_range(0,59);
      
      #1
      
      $display("%2d:%2d:%2d %0s %2d:%2d:%2d",h1,m1,s1,(gt?">":(lt?"<":(eq?"=":"?"))),h2,m2,s2);
    end
    
  end
  
endmodule
*/


module tb;
  
  reg [3:0]h12;
  reg pm1;
  wire [4:0]h24;
  
  hrs12to24 hrs12to24_inst(h12,pm1,h24);
  
  initial begin
    
    repeat(100) begin
      h12 = $urandom_range(1,12);
     pm1 = $random;
      
      #1
      
      $display("%0d %0s --> %0d",h12,pm1?"pm":"am",h24);
    end
    
  end
  
endmodule