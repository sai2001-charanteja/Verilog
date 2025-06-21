/*
module tb;
  
  reg [7:0]i1,i0;
  wire [7:0]max,min;
  
  maxmin maxmin_inst(i1,i0,max,min);
  
  initial begin
    
    repeat(10) begin
      i1=$random;
      i0 = $random;
      #1
      $display("i1= %0d, i0=%0d ::: Max = %0d,min = %0d",i1,i0,max,min);
      
    end
  end
  
endmodule
*/

/*
module tb;
  
  reg [2:0][7:0]list;
  wire [2:0][7:0]m;
  
  mmm mmm_inst(list,m);
  
  initial begin
    integer i;
    repeat(10) begin
      for(i=0;i<3;i=i+1) list[i] = $random;
      #1
      for(i=0;i<3;i=i+1) $write("%0d, ",list[i]);
      $write("-->");
      for(i=0;i<3;i=i+1) $write("%0d, ",m[i]);
      $display();
      
    end
  end
  
endmodule

*/

module tb;
  parameter M = 10;
  parameter N = 8;
  reg [M-1:0][N-1:0]list;
  wire [M-1:0][N-1:0]m;
  
  maxminN #(.N(N),.M(M)) maxminN_inst(list,m);
  
  initial begin
    integer i;
    repeat(10) begin
      for(i=0;i<M;i=i+1) list[i] = $random;
      #1
      for(i=0;i<M;i=i+1) $write("%0d, ",list[i]);
      $write(" --> ");
      for(i=0;i<M;i=i+1) $write("%0d, ",m[i]);
      $display();
      
    end
  end
  
endmodule