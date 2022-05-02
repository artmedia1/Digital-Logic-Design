// this is the testbench
// use special verilog commands to implement waveforms and
// evaluate outputs of the device under test

`timescale 1 ns/1 ps
// here 1 ns is the length of the "tick"
// 1 ps is the precision

module test2_tb(); 

// specify the inputs and outputs within the testbench
// all inputs to the dut (device under test) are registers
reg clk;
reg a;
reg continue = 0;
reg [15:0] tester = 16'd0;

// all outputs from the dut are wires
wire [3:0] r;

test2 dut(.clk(clk), .a(a), .r(r)); // a, b, c 
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
	tester <= tester + 16'd2;
	
	if(continue == 0 && clk == 1'b1) begin
		
		if(tester < 4'd10) begin
			a <= 0;
			if(r == 4'd0)
				$display("All outputs are zero at time: %0t",$time, " ps");
		end
	
		if(tester > 16'd10 && tester < 16'd30) begin
			a <= 1;
			if(r == 4'd0)
				$display("All outputs are zero at time: %0t",$time, " ps");
		end
		
		if(tester > 30) begin
			a <= 0;
			continue <= 1;
			if(r == 4'd0)
				$display("All outputs are zero at time: %0t",$time, " ps");
		end
		
	end
	
	else if (clk == 1'b1) begin
		if(r == 4'd0)
			$display("All outputs are zero at time: %0t",$time, " ps");
	end
	
end
endmodule