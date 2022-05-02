module main(clk, r);

input clk;
output reg[3:0] r = 4'd0;

always @(posedge clk)
begin

	if(r == 4'd9)
		r <= 4'd0;
	else
		r <= r + 4'd1;
end

endmodule