module ClockDivider(cin, cout);

// Based on code from fpga4students.com
// cin is the input clock; if from DE10-lite,
// the input clock will be at 50 MHz
// The clock divider counts 50 million cycles of the input clock
// before resetting, i.e., it ressets once per second
// The output is zero for the first half of the 50 million cycles
// and 1 for the second half, i.e., it is now a 1 Hz clock

input cin;
output cout;

reg[31:0] count = 32'd0;
parameter D = 32'd50000000;

always @(posedge cin)
begin  
    count <= count + 32'd1;
    if (count >= D-1)
        count <= 32'd0;
end

// A ? B : C 
// if A is true, return B, else return C

assign cout = (count < D/2) ? 1'b0 : 1'b1; //half a second it is 0, other half it is 1

endmodule