/*Developed Modules
1.RhandShand
2.PISO - Parallel in Serial out
3.PISO Baudrate
*/

module rhandshand(input clk,rst,rhand,output shand);
  
  reg [2:0]cnt;
  always@(posedge clk or posedge rst)begin
    if(rst) cnt<=0;
    else begin
      if(cnt==0) begin
        cnt<= rhand?1:cnt;
      end
      else cnt<= (cnt==6)?0:cnt+1;
    end
  end
  
  assign shand = (cnt==6);
endmodule


module piso(input clk,rst,start, input[7:0]din,output reg dout);
  
  reg [3:0] cnt;
  
  always @(posedge clk or posedge rst) begin
    if(rst) cnt<=0;
    else begin
      if(cnt==0) begin
        cnt<= start?1:cnt;
      end
      else cnt<=(cnt==8)?0:cnt+1;
    end
  end
  
  always @(*) begin
    if(cnt!=0) begin
      dout<= din[8-cnt];
    end
    else dout<= 1'bx;
  end
  
endmodule

module pisobaudrate(input clk,rst,start,input [7:0]din,output reg dout);
  
  reg [4:0] cnt;
  
  always@(posedge clk or posedge rst) begin
    if(rst) cnt<=16;
    else begin
      if(cnt==16) cnt<= start?0:cnt;
      else cnt<= cnt+1;
    end
  end
  
  always @(*) begin
    if(cnt!=16) begin
      dout<= din[7-(cnt>>1)];
      //dout <= din[cnt[3:1]];
    end
    else dout<=1'bx;
  end
  
endmodule

/*
00000
00001
00010
00011
00100
00101
00110
00111
01000
01001
01010
01011
01100
01101
01110
01111
*/