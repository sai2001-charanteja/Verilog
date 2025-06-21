module tb;
  parameter N=8;
  reg [N-1:0]a,b;
  wire [2*N:0] res;
  
  mulN #(.N(N)) mulN_inst(a,b,res);
  
  initial begin
    
    repeat(100) begin
      
      a= $random;
      b= $random;
      #1
     
      if(res!=a*b) $display("Error in %0d x %0d",a,b);
      else  $display("%d x %d = %d",a,b,res);
    end
    
  end
  
endmodule