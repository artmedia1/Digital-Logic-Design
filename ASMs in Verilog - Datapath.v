module datapath (clk, t0, t1, status, y);

input clk;
input t0;
input t1;
output reg status;
output reg y;
reg[2:0] r;

always @(posedge clk)
begin
    if (t0 == 1)
    begin
        r <= 3'd0;
    end

    if (t1 == 1)
    begin
        r <= r + 3'd1;
    end

    if (r == 3'd4)
    begin
        status <= 1;
        y <= 1;
    end
    else
    begin
        status <= 0;
        y <= 1;
    end

end

endmodule