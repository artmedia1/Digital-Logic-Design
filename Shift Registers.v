module shift(clk, in, r, clr, hold, load, r_in, in_left);

input clk;          // clock
input in;           // input on the right  //isn't it supposed to be on the left????
input in_left;      // input on the left
input clr;          // if 0, clear the contents of the register i.e. r<= 4'b0 -- asynchronous
input s1;           // command bit 1
input s0;           // command bit 0
input [3:0] r_in;   // store in r if load = 1
output reg[3:0] r;  // contents of the register

always @(posedge clk or negedge clr)
begin
    
    if (clr == 0)begin
        r <= 4'b0;
    end
    else begin
        
        // shift operations happen here
        // s1,s0: 00 = hold, 01 = shift right, 10 = shift left, 11 = load
        case({s1,s0})
            2'b00: r <= r;
            2'b01: r <= {in, r[3:1]} // so r[3] is now in and r[2:0] is now the previous r[3:1]
            2'b10: r <= {r[2:0], in_left} // so r[0] is now in_left and r[3:1] is the previous r[2:0]
            2'b11: r <= r_in;
        endcase
    end

end

endmodule