/* Developed Modules
1.SANDWICH COUNTER ex: mod5 and mod8
2. updowncntr
2.updownRepeater
*/

module sandwich(input clk,rst,output reg [2:0]cnt);
  
  enum {MOD5,MOD7} state;
  
  always@(posedge clk or posedge rst) begin
    if(rst) state<=MOD5;
    else begin
      case(state)
      	MOD5: state<=(cnt==4)?MOD7:state; 
      	MOD7: state<= (cnt==7)?MOD5:state; 
      endcase
    end
    
    
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) cnt<=0;
    else begin
      case(state)
        MOD5: cnt<=(cnt==4)?0:cnt+1;
        MOD7: cnt<=(cnt==7)?0:cnt+1;
      endcase
    end
    
  end
  
endmodule


module updowncntr(input clk,rst,output reg[2:0]cnt);
  
  enum {UP,DOWN} state;
  
  always @(posedge clk or posedge rst) begin
    if(rst) state<= UP;
    else begin
      case(state)
        UP: state <= cnt== 6?DOWN:UP;
        DOWN: state <= cnt==1?UP:DOWN;
      endcase
    end
  end
  
  
  always @(posedge clk or posedge rst) begin
    if(rst) cnt<=0;
    else begin
      case(state)
        UP: cnt<= cnt==6?7:cnt+1;
        DOWN: cnt<= cnt==1?0:cnt-1;
      endcase
    end
  end 
  
endmodule



module updownrepeater(input clk,rst, output reg [2:0]cnt);
  
  reg icnt;
  enum {UP,DOWN} state;
  
  always@(posedge clk or posedge rst) begin
    if(rst) icnt<=0;
    else icnt <= icnt+1;
  end
  
  always @(posedge clk or posedge rst) begin
    if(rst) state <= UP;
    else begin
      if(icnt==1) begin
        case(state)
        UP: state<=(cnt==6)?DOWN:UP;
        DOWN: state <= (cnt==1)?UP:DOWN;    
      endcase
      
      end
      else state <= state;
    end
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) cnt<=0;
    else begin
      if(icnt==1)begin
        case(state)
          UP: cnt<= (cnt==6)?7:cnt+1;
          DOWN:cnt<= (cnt==1)?0:cnt-1;
      endcase
      end
      else cnt<=cnt;
    end
  end
  
endmodule

