/* Developed Modules
1.DHMS
2.DHMS5Hz
*/

module dhms(input clk,rst,output reg [4:0] day,hr,output reg [5:0]min,sec);
  
  always@(posedge clk or posedge rst) begin
    if(rst) sec<=0;
    else sec <= sec==59?0:sec+1;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) min<=0;
    else if(sec==59) min <= min==59?0:min+1;
    else min<=min;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) hr<=0;
    else if({min,sec}=={6'd59,6'd59}) hr <= hr==23?0:hr+1;
    else hr<=hr;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) day<=1;
    else if({hr,min,sec}=={5'd23,6'd59,6'd59}) day <= day==30?1:day+1;
  end
  
endmodule


/*Think of 5Hz clock cycle. I have changed timescale to 0.2s/1ms*/

module dhms5Hz(input clk,rst,output reg [4:0] day,hr,output reg [5:0]min,sec);
  reg [2:0]incnt;
  
  always @(posedge clk or posedge rst)begin
    if(rst) incnt<=0;
    else incnt<= (incnt==4)?0:incnt+1;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) sec<=0;
    else if(incnt == 4) sec <= sec==59?0:sec+1;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) min<=0;
    else if({incnt,sec}=={3'd4,6'd59}) min <= min==59?0:min+1;
    else min<=min;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) hr<=0;
    else if({incnt,min,sec}=={3'd4,6'd59,6'd59}) hr <= hr==23?0:hr+1;
    else hr<=hr;
  end
  
  always@(posedge clk or posedge rst) begin
    if(rst) day<=1;
    else if({incnt,hr,min,sec}=={3'd4,5'd23,6'd59,6'd59}) day <= day==30?1:day+1;
  end
  
endmodule

