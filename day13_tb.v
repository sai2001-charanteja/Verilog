module tb;
  
  reg clk,rst;
  wire [4:0]day,hr;
  wire [5:0]min,sec;
  
  //dhms dhms_inst(clk,rst,day,hr,min,sec);
  dhms5Hz dhms5Hz_inst(clk,rst,day,hr,min,sec);
  always #0.5 clk = !clk;
  
  initial begin
    clk =0; rst = 1;
    #2
    rst = 0;
    
    #4000
    $finish;
    
  end
  initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end
endmodule