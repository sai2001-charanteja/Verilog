module tb;

integer a,b;

initial 
	begin
	a=10;
	b=20;
	$display(a,b);
	a<=b;
	b<=a;
	$display("D:",a,b);
	$monitor("M:",a,b);
	
	end

endmodule