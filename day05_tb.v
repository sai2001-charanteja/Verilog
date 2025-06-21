/*
module tb;
  
  reg [7:0]bcd;
  wire [6:0]bin;
  
  bcd2bin bcd2bin_inst(bcd,bin);
  
  initial begin
    
    repeat(10) begin
      bcd[7:4] = $urandom_range(0,9);
      bcd[3:0] = $urandom_range(0,9);
      #1
      $display("bcd = %0d%0d , bin = %2d",bcd[7:4],bcd[3:0],bin);
    end
  end
  
endmodule

*/


/*
module tb;
  
  reg [4:0]bin;
  wire [7:0]bcd;
  
  bin2bcd bin2bcd_inst(bin,bcd);
  
  initial begin
    
    repeat(10) begin
      bin = $urandom_range(0,(2**5)-1);
      #1
      $display(" bin = %2d, bcd = %0d%0d",bin,bcd[7:4],bcd[3:0]);
    end
  end
  
endmodule
*/


module tb;
  parameter N=20;
  reg [N-1:0]a,b;
  wire [N-1:0]diff;
  
  diff #(.N(N)) diff_inst(a,b,diff);
  
  initial begin
    
    repeat(10) begin
      b = $urandom_range(0,(2**N)-1);
      a= $urandom_range(b,(2**N)-1);
      #1
      $display("%d - %d = %d",a,b,diff);
    end
    
  end
  
  
endmodule