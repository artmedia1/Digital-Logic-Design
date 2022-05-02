module debounce(clk, b, d);


// wait for change of state in button (0 to 1 or 1 to 0)
// when the state changes, relfect that change at the output and hold for 100 ms
// after 100ms, listen for new changes

// to implement a 100 ms timer, recall that the DE10-Lite clock operates at 50 Mhz
// that means there are 5000000 clock cycles in 100 ms
// we need a counter that counts up to 5000000

input clk; 			// clock
input b; 			// button signal from the board
output reg d = 0; 	// debounced output

reg [22:0] timer = 23'b0;			// log2(5000000) < 23
reg ignore = 0;						// ignore =  1 if we are waiting for the bounces to die down

always @(posedge clk) begin

// If i'm ignoring the button, then I should be incrementing the timer
// obviously if I'm ignoring the button, the output d shouldn't change
// but if I'm not ignoring the button (i.e. ready), then a change in b should be reflected in debounce
// and then we should activate "ignore" state

	if (ignore == 1) begin
		timer <= timer + 23'b1;
	end else if (d != b) begin
		 d <= b;
		 ignore <= 1;
	end

	// check whether the timer has run out
	
	if (timer  == 23'd5000000) begin
		timer <= 23'd0;
		ignore <= 0;
	end
end

endmodule