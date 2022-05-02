module project(clk, d_in, enable, rst, d_out);

//edge triggered D flip flop
// with enable
// and asynchronous registers

reg d; //can be extended reg[7:0] d;
input clk, d_in, enable, rst;
//can be extended [7:0] d_in;
output d_out; //can be extended [7:0] d_out;

assign d_out = d;

//always keyword in verilog
// usually looks like this:
// always@(sensitivity list)
// begin
//  (assignments when anything in the sensitivity list changes)
// end
// use posedge in the sensitivity list to specify the rising edge
// can also use negedge

// if enable = 0, the flip flop holds it's value
// and doesn't change with the clock
// however, if enable is 1, the flip flop assigns d_in to d
// at every clock rising edge

always @(posedge clk or posedge rst)
begin
    // notice that I didn't say "assign"
    // two "=" type operators: = , <=
    // <= operator is "nonblocking" - verilog will try to make all
    // <= operators happen simultaneously
    // whenever you are in posedge block, use <= to assign 
    // values to registers
    if (rst == 1)
        d <= 0; //can be extended d<= 8'd0; 8 bits worth of decimal 0
    else
    begin
        if (enable == 1)
            d <= d_in; // if enable == 1, store new data in d
    // can also do d = d_in in this case, but <= is better
end
// verilog is a hardware description language
// it is not a functional programming language
// when Verilog is compiled, the compiler is trying to
// create a circuit to implement what it thinkgs you want

endmodule


// This 2nd part shows how to assign d with multiple bits and also that we do not need the outputs

module project(clk, d_in, enable, rst, d);


output reg[7:0] d;
input clk, enable, rst;
input [7:0] d_in;



always @(posedge clk or posedge rst)
begin

    if (rst == 1)
        d <= 8'd0; 
    else
    begin
        if (enable == 1)
            d <= d_in; 
end
endmodule