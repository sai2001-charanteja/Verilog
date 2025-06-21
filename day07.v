/* Developed Modules
1. HoursComp12
2. Hours12to24
*/


module hrsComp24(input[4:0]h1,input [5:0]m1,s1,input[4:0]h2,input [5:0]m2,s2,output wire gt,eq,lt);
  
  wire [16:0]t1,t2;
  assign t1 = {h1,m1,s1};
  assign t2 = {h2,m2,s2};
  assign gt = t1>t2;
  assign eq = t1==t2;
  assign lt = t1<t2;
  
endmodule

module hrs12to24(input [3:0]h12,input pm1,output [4:0]h24);
  
  assign t1 = h12 == 12;
  assign h24 = t1?(pm1?5'd12:5'd0):pm1?{1'b0,h12}+5'd12:{1'b0,h12};
  
endmodule
