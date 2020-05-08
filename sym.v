//////////////////////////////////////////////////////////////////////////////////

module sym(A,B,C,I,Cout,clk);

     
    input [31:0] A;
    input [31:0] B;
    input [31:0] C;
    input [31:0] I; 
    //using I to pass I matrix
    output [31:0] Cout;
                                                  
    integer alpha = 1;
    integer beta = 1;
    input clk;
    real frequency;
    real t0;
    real t1;
    reg [31:0] Cout;
    reg [7:0] A1 [0:1][0:1];
    reg [7:0] B1 [0:1][0:1];
    reg [7:0] C1 [0:1][0:1];
    reg [7:0] I1 [0:1][0:1];
    reg [7:0] Cout1 [0:1][0:1]; 
    integer i,j,k;
    

    always@ (posedge clk)
    begin
    t0=$realtime;
    
        {A1[0][0],A1[0][1],A1[1][0],A1[1][1]} = A;
        {B1[0][0],B1[0][1],B1[1][0],B1[1][1]} = B;
        {C1[0][0],C1[0][1],C1[1][0],C1[1][1]} = C;
        {I1[0][0],I1[0][1],I1[1][0],I1[1][1]} = I;
        i = 0;
        j = 0;
        k = 0;
        {Cout1[0][0],Cout1[0][1],Cout1[1][0],Cout1[1][1]} = 32'd0;
       
        for(i=0;i < 2;i=i+1)
            for(j=0;j < 2;j=j+1)
                for(k=0;k < 2;k=k+1)
                    Cout1[i][j] = Cout1[i][j] + ((A1[i][k] * B1[k][j] * alpha)+ (C1[i][k] * I1[k][j] * beta));
                 
        Cout = {Cout1[0][0],Cout1[0][1],Cout1[1][0],Cout1[1][1]};     
        @(posedge clk) t1 = $realtime;
        frequency = 1.0e9 / (t1 - t0);
        $display("Frequency = %g", frequency);  
        $finish;     
    end 
    

endmodule
