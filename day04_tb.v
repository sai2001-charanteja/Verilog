module tb;
  reg [4:0] tod;
  wire [4:0] tom;
  wire [4:0] dat;
  
  todtom todtom_inst(tod,tom);
  toddat toddat_inst(tod,dat);
  
  initial begin
    
    repeat(20) begin
      
      tod= $urandom_range(1,30);
      #1
      $display("Tod = %0d, Tom = %0d, Dat = %0d",tod,tom,dat);
      
    end
    
  end
  
endmodule