/* DEVELOPED MODULES

*/

module todtom(input [4:0]tod,output reg [4:0]tom);
  
  always @(tod) begin
    if(tod==30) tom<=1;
    else tom<= tod+1;
    
  end
  
endmodule


module toddat(input [4:0]tod,output reg [4:0]dat);
  
  always@(*) begin
    if(tod==30) dat<= 2;
    else if(tod==29) dat<=1;
    else dat<= tod+2;
  end
  
  /*
  wire [4:0]tom;
  todtom D1(tod,tom);
  todtom D2(tom,dat);
  */
endmodule