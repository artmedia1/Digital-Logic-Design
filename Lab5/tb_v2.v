// this is the testbench
// use special verilog commands to implement waveforms and
// evaluate outputs of the device under test

`timescale 1 ns/1 ps
// here 1 ns is the length of the "tick"
// 1 ps is the precision

module tb(); 

// specify the inputs and outputs within the testbench
// all inputs to the dut (device under test) are registers
reg clk;

// all outputs from the dut are wires
wire [3:0] r;

main dut(.clk(clk), .r(r))// a, b, c 
							 // say that our reg clk and wire r were reg x and wire y
							 // the .clk(), .r() notation mean that
							 // for main clk, use x, for main r, use y
// specify a test waveform
// if your waveform will only occur once, use an initial block to specify
// this will setup a clocj with 10ns high, 10 ns low, repeated forever
always //basically an infinite loop
begin
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#10;
end


always @(posedge clk)
begin

if (r > 4d'9)
	$display("Error: counter is greater than 9"); // If we assume what we intend to do with this counter
												  // is count up to 9 and reset

end

endmodule