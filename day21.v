/*Developed Modules
1.Liftasm -Using ASM, casex, case(1)

*/

module liftasm(input clk,rst,ra,rb,rc,rd,output reg [1:0]floor);

	enum {A,BU,BD,CU,CD,D} state,state1;
	always@(posedge clk or posedge rst) begin
		if(rst)begin
			 state<= A;
			 state1<= A;
		end
		else begin
		 `ifndef METHOD1_CASEX
			case(state1)
				A: 
					begin
						casex({ra,rb,rc,rd})
							4'b1xxx: state1<= A;
							4'b01xx: state1<= BU;
							4'b001x: state1<= CU;
							4'b0001: state1<= D;vi
							4'b0000: state1<= state1;
						endcase
					end
				BU:
					begin
						casex({rb,rc,rd,ra})
							4'b1xxx: state1<= BU;
							4'b01xx: state1<= CU;
							4'b001x: state1<= D;
							4'b0001: state1<= A;
							4'b0000: state1<= state1;
						endcase
					end
				BD:
					begin
						casex({rb,ra,rc,rd})
							4'b1xxx: state1<= BD;
							4'b01xx: state1<= A;
							4'b001x: state1<= CU;
							4'b0001: state1<= D;
							4'b0000: state1<= state1;
						endcase
					end
				CU:
					begin
						casex({rc,rd,rb,ra})
							4'b1xxx: state1<= CU;
							4'b01xx: state1<= D;
							4'b001x: state1<= BD;
							4'b0001: state1<= A;
							4'b0000: state1<= state1;
						endcase
					end
				CD:
					begin
						casex({rc,rb,ra,rd})
							4'b1xxx: state1<= CD;
							4'b01xx: state1<= BD;
							4'b001x: state1<= A;
							4'b0001: state1<= D;
							4'b0000: state1<= state1;
						endcase
					end
				D:
					begin
						casex({rd,rc,rb,ra})
							4'b1xxx: state1<= D;
							4'b01xx: state1<= CD;
							4'b001x: state1<= BD;
							4'b0001: state1<= A;
							4'b0000: state1<= state1;
						endcase
					end
				default: state1<= state1;
			endcase
			
		`endif
		
		`ifndef METHOD2
			
			case(state) 
				
				A:
					case(1)
					ra : state<= A;
					rb : state<= BU;
					rc : state<= CU;
					rd : state<= D;
					endcase
				BU:
					case(1)
					rb : state<= BU;
					rc : state<= CU;
					rd : state<= D;
					ra : state<= A;
					endcase
				BD:
					case(1)
					rb : state<= BD;
					ra : state<= A;
					rc : state<= CU;
					rd : state<= D;
					endcase
				CU:
					case(1)
					rc : state<= CU;
					rd : state<= D;
					rb : state<= BD;
					ra : state<= A;
					endcase
				CD:
					case(1)
					rc : state<= CD;
					rb : state<= BD;
					ra : state<= A;
					rd : state<= D;
					endcase
				D:
					case(1)
					rd : state<= D;
					rc : state<= CD;
					rb : state<= BD;
					ra : state<= A;
					endcase
			endcase
		
		`endif
		end
		
	end
	
	always_comb begin
		case(state)
			A: floor<= 0;
			BU,BD: floor<=1;
			CU,CD: floor<=2;
			D: floor<=3;
		endcase
	end
	
endmodule