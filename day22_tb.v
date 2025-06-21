module tb;

reg clk,rst,rboss,reng,rboy;
wire [1:0]usingby;


printerASM printerASM_inst(clk,rst,rboss,reng,rboy,usingby);
	
always #5 clk = !clk;

initial begin
	
	clk=0; rst=1;#2
	rst=0; {rboss,reng,rboy} = 0;
	
	repeat(100) begin
		@(posedge clk);
		{rboss,reng,rboy} = $random;
	end
	#20
	$finish;
end

initial begin
	$dumpvars();
	$dumpfile("tb.vcd");

end

endmodule