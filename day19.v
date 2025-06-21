/*Developed Modules
1.FIFO
*/

`define WIDTH(N) $clog2(N)+((N&(N-1))==0)
module fifo#(parameter N=10,M=10)(input clk,rst,wr,input [M-1:0]din,input rd,output reg [M-1:0] dout);

	reg [M-1:0]mem[N-1:0];
	//reg [`WIDTH(N)-1:0]rdptr,wrptr;
	reg [`WIDTH(N)-1:0]rdptr,wrptr;
	
	enum {EMPTY,PAR,FULL} state;
	
	// Main idea lies here rest is based on this
	always@(posedge clk or posedge rst) begin
		if(rst) state<=EMPTY;
		else begin
			case(state) 
				EMPTY	: state<= wr?PAR:state;
				PAR  	: begin
							 if(rd) begin
								if((rdptr==N-1 && wrptr == 0)||(rdptr+1==wrptr)) state<= EMPTY;
								else state<=state;
							 end
							 else if(wr) begin
								if((wrptr==N-1 && rdptr==0) || (wrptr+1==rdptr)) state<= FULL;
								else state<= state;
							 end
						end
				FULL 	: state<= rd?PAR:state;
			endcase
		end
	end
	
	always@(posedge clk or posedge rst) begin
		if(rst) wrptr<=0;
		else begin
			if(wr) begin
				case(state) 
					EMPTY,PAR	: wrptr<= (wrptr==N-1)?0:wrptr+1;
					FULL 		: wrptr<= wrptr;
				endcase
			end
			
		end
	end
	
	always@(posedge clk or posedge rst) begin
		if(rst) rdptr<=0;
		else begin
			if(rd) begin
				case(state) 
					EMPTY		: rdptr<=rdptr;
					FULL,PAR 	: rdptr<=(rdptr==N-1)?0:rdptr+1;
				endcase
			end
		end
	end

	always @(posedge clk or posedge rst) begin
		if(rst) begin:INITIALIZATION
			integer i;
			for(i=0;i<N;i=i+1) mem[i] <= {M{1'bz}};
		end	
		else begin
			case(state) 
				EMPTY	: if(wr) mem[wrptr]<= din;
				PAR		: if(wr) mem[wrptr]<=din;
						  else if(rd) mem[rdptr] <= {M{1'bz}};
				FULL 	: if(rd) mem[rdptr]<={M{1'bz}};
			endcase
		end
	end
	
	always @(posedge clk or posedge rst) begin
		if(rst) dout<= {M{1'bz}};
		else begin
			case(state) 
				EMPTY		: dout<={M{1'bz}};
				PAR,FULL 	: if(rd) dout<=mem[rdptr];
			endcase
		end
	end	
	
endmodule