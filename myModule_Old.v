module myModule(clk, count);

//use clock divier to generate a 1-second pulse
// A counter wioll count 0, 1, ....., 9 every second
// and then reset to 0
// count, as a binary number, will be provided
// directly to output

input clk;
output reg[3:0] count = 4'd0;

wire c_out;

ClockDivider cd(clk, c_out);

//This is a bad idea
// do not have "dependent clocks"
// in fact, the best thing to do is to have only one
// always @ block depoendent on the clock
// if you don't, you will run into all kinds of
// synchronization troubles

always @(posedge c_out)
begin  
    count <= count + 4'd1;
    if (count >= 9)
        count <= 4'd0;
end