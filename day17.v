/*Developed Modules
1.updown_4
*/

module updown_4(input clk,rst,output reg [2:0]cnt);

	enum {UP,DOWN,F1,F2} state;
	
	always@(posedge clk or posedge rst) begin
		if(rst) state<=UP;
		else begin
			case(state)
				UP: state<= (cnt==6)?DOWN:UP;
				DOWN: if(cnt==5) state<= F1;
						else state<= (cnt==1)?UP:state;
				F1: state<= F2;
				F2: state <= DOWN;
			endcase
		end
	end

	always @(posedge clk or posedge rst) begin
		if(rst) cnt<=0;
		else begin
			if(cnt==7) cnt<=6;
			else if(cnt==0) cnt<=1;
			else begin
				case(state)
					UP: cnt<= cnt+1;
					DOWN: cnt<=cnt-1;
					F1: cnt<=4;
					F2: cnt<=3;
				endcase
			end
		end
	end
endmodule

