module symmat2tb;
   
    reg [31:0] Aout,Bout,Cout;
    reg[31:0] Yo_ab;
    reg[31:0] Yo_c;
    reg[31:0] Yout;
    reg clk;
    reg [31:0] Y_ab[0:10000];
    reg [31:0] Y_c[0:10000];
    reg [31:0] A[0:10000];
    reg [31:0] B[0:10000];
    reg [31:0] C[0:10000];
    
    integer i,m,k,y1,y2,n=0;
    
    symmat2 m3(Aout,Bout,Cout,Yo_ab,Yo_c,Yout,clk);
    
    initial begin
    clk=1;
    
    end
    
    always begin
#2.5  clk=~clk; end
    
    initial begin
         for(i=0;i<10000;i=i+1)
         begin
            A[i]=i+4;
            B[i]=i+4;
            C[i]=i+4;
         end  
         end 

    initial begin
    for(m=0;m<10000;m=m+1)
    begin
    for(k=0;k<10000;k=k+1)
    begin
        if(n <100)
            begin
 #5             y1= m + n;
                y2=100*y1 + m ;
                n=n+1;
                 Aout=A[y1];
                 Bout=B[y2];
                 Cout=C[y1];
                Y_ab[m]=Yo_ab;
                 Y_c[m]=Yo_c;
            end
            else begin
                n=0;
            end
    end
    end
    end
    
endmodule
