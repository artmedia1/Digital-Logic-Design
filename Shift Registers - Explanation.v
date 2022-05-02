//Shift Registers

// A register is just a collection of memory elements
// It's job is to hold binary information

//e.g an 8 bit register

reg[7:0] r; //access any element from r with the notation r[0], r[1], .... r[7]

// register is distinct from wire
wire[7:0] w; // wire stores nothing and must be continuously supplied with an output

// A shift reigster is a psecial kind of register that shifts data in and out on the clock

//e.g. a 4 bit shift reigster
// Say the initial contents of the register is 1011

reg[3:0] r2 = 4'b1011;

//create a 4-bit register with initial contents 1011
// that is r[3] = 1, r[2] = 0, r[1] = 1, r[0] = 1


// Let's have a binary input "in"
// Let in = 0
// On each clock cycle, the contents of r are shifted one bit to the right
// and the value in "in" is introduced to the leftmost bit

//rightmost bit gets dropped (1 gets dropped)
// initial: 1011
// 1 clk cycle: 0101 -> 1 gets dropped
// 2 clk cycle: 0010 -> 1 gets dropped
// 3 clk cycle: 0001 -> 0 gets dropped
// 4 clk cycle: 0000 -> 1 gets dropped
// from now on, with no changes to in, the register will stay 0000

// as another example, suppose r is initially 1011, but the sequence of in goes 0,1,1,0
// initial 1011
// 1 clk cycle: 0101
// 2 clk cycle: 1010
// 3 clk cycle: 1101
// 4 clk cycle: 0110