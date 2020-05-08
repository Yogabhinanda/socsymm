module symtb();



    reg [31:0] A;
    reg [31:0] B;
    reg [31:0] C;
    reg [31:0] I;
    reg clk;
   
    wire [31:0] Cout;

   
    sym uut (
        .A(A), 
        .B(B), 
        .C(C),
        .I(I),
        .clk(clk),
        .Cout(Cout)
    );
    
    always #10 clk = !clk;
    initial begin
    clk=0;    
        
        A = 0;  B = 0; C = 0; I =0; #10;

        A = {8'd1,8'd1,8'd3,8'd4};
        B = {8'd5,8'd6,8'd2,8'd1};
        C = {8'd2,8'd1,8'd2,8'd4};
        
        I = {8'd1,8'd0,8'd0,8'd1};
       
   
    end
      
