/*
module tb;
  
  reg a,b;
  wire gt,eq,lt;
  
  comp1 comp1_inst(a,b,gt,eq,lt);
  
  
  initial begin
    
    integer i;
    for(i=0;i<4;i=i+1) begin
      {a,b}=i;
      #1
      $display("%0d %0s %0d",a,(gt?">":(lt?"<":"=")),b);
    end
  end
  
endmodule
*/

/*
module tb;
  
  reg [1:0]a,b;
  wire gt,eq,lt;
  
  comp2 comp2_inst(a,b,gt,eq,lt);
  
  
  initial begin
    
    integer i;
    for(i=0;i<2**4;i=i+1) begin
      {a,b}=i;
      #1
      $display("%0d %0s %0d",a,(gt?">":(lt?"<":"=")),b);
    end
  end
  
endmodule
*/

/*
module tb;
  parameter N=10;
  reg [N-1:0]a,b;
  wire gt,eq,lt;
  
  compN #(.N(N)) compN_inst(a,b,gt,eq,lt);
  
  
  initial begin
    
    repeat(10) begin
      a= $random;
      b= $random;
      #1
      $display("%0d %0s %0d    %b",a,(gt?">":(lt?"<":"=")),b,{gt,eq,lt});
    end
  end
  
endmodule
*/

`define WIDTH(N) $clog2(N)+(N &(N-1)==0)
module tb;
  parameter N=20;
  reg [N-1:0]a;
  wire [`WIDTH(N)-1:0]res;
  
  Counting1s #(.N(N)) Counting1s_inst(a,res);
  
  
  initial begin
    
    repeat(100) begin
      a= $random;
      #1
      $display("%b has %0d ones",a,res);
    end
  end
  
endmodule