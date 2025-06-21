module tb;
  
  reg clk,rst;
  wire [2:0]cnt;
  
  
 // sandwich sandwich_inst(clk,rst,cnt);
  //updowncntr updowncntr_inst(clk,rst,cnt);
  updownrepeater updownrepeater_inst(clk,rst,cnt);
  always #5 clk = !clk;
  
	
  initial begin 
    
    clk=0; rst=1;
    #2
    rst=0;
    #2000
    $finish;
    
  end
  
  
  initial begin
    $dumpvars();
    $dumpfile("day9.vcd");
  end
  
endmodule