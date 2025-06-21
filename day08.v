/* Developed Modules
1. HalfEvenHalfOdd

*/


module heho(input clk,rst,output reg [7:0]cnt);
  
  always@(posedge clk or posedge rst) begin
    
    if(rst) cnt<=0;
    else begin
      if(cnt==99) cnt<= 0;
      else if(cnt==50) cnt<=51;
      else cnt <= cnt +2;
    end
    
  end
  
endmodule


module mod5(input clk,rst,output reg [2:0]cnt);
  
  always @(posedge clk or posedge rst) begin
    if(rst) cnt<=0;
    else begin
      if(cnt ==4) cnt<=0;
      else cnt<= cnt + 1;
    end
  end
  
endmodule



module repeater5(input clk,rst,output reg [2:0]cnt);
  
  reg [2:0] icnt;
  
  always@(posedge clk or posedge rst) begin
    if(rst) icnt<=0;
    else if(icnt==4) icnt<=0;
    else icnt <= icnt+1;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) cnt<=0;
    else begin
      if(icnt==4) begin
        if(cnt==4) cnt<=0;
        else cnt<= cnt+1;
      end
      else cnt<=cnt;
    end
  end
  
endmodule