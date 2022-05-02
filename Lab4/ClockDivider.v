module ClockDivider(cin, cout, out_count);

// Based on code from fpga4students.com
// cin is the input clock; if from DE10-lite,
// the input clock will be at 50 MHz
// The clock divider counts 50 million cycles of the input clock
// before resetting, i.e., it ressets once per second
// The output is zero for the first half of the 50 million cycles
// and 1 for the second half, i.e., it is now a 1 Hz clock

input cin;
output cout;

output reg[4:0] out_count = 5'd24;
reg[31:0] count = 32'd0;

parameter D = 32'd50000000;
parameter zero_out_count = 5'd0;

always @(posedge cin)
begin  
    count <= 32'd0;
    if (count >= D-1) begin
        count <= 32'd0;
        if(out_count >= zero_out_count - 5'd1) begin
            out_count <= out_count - 5'd1;
			end
	 end	
end

assign cout = (count < D/2) ? 1'b0 : 1'b1;

endmodule