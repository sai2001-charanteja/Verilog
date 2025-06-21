/* Developed Modules
1.mulN
*/

module mulN #(parameter N = 2)(input [N-1:0]a,b,output [2*N:0]res);
  
  wire [N-1:0][2*N:0]row;
  wire [N-1:0][2*N:0]shiftrow;
  wire [N-2:0][2*N:0] partialProd;
  
  genvar i,j;
  
  for(i=0;i<N;i=i+1) begin
    
    assign row[i][2*N:N] = {(N+1){1'b0}};
    
    for(j=0;j<N;j=j+1) begin
      assign row[i][j] = a[j]&b[i];
    end
    
    assign shiftrow[i] = row[i]<<i;
      
    if(i==N-1) begin
      assign res = shiftrow[i]+partialProd[i-1];
    end
    else if(i!=0) begin
      assign partialProd[i] = shiftrow[i] + partialProd[i-1];
    end
    else assign partialProd[i] = shiftrow[i];
  end
  
  
  
endmodule

/*
module mulN #(parameter N = 2)(input [N-1:0] a, b, output [2*N:0] res);

  wire [2*N:0] row [N-1:0];
  wire [2*N:0] shiftrow [N-1:0];
  wire [2*N:0] partialProd [N-2:0];

  genvar i, j;
  generate
    for (i = 0; i < N; i = i + 1) begin : gen_rows
      // Generate row
      for (j = 0; j < N; j = j + 1) begin : gen_bits
        //assign row[i][j] = a[j] & b[i];
        and G1(row[i][j],a[j],b[i]);
      end
      assign row[i][2*N:N] = {(N+1){1'b0}};  // Padding zeros
      assign shiftrow[i] = row[i] << i;

      if (i == 0) begin : gen_first
        assign partialProd[0] = shiftrow[0];
      end
      else if (i < N-1) begin : gen_mid
        assign partialProd[i] = shiftrow[i] + partialProd[i-1];
      end
      else begin : gen_last
        assign res = shiftrow[i] + partialProd[i-1];
      end
    end
  endgenerate
endmodule
*/