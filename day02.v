/* Developed Modules 
1. mux
2. mux4
3. mux2
4. msbPE4x2
5. muxN
6. msbpeN
*/
`define ISPOW2(N) (N&(N-1)==0)
`define WIDTH(N) $clog2(N)+`ISPOW2(N)

module msbpeN #(parameter N = 2)(input [N-1:0]a,output [`WIDTH(N)-1:0]y);
  wire [N-1:0][`WIDTH(N)-1:0]b;
  
  genvar i;
  generate 
    for(i=0;i<N;i=i+1) begin
      if(i==0)
        muxN #(.N(`WIDTH(N)))M1(N-1-i,0,a[i],b[i]);
      else if(i!=N-1)
        muxN #(.N(`WIDTH(N)))M2(N-1-i,b[i-1],a[i],b[i]);
      else 
        muxN #(.N(`WIDTH(N)))M3(0,b[i-1],a[i],y);
    end
  endgenerate
  
endmodule

module muxN #(parameter N = 2)(input [N-1:0]a,b,input s,output [N-1:0]y);
  
  genvar i;
  generate
    for(i=0;i<N;i=i+1) begin
      mux M1(a[i],b[i],s,y[i]);
    end
  endgenerate
endmodule

module msbPE4x2(input [3:0]a,output [1:0]y);
  wire [1:0]b1,b2,b3;
  mux2 M1(2'b00,b1,a[3],y);
  mux2 M2(2'b01,b2,a[2],b1);
  mux2 M3(2'b10,b3,a[1],b2);
  mux2 M4(2'b11,2'b00,a[0],b3);
  
endmodule

module mux2(input [1:0]a,b, input s,output [1:0]y);
  mux M1(a[0],b[0],s,y[0]); //assign y = s?a:b;
  mux M2(a[1],b[1],s,y[1]);
endmodule

module mux4(input [3:0]a,b, input s,output [3:0]y);
  mux M1(a[0],b[0],s,y[0]); //assign y = s?a:b;
  mux M2(a[1],b[1],s,y[1]);
  mux M3(a[2],b[2],s,y[2]);
  mux M4(a[3],b[3],s,y[3]);
endmodule

module mux(input a,b,s,output y); // by default input and ouput port are wires
  and P1(b1,s,a); //assign y = s?a:b;
  not P2(snot,s);
  and P3(b2,snot,b);
  or P4(y,b1,b2);
endmodule





