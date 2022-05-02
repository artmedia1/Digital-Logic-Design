module multiplier(A, B, clk, out);

input [3:0] A;
input [3:0] B;
input clk;
output reg[3:0] out;

// reg[3:0] S;
// reg[3:0] R;

// reg[1:0] state = 2'b00;

// always @(posedge clk) begin

//     case (state)
//         2'b00: begin
//             R <= 4'b0;
//             S <= 4'b0;
//         end
//         2'b01: begin
//             R <= R + B;
//             S <= S + 1;
//         end
//         2'b11: out <= R;
//     endcase
//     state[0] <= 1;
//     state[1] <= (state[1] | (S < A));

// end

// Verilog allows you to do the following instead of the above:

always @(posedge clk)
begin
    out <= A * B;
end



endmodule