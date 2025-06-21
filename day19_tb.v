module tb;
parameter N=10;
parameter M=8;
reg clk,rst,wr;
reg [M-1:0]din;
reg rd;
wire [M-1:0] dout;


fifo #(.N(N),.M(M))fifo_inst(clk,rst,wr,din,rd,dout);

always #5 clk = !clk;

initial 
	begin
		clk=0;rst=1;wr=0;rd=0;din=0;
		#2;
		rst=0;
	end

initial
	begin
	repeat(5) @(posedge clk);
	rd=1; @(posedge clk);rd=0;
	repeat(5) @(posedge clk);
	repeat(6)
		begin
			wr=1;din = $random;
			@(posedge clk);
			wr=0;
			repeat(1) @(posedge clk);
		end
	repeat(6)
		begin
		rd=1; @(posedge clk);
		rd=0; repeat(1) @(posedge clk);
		
		end
	repeat(12)
		begin
		
          wr=1;din = $random;
			@(posedge clk);
			wr=0;
			repeat(1) @(posedge clk);
		end
		
	repeat(N)
		begin
		rd=1; @(posedge clk);
		rd=0; repeat(1) @(posedge clk);
		
		end
	repeat(5) @(posedge clk);
	
	$finish;
	end
	

	 initial begin
    $dumpvars();
    $dumpfile("tb.vcd");
  end
	
endmodule