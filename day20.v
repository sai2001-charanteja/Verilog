/*Developed Modules
1. vowelElimination
*/


module vowelElimination(input [7:0][7:0]list,output [7:0][7:0]res);
	
	wire [7:0][7:0]temp1,temp2,temp3,temp4,temp5,temp6,temp7;
	wire[7:0] isVowel_out;
	
	isVowel V1(list[0],isVowel_out[0]);
	isVowel V2(list[1],isVowel_out[1]);
	isVowel V3(list[2],isVowel_out[2]);
	isVowel V4(list[3],isVowel_out[3]);
	isVowel V5(list[4],isVowel_out[4]);
	isVowel V6(list[5],isVowel_out[5]);
	isVowel V7(list[6],isVowel_out[6]);
	isVowel V8(list[7],isVowel_out[7]);
	
	mux8 M0({list[0],list[1],list[2],list[3],list[4],list[5],list[6],list[7]},
		{list[0],list[1],list[2],list[3],list[4],list[5],list[6],8'd0},
		isVowel_out[7],
		{temp1[0],temp1[1],temp1[2],temp1[3],temp1[4],temp1[5],temp1[6],temp1[7]}
	);
	
	mux8 M1({temp1[0],temp1[1],temp1[2],temp1[3],temp1[4],temp1[5],temp1[6],temp1[7]},
		{temp1[0],temp1[1],temp1[2],temp1[3],temp1[4],temp1[5],temp1[7],8'd0},
		isVowel_out[6],
		{temp2[0],temp2[1],temp2[2],temp2[3],temp2[4],temp2[5],temp2[6],temp2[7]}
	);
	
	mux8 M2({temp2[0],temp2[1],temp2[2],temp2[3],temp2[4],temp2[5],temp2[6],temp2[7]},
		{temp2[0],temp2[1],temp2[2],temp2[3],temp2[4],temp2[6],temp2[7],8'd0},
		isVowel_out[5],
		{temp3[0],temp3[1],temp3[2],temp3[3],temp3[4],temp3[5],temp3[6],temp3[7]}
	);
	
	mux8 M3({temp3[0],temp3[1],temp3[2],temp3[3],temp3[4],temp3[5],temp3[6],temp3[7]},
		{temp3[0],temp3[1],temp3[2],temp3[3],temp3[5],temp3[6],temp3[7],8'd0},
		isVowel_out[4],
		{temp4[0],temp4[1],temp4[2],temp4[3],temp4[4],temp4[5],temp4[6],temp4[7]}
	);
	
	mux8 M4({temp4[0],temp4[1],temp4[2],temp4[3],temp4[4],temp4[5],temp4[6],temp4[7]},
		{temp4[0],temp4[1],temp4[2],temp4[4],temp4[5],temp4[6],temp4[7],8'd0},
		isVowel_out[3],
		{temp5[0],temp5[1],temp5[2],temp5[3],temp5[4],temp5[5],temp5[6],temp5[7]}
	);
	
	mux8 M5({temp5[0],temp5[1],temp5[2],temp5[3],temp5[4],temp5[5],temp5[6],temp5[7]},
		{temp5[0],temp5[1],temp5[3],temp5[4],temp5[5],temp5[6],temp5[7],8'd0},
		isVowel_out[2],
		{temp6[0],temp6[1],temp6[2],temp6[3],temp6[4],temp6[5],temp6[6],temp6[7]}
	);
	
	mux8 M6({temp6[0],temp6[1],temp6[2],temp6[3],temp6[4],temp6[5],temp6[6],temp6[7]},
		{temp6[0],temp6[2],temp6[3],temp6[4],temp6[5],temp6[6],temp6[7],8'd0},
		isVowel_out[1],
		{temp7[0],temp7[1],temp7[2],temp7[3],temp7[4],temp7[5],temp7[6],temp7[7]}
	);
	
	mux8 M7({temp7[0],temp7[1],temp7[2],temp7[3],temp7[4],temp7[5],temp7[6],temp7[7]},
		{temp7[1],temp7[2],temp7[3],temp7[4],temp7[5],temp7[6],temp7[7],8'd0},
		isVowel_out[0],
		{res[0],res[1],res[2],res[3],res[4],res[5],res[6],res[7]}
	);
endmodule

module isVowel(input [7:0]letter,output s);
	`include "a2z.txt"
	assign s = (letter == A||letter == E||letter == I||letter == O||letter == U)?1'b0:1'b1;
	//initial #1 $display("%0c, %0b",letter,s);
endmodule


module mux8(input [7:0][7:0]a,b,input s,output [7:0][7:0]res);
	
	genvar i;
	for(i=0;i<8;i=i+1) begin
		assign res[i]= s?a[i]:b[i];
	end
	
endmodule


