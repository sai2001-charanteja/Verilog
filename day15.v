/* Developed Modules
1.Demux
2.DemuxN
*/

module demux(input y,s,output a,b);
  and G1(a,s,y);
  not G2(snot,s);
  and G3(b,snot,y);
  
endmodule

`define WIDTH(N) $clog2(N)+(N&(N-1)==0)
module demuxN#(parameter N=2)(input y,input [`WIDTH(N)-1:0]s,output reg [N-1:0]i);
  
  always@(*) begin
    i = {N{1'b0}};
    i[s] = y;
  end
  
endmodule