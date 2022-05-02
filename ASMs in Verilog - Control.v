module control(clk, status, t0,t1);

input status;
input clk;
output t0, t1;

reg s;

// in state t0: next state is t1 always
// in state t1:
// t1 - status = 1: R == 4, next state is t0
// t1 - status = 0: R != 4, next state is t1 

always @(posedge clk)
begin
    // let s = 0  correspond to t0, s = 1 to t1
    if (s == 0)
        s <= 1;
    else // s == 1, state t1    
    begin
        if (status == 1)
            s <= 0;
        else
            s <= 1;
    end
end

assign t0 = ~s;
assign t1 = s;

endmodule