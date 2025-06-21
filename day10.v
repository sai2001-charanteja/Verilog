/* Developed Modules
1.HTU
*/

module htu(input clk,rst, output reg [3:0] hun,tens,units);
  
  always@(posedge clk or posedge rst) begin
    if(rst) units<=0;
    else units <= units==9?0:units+1;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) tens<=0;
    else begin
      if(units==9) tens<= (tens==9)?0:tens+1;
      else tens<= tens;
    end
  end
  
  always @(posedge clk or posedge rst)begin
    if(rst) hun<=0;
    else if({tens,units}=={4'd9,4'd9}) hun<= (hun==9)?0:hun+1;
    else hun<= hun;
  end
  
endmodule