
/*Developed Modules
1.seqDetect - homework
2.RARA
*/
`include "a2z.txt"
module seqDetect(input clk,rst,input [7:0]din,output eureka);
	
	
	enum {SH,SO,SM,SE,SW,SO2,SR,SK,NONE} state;
	always@(posedge clk or posedge rst) begin
		if(rst) state <=NONE;
		else begin
			case(state)
				NONE: state<=(din == H)?SH:state;
				SH: begin
					case(din)
						H:state<=state;
						O:state<=SO;
						default : state<=NONE;
					endcase
				end
				SO: begin
					case(din)
						H:state<=SH;
						M:state<=SM;
						default : state<=NONE;
					endcase
				end
				SM: begin
					case(din)
						H:state<=SH;
						E:state<=SE;
						default : state<=NONE;
					endcase
				end
				SE: begin
					case(din)
						H:state<=SH;
						W:state<=SW;
						default : state<=NONE;
					endcase
				end
				SW: begin
					case(din)
						H:state<=SH;
						O:state<=SO2;
						default : state<=NONE;
					endcase
				end
				SO2: begin
					case(din)
						H:state<=SH;
						R:state<=SR;
						default : state<=NONE;
					endcase
				end
				SR: begin
					case(din)
						H:state<=SH;
						K:state<=SK;
						default : state<=NONE;
					endcase
				end
				SK: begin
					case(din)
						H:state<=SH;
						default : state<=NONE;
					endcase
				end
				
			endcase
		
		end
	end

	assign eureka = (state==SK);
	
endmodule



module rara(input clk,rst,input [7:0]din,output eureka); //WithOverlapping

	enum {SR,SA,SR1,SA1,NONE} state;
	
	
	always @(posedge clk or posedge rst) begin
		if(rst) state<= NONE;
		else begin
			case(state)
				NONE: state<= (din==R)?SR:state;
				SR: case(din)
						R: state<=state;
						A: state<= SA;
						default: state<=NONE;
					endcase
				SA: case(din)
						R: state<=SR1;
						default: state<=NONE;
					endcase
				SR1: case(din)
						R: state<=SR;
						A: state<= SA1;
						default: state<=NONE;
					endcase
				SA1: case(din)
						R: state<=SR1;
						default: state<=NONE;
					endcase
			endcase
		end
	end
	
	assign eureka = (state==SA1);
endmodule

module sd1x1(input clk,rst,input din,output eureka); //with overlap

	enum {S1,S10,S11,S101,S111,NONE} state;
	
	always @(posedge clk or posedge rst) begin
		if(rst) state <= NONE;
		else begin
			case(state)
				NONE: state<= (din)?S1:state;
				S1: state<= din?S11:S10;
				S10: state<= din?S101:NONE;
				S11: state<=din?S111:NONE;
				S101: state<= din?S11:S10;
				S111: state<=din?S111:S10;
			endcase
		end
	end
	
	assign eureka = state==S101||state==S111;
	
endmodule