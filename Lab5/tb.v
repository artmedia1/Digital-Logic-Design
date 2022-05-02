// this is the testbench
// use special verilog commands to implement waveforms and
// evaluate outputs of the device under test

`timescale 1 ns/1 ps
// here 1 ns is the length of the "tick"
// 1 ps is the precision

module tb(); 

// specify the inputs and outputs within the testbench
// all inputs to the dut (device under test) are registers
reg a;
reg b;

// all outputs from the dut are wires
wire c;

main dut(.a(a), .b(b), .c(c))// a, b, c 
							 // say that our reg a, b and wire c were reg x, y and wire z
							 // the .a(), .b(), .c() notation mean that
							 // for main a, use x, for main b, use y
							 // for main c, use z
// specify a test waveform
// if your waveform will only occur once, use an initial block to specify
initial
begin

	// specify how the values of a and b will change
	a = 0;
	b = 0;
	#20; // 20 ticks
	
	a = 0;
	b = 1;
	#20; // 20 ticks
	
	a = 1;
	b = 0;
	#20; // 20 ticks
	
	a = 1;
	b = 1;
	#20; // 20 ticks
	
	
end


endmodule