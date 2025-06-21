module tb;
	reg clk,rst;
	wire [2:0]cnt;
	
	always #5 clk = !clk;
	
	updown_4 updown_4_inst(clk,rst,cnt);
	
	initial begin
		clk=0; rst=1;
		#2
		rst=0;
		
		#2000
		$finish;
	end
 initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end

endmodule