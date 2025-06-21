/*Developed Modules
1.PrinterProblem
*/


module printerASM(input clk,rst,rboss,reng,rboy,output reg [1:0] usingby);
  
  enum {B,E,Y,BRU,ERU,YRU} state;
  
  always@(posedge clk or posedge rst) begin
    
    if(rst) state<= YRU;
    else begin
      
      case(state) 
        B: 
          case(1)
            rboss: state <= B;
            reng: state <= E;
            rboy: state <= Y;
            default: state <= BRU;
          endcase
        E:
          case(1)
            reng: state <= E;
            rboy: state <= Y;
            rboss: state <= B;
            default: state <= ERU;
          endcase
        Y:
          case(1)
            rboy: state <= Y;
            rboss: state <= B;
            reng: state <= E;
            default: state <= YRU;
          endcase
        BRU:
          case(1)
            reng: state <= E;
            rboy: state <= Y;
            rboss: state <= B;
            default: state <= BRU;
          endcase
        ERU:
          case(1)
            rboy: state <= Y;
            rboss: state <= B;
            reng: state <= E;
            default: state <= ERU;
          endcase
        YRU:  
           case(1)
            rboss: state <= B;
            reng: state <= E;
             rboy: state <= Y;
            default: state <= YRU;
          endcase
      endcase
      
    end
    
  end
  
  always_comb begin
	
    case(state)
		B: usingby <=1;
      	E: usingby <= 2;
      	Y: usingby <= 3;
      	BRU,ERU,YRU: usingby <= 0;
    endcase
    
  end
  
endmodule