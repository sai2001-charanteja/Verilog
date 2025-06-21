module tb;

reg clk,rst,ra,rb,rc,rd;
wire [1:0]floor;


liftasm liftasm_inst(clk,rst,ra,rb,rc,rd,floor);
	
always #5 clk = !clk;

initial begin
	
	clk=0; rst=1;#2
	rst=0; {ra,rb,rc,rd} = 0;
	
	repeat(100) begin
		@(posedge clk);
		{ra,rb,rc,rd} = $random;
	end
	#20
	$finish;
end

initial begin
	$dumpvars();
	$dumpfile("tb.vcd");

end

endmodule