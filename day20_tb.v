module tb;
reg [7:0][7:0]list;
wire [7:0][7:0]res;
`include "a2z.txt"
vowelElimination inst(list,res);

initial begin:INITIAL
	integer i;
	repeat(10) begin
		for(i=0;i<8;i=i+1) list[i]=$urandom_range(65,90);
		
		#1
		
		for(i=0;i<8;i=i+1) $write("%0c",list[i]);
		$write("--->");
		for(i=0;i<8;i=i+1) $write("%0c",res[i]);
		$write("--->");
		
		$display("%0b",inst.isVowel_out);
	end
end

endmodule