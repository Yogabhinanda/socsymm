module twotb;
reg [31:0] A[0:99][0:99];
reg [31:0] B[0:99][0:99];
reg [31:0] C[0:99][0:99];
reg clk;
wire [31:0] Co[0:99][0:99];

two uut(.A(A),.B(B),.C(C),.clk(clk),.Co(Co));
integer i,j,k,a,b;
integer m=100;
integer n=100;
initial begin
clk=1;
end
always
begin
#1 clk=~clk;
end
initial begin
	for (i = 0; i < m; i=i+1)
    begin
    for (j = 0; j < n; j=j+1)
    begin
        A[i][j] = ((i*j)/100) ;
        C[i][j] = ((i*j))/100;
        B[i][j] = ((i*j))/100 ;
    end
end
    
