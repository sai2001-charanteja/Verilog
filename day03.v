/* Developed Modules
1. comp1
2. compN
3. mux
4. mux3
5. comp2

6. AddN
7. OnebitProcessor
8. Counting1s
9. muxN
10.fa
*/

`define WIDTH(N) $clog2(N)+(N &(N-1)==0)

module Counting1s #(parameter N =8)(input [N-1:0]a,output[`WIDTH(N)-1:0]res);
  
  wire [N-1:0][`WIDTH(N)-1:0] tempRes;
  genvar i;
  
  for(i=0;i<N;i=i+1) begin
    if(i==0) begin
      onebitProcessor #(.N(`WIDTH(N))) OP1(a[0],{`WIDTH(N){1'b0}},tempRes[0]);
    end
    else if(i!=N-1) begin
      onebitProcessor #(.N(`WIDTH(N))) OP2(a[i],tempRes[i-1],tempRes[i]);
    end
    else begin
      onebitProcessor #(.N(`WIDTH(N))) OP3(a[i],tempRes[i-1],res);
    end
      
  end
endmodule


module onebitProcessor #(parameter N = 2)(input a,input [N-1:0]curRes,output [N-1:0]res);
  wire [N-1:0] tempRes;
  addN #(.N(N)) A1(curRes,{{N-1{1'b0}}, 1'b1},tempRes);
  muxN #(.N(N)) M1(tempRes,curRes,a,res);
  
endmodule

module addN #(parameter N=1)(input [N-1:0]a,b,output [N-1:0]sum);
  //No need of last carry bit
  wire [N-1:0]cout;
  genvar i;
  for(i=0;i<N;i=i+1) begin
    if(i==0)fa F1(a[0],b[0],1'b0,sum[0],cout[i]);
    else fa F2(a[i],b[i],cout[i-1],sum[i],cout[i]);
  end
  
endmodule

module fa(input a,b,cin,output s,cout);
  xor P2(s,cin,a,b);
  xor P1(b1,a,b);
  and P3(b2,a,b);
  and P4(b3,cin,b1);
  or P5(cout,b2,b3);
endmodule

module muxN#(parameter N=2)(input [N-1:0]a,b,input s,output [N-1:0]y);
  
 // if(N==1) mux M1(a,b,s,y);
 // else begin
    genvar i;
    for(i=0;i<N;i=i+1) begin
      mux M1(a[i],b[i],s,y[i]);
    end
 // end
endmodule

module compN #(parameter N = 1)(input [N-1:0]a,b,output gt,eq,lt);

  generate
    if(N==1)comp1 C1(a[0],b[0],gt,eq,lt);
    else if(N%2==1) begin // THis method is mostly perfect binary tree but end of the days both methods call the same number of comp1 modules
      comp1 C1(a[N-1],b[N-1],gt1,eq1,lt1);
      compN #(.N(N-1)) CN1(a[N-2:0],b[N-2:0],gt2,eq2,lt2);
      mux3 M1({gt2,eq2,lt2},{gt1,eq1,lt1},eq1,{gt,eq,lt});
    end
    else begin
      compN #(.N(N/2))CN1(a[N-1:N/2],b[N-1:N/2],gt1,eq1,lt1);
      compN #(.N(N/2))CN2(a[N/2-1:0],b[N/2-1:0],gt2,eq2,lt2);
      mux3 M1({gt2,eq2,lt2},{gt1,eq1,lt1},eq1,{gt,eq,lt});
    end
	/*
    else begin
      //It is just like a skewed tree
      comp1 C1(a[N-1],b[N-1],gt1,eq1,lt1);
      compN #(.N(N-1)) CN1(a[N-2:0],b[N-2:0],gt2,eq2,lt2);
      mux3 M1({gt2,eq2,lt2},{gt1,eq1,lt1},eq1,{gt,eq,lt});
    end
    */
  endgenerate
endmodule



module comp2(input [1:0]a,b,output gt,eq,lt);
  
  comp1 C1(a[1],b[1],gt1,eq1,lt1);
  comp1 C2(a[0],b[0],gt2,eq2,lt2);
  mux3 M1({gt2,eq2,lt2},{gt1,eq1,lt1},eq1,{gt,eq,lt});
  
endmodule

module mux3(input [2:0]a,b, input s,output [2:0]y);
  mux M1(a[0],b[0],s,y[0]); //assign y = s?a:b;
  mux M2(a[1],b[1],s,y[1]);
  mux M3(a[2],b[2],s,y[2]);
endmodule

module mux(input a,b,s,output y); // by default input and ouput port are wires
  and P1(b1,s,a); //assign y = s?a:b;
  not P2(snot,s);
  and P3(b2,snot,b);
  or P4(y,b1,b2);
endmodule

module comp1(input a,b, output gt,eq,lt);
  not P1(anot,a);
  not P2(bnot,b);
  
  and P3(gt,a,bnot);
  and p4(lt,anot,b);
  and P5(b1,anot,bnot);
  and P6(b2,a,b);
  or P7(eq,b1,b2);
  
endmodule

