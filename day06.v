/* Developed Modules
1. maxmin
2. mmm
3. maxminN
*/

module maxmin(input [7:0]i1,i0,output [7:0]max,min);
  wire b1;
  assign b1 = i1>i0;
  assign max = b1?i1:i0;
  assign min = b1?i0:i1;
  
endmodule

module mmm(input [2:0][7:0]i,output [2:0][7:0]m);
  wire[2:0][7:0]temp;
  maxmin M1(i[0],i[1],temp[0],temp[1]);
  maxmin M2(i[2],temp[0],m[0],temp[2]);
  maxmin M3(temp[1],temp[2],m[1],m[2]);
  
endmodule


module maxminN#(parameter N=7,M=2)(input [M-1:0][N-1:0]list,output [M-1:0][N-1:0]res);
  
  wire [M-1:0][N-1:0]temp;
  if(M==2) maxmin M1(list[1],list[0],res[0],res[1]);
  else begin
    maxminN #(.N(N),.M(M-1)) MN1(list[M-2:0],temp[M-2:0]);
    maxmin M2(list[M-1],temp[0],res[0],temp[M-1]);
    maxminN #(.N(N),.M(M-1)) MN2(temp[M-1:1],res[M-1:1]);
  end
  
endmodule