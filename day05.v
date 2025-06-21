/* Developed Modules
1.bcd2bin
2.bin2bcd
3.diff
*/

module diff#(parameter N= 1) (input [N-1:0]a,b, output [N-1:0]diff);
  
  wire[N-1:0]cio;
  genvar i;
  generate 
    for(i=0;i<N;i=i+1) begin
      if(i==0) fa F1(a[i],~b[i],1'b1,diff[i],cio[i]);
      else fa F2(a[i],~b[i],cio[i-1],diff[i],cio[i]);
    end
    
  endgenerate
endmodule

module fa(input a,b,cin,output s,cout);
  wire b1,b2,b3;
  xor M1(s,a,b,cin);
  xor M2(b1,a,b);
  and M3(b2,a,b);
  and M4(b3,cin,b1);
  or M5(cout,b2,b3);
  
endmodule


module bcd2bin(input [7:0]bcd,output [6:0]bin);
  wire [6:0]tensProd;
  assign tensProd ={{2{1'b0}},bcd[7:4]}*6'd10;
 // assign bin = tensProd+ {{2{1'b0}},bcd[3:0]};
 
  assign bin = bcd[7:4]*10+ bcd[3:0];
endmodule


module bin2bcd(input [4:0]bin,output reg [7:0]bcd);
  
  always @(*) begin
    if(bin>29) begin
      bcd[7:4] <= 3;
      bcd[3:0] <= bin-30;
    end
    else if(bin>=19) begin
      bcd[7:4] <= 2;
      bcd[3:0] <= bin-20;
    end
    else if(bin>=9) begin
      bcd[7:4] <= 1;
      bcd[3:0] <= bin-10;
    end
    else begin
      bcd[7:4] <= 0;
      bcd[3:0] <= bin;
    end
    
  end
  
endmodule