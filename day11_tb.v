/*
module tb;
  
  reg clk,rst,rhand;
  wire shand;
  integer i;
  rhandshand rhandshand_inst(clk,rst,rhand,shand);
  
  always #5 clk = !clk;
  
  initial begin
    clk = 0; rst= 1; rhand <=0;
    #2
    rst =0;
    
    repeat(10) begin
      
      i = $urandom_range(6,10);
      rhand <=1; @(posedge clk);
      rhand <=0;
      repeat(i) @(posedge clk);
      
      
    end
    #10
    $finish;
  end
  
  initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end
  
endmodule
*/


module tb;
  
  reg clk,rst,start;
  reg [7:0]din;
  wire dout;
  integer i;
  //piso piso_inst(clk,rst,start,din,dout);
  pisobaudrate pisobaudrate_inst(clk,rst,start,din,dout);
  always #5 clk = !clk;
  
  initial begin
    clk = 0; rst= 1; start <=0;
    #2
    rst =0;
    
    cycle(1);
    start<=1; din = 8'b10xz01xx;cycle(1); start<=0; cycle(15);
    cycle(1);
    start<=1; din = 8'b01x10xzx; cycle(1); start<=0; cycle(15);
    cycle(1);
    start<=1; din = 8'b01xx10xz; cycle(1);  cycle(15);start<=0;
    start<=1; din = 8'b0011xxzz; cycle(1); start<=0; cycle(16);
    #10
    $finish;
  end
  
  initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end
  
  
  task automatic cycle(input integer cnt);
    repeat(cnt) @(posedge clk);
  endtask
  
endmodule