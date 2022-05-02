module counter(clk, c, t, l, i, r); //this is the Counter with load

// Important disclaimer, this is not tested on DE10-Lite

input clk;
input c; //count control
input t; //reset control
input l; //load control
input[3:0] i; // contains the input to be loaded
output reg[3:0] r = 4'b0;

always @(posedge clk)
begin
    
    if (t == 1)
    begin
        r <= 4'b0; //reset
    end
    else if (l == 1) //load
    begin
        r <= i;
    end

    if (c == 1) // count
    begin
        r <= r + 4'b1;
    end
    
end

endmodule