module tb;
  
  reg clk ,rst;
 // wire [7:0]cnt;
  wire [2:0]mod5cnt;
  
  always #5 clk = !clk;
 // heho heho_inst(clk,rst,cnt);
  //mod5 mod5_inst(clk,rst,mod5cnt);
  repeater5 repeater5_inst(clk,rst,mod5cnt);
  initial begin
    
    clk =0;rst = 1;
    #2
    rst =0;
    
    //$wait(cnt>=100);
    #2000
    $finish;
    
  end
  
  initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end
  
endmodule