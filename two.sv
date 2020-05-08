module two(A,B,C,Co,clk
      );
	integer alpha=1;
    integer beta=2;
    shortint m=20;
    shortint n=20;
    output [31:0] Co[0:99][0:99];
	input [31:0] A[0:99][0:99];
	input [31:0] B[0:99][0:99];
	input [31:0] C[0:99][0:99];
    input clk;
    
	integer i =0;
	integer j =0;
	integer a=0;
	integer b=0;
	integer k=0;
	
	reg [31:0] Co[0:99][0:99];
    reg [31:0] D[0:99][0:99];
    
    always@(posedge clk)
    begin
    
	for (a=0;a<100;a=a+1)
	begin
	    for (b=0;b<100;b=b+1)
	    begin
	       D[a][b] = C[a][b]*beta;
	    end
	end
	

    for (i = 0;i < 100;i=i+1)
    begin
        for (j = 0;j < 100;j=j+1)
    begin
        for (k = 0;k < 100;k=k+1)
    begin
          Co[i][j] = D[i][j] + ((A[i][k]*B[k][j])*alpha);
    end
    end
    end
    
    $finish;
    end
endmodule



