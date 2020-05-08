//////////////////////////////////////////////////////////////////////////////////

module symmat2(Aout,Bout,Cout,Yo_ab,Yo_c,Yout,clk);
    input [31:0] Aout,Bout,Cout;
    input clk;
    integer y1,d_ab,d_c=0;
    
    output [31:0] Yo_ab,Yo_c,Yout;
    reg [31:0] Yo_ab;
    reg [31:0] Yo_c;
    reg [31:0] Yout;
    integer alpha = 1;
    integer beta = 1;
    initial begin
    Yo_ab=0;
    Yo_c=0;
    end
    always@(posedge clk)
    begin
        if(y1<100)
        begin
        d_ab = d_ab + Aout*Bout;
        Yo_c = Cout*beta;
        end
        else
        begin
            Yo_ab = d_ab;
            d_ab = 0;
        end
        end
         
endmodule

