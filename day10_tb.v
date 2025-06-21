module tb;
  reg clk,rst;
  wire [3:0] hun,tens,units;
  
  htu htu_inst(clk,rst,hun,tens,units);
  
  always #2 clk = !clk;
  
  initial begin
    
    clk=0;rst=1;
    #2
    rst=0;
    
    #3000
    $finish;
    
  end
  
  initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
    
  end
  
endmodule