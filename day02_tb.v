/*
module tb;
  reg [3:0]a,b;
  reg s;
  wire [3:0]y;
  
  mux4 mux4_inst(a,b,s,y);
  
  initial begin
 	a = 10;    b = 20;    s= 1;
    #2
    $display("MUX_4 a = %0d, b = %0d, s = %0d, y = %0d",a,b,s,y);
    
  end
  
  
endmodule

*/

/*
module tb;
  reg [3:0]a;
  wire [1:0]y;
  
  msbPE4x2 msbPE4x2_inst(a,y);
  
  initial begin
    
    repeat(10) begin
      a = $random();
      #2
      $display("msbPE4x2 a = %b, y = %b",a,y);
    end
  end
    
endmodule

*/


`define ISPOW2(N) (N&(N-1)==0)
`define WIDTH(N) $clog2(N)+`ISPOW2(N)

module tb;
  parameter N =  10;
  reg [N-1:0]a;
  wire [`WIDTH(N)-1:0]y;
  
  msbpeN #(.N(N))msbpeN_inst(a,y);
  
  initial begin
    
    repeat(100) begin
      a = $random();
      #2
      $display("msbpeN a = %b, y = %b",a,y);
    end
  end
    
endmodule