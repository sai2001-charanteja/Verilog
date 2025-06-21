/*

module tb;
	`include "a2z.txt"
	reg clk,rst;
	reg [7:0]din;
	wire eureka;
	
	always #5 clk = !clk;
	seqDetect seqDetect_inst(clk,rst,din,eureka);
	initial begin 
		
		clk=0; rst=1;
		#2
		rst =0;
		
		@(posedge clk); din<= H;
		@(posedge clk); din<= O;
		@(posedge clk); din<= M;
		@(posedge clk); din<= E;
		@(posedge clk); din<= W;
		@(posedge clk); din<= O;
		@(posedge clk); din<= H;
		@(posedge clk); din<= H;
		@(posedge clk); din<= O;
		@(posedge clk); din<= M;
		@(posedge clk); din<= E;
		@(posedge clk); din<= W;
		@(posedge clk); din<= O;
		@(posedge clk); din<= R;
		@(posedge clk); din<= K;
	
		#100
		
		$finish;
	end
     initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end

endmodule
*/


/*
module tb;
	`include "a2z.txt"
	reg clk,rst;
	reg [7:0]din;
	wire eureka;
	
	always #5 clk = !clk;
	rara rara_inst(clk,rst,din,eureka);
	initial begin 
		
		clk=0; rst=1;
		#2
		rst =0;
		
		@(posedge clk); din<= R;
		@(posedge clk); din<= A;
		@(posedge clk); din<= R;
		@(posedge clk); din<= E;
		@(posedge clk); din<= A;
		@(posedge clk); din<= R;
		@(posedge clk); din<= A;
		@(posedge clk); din<= R;
		@(posedge clk); din<= A;
		@(posedge clk); din<= R;
		@(posedge clk); din<= A;
		@(posedge clk); din<= A;
		@(posedge clk); din<= R;
		@(posedge clk); din<= A;
		@(posedge clk); din<= R;
		
		#100
		
		$finish;
	end
	 initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end
endmodule
*/

module tb;
	reg clk,rst;
	reg din;
	wire eureka;
	
	always #5 clk = !clk;
	sd1x1 sd1x1_inst(clk,rst,din,eureka);
	initial begin 
		
		clk=0; rst=1;
		#2
		rst =0;
		
		repeat(20) begin
		din=$random;
		@(posedge clk);
		end
		
		#100
		
		$finish;
	end
  
  initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end

endmodule