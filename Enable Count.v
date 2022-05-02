module counter(clk, c, r); //this is the Enable Count

input clk;
input c; //count controller
output reg[3:0] r = 4'b0;

always @(posedge clk)
begin
    
    if (c == 1)
    begin
        r <= r + 4'b1;
    end
    
end

endmodule