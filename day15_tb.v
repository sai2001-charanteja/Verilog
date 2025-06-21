/*
module tb;
  
  reg y,s;
  wire a,b;
  
  demux demux_inst(y,s,a,b);
  
  initial begin
    integer i;
    for(i=0;i<4;i=i+1)begin
      {s,y}=i;
      #2
      $display("y=%b,s=%b, a=%b,b=%b",y,s,a,b);
    end
  end
  
  
endmodule
*/
`define WIDTH(N) $clog2(N)+(N&(N-1)==0)
module tb;
  parameter N = 10;
  reg y;
  reg [`WIDTH(N)-1:0]s;
  wire [N-1:0]a;
  
  demuxN #(.N(N)) demux_inst(y,s,a);
  
  initial begin
    integer i;
    for(i=0;i<32;i=i+1)begin
      {s,y}=i;
      #2
      $display("y=%b,s=%b, a=%b",y,s,a);
    end
  end
  
  
endmodule