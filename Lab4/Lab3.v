module Lab3(a0,a1,s,result,b,c, negativeSign);

	input [3:0] a0;
	input [3:0] a1;
	input s;
	reg cin1, temp;
	wire wire1, wire2, wire3, wire4, logic1, logic2, logic3, logic4;
	wire [3:0] sum;
	output [6:0] b;
	output [6:0] c;
	output [6:0] result;
	output [2:0] negativeSign;
	//a0[3] is least significant bit, a0[0] is most significant bit
	//fulladder adder1(a0[3], a1[3], cin, sum[3], wire1);
	//fulladder adder2(a0[2], a1[2], wire1, sum[2], wire2);
	//fulladder adder3(a0[1], a1[1], wire2, sum[1], wire3);
	//fulladder adder4(a0[0], a1[0], wire3, sum[0], cout);

    xor(logic1, s, a1[3]);
    xor(logic2, s, a1[2]);
    xor(logic3, s, a1[1]);
    xor(logic4, s, a1[0]);
	 
    
    //a0,a1,carry_in,s,carry_out    
    fulladder fa0(a0[3],logic1,s,wire1);
	 
	 assign sum[3] = (a0[3] ^ logic1 ^ s);
	 
    fulladder fa1(a0[2],logic2,wire1,wire2);
	 
	 assign sum[2] = (a0[2] ^ logic2 ^ wire1);
	 
    fulladder fa2(a0[1],logic3,wire2,wire3);
	 
	 assign sum[1] = (a0[1] ^ logic3 ^ wire2);
	 
    fulladder fa3(a0[0],logic4,wire3,wire4);
	 
	 assign sum[0] = (a0[0] ^ logic4 ^ wire3);
	 
	 xor(logic5, s, wire4);
	
	assign negativeSign[2] = (wire4 & s);
	assign negativeSign[1] = (wire4 & ~s);
	assign negativeSign[0] = (wire4 & ~s);
	 


	assign b[0] = (~a0[0]&a0[1]&~a0[2]&~a0[3]) | (a0[0]&~a0[1]&a0[2]&a0[3]) | (a0[0]&a0[1]&~a0[2]&a0[3]) + (~a0[0]&~a0[1]&~a0[2]&a0[3]);
	
	assign b[1] = (~a0[0]&a0[1]&~a0[2]&a0[3]) | (a0[0]&a0[1]&~a0[3]) | (a0[0]&a0[2]&a0[3]) | (a0[1]&a0[2]&~a0[3]);
	
	assign b[2] = (~a0[0]&~a0[1]&a0[2]&~a0[3]) | (a0[0]&a0[1]&a0[2]) | (a0[0]&a0[1]&~a0[3]); 
	
	assign b[3] = (~a0[0]&~a0[1]&~a0[2]&a0[3]) | (~a0[0]&a0[1]&~a0[2]&~a0[3]) | (~a0[0]&a0[1]&a0[2]&a0[3]) | (a0[0]&~a0[1]&a0[2]&~a0[3]) | (a0[0]&a0[1]&a0[2]&a0[3]);
	
	assign b[4] = (~a0[0]&~a0[1]&~a0[2]&a0[3]) | (~a0[0]&~a0[1]&a0[2]&a0[3]) | (~a0[0]&a0[1]&~a0[2]&~a0[3]) | (~a0[0]&a0[1]&~a0[2]&a0[3]) | (~a0[0]&a0[1]&a0[2]&a0[3]) | (a0[0]&~a0[1]&~a0[2]&a0[3]);
	
	assign b[5] = (a0[0]&a0[1]&~a0[2]&a0[3]) | (~a0[0]&~a0[1]&a0[3]) | (~a0[0]&~a0[1]&a0[2]) | (~a0[0]&a0[2]&a0[3]);
	
	assign b[6] = (~a0[0]&a0[1]&a0[2]&a0[3]) | (a0[0]&a0[1]&~a0[2]&~a0[3]) | (~a0[0]&~a0[1]&~a0[2]);
	
	assign c[0] = (~a1[0]&a1[1]&~a1[2]&~a1[3]) | (a1[0]&~a1[1]&a1[2]&a1[3]) | (a1[0]&a1[1]&~a1[2]&a1[3]) + (~a1[0]&~a1[1]&~a1[2]&a1[3]);
	
	assign c[1] = (~a1[0]&a1[1]&~a1[2]&a1[3]) | (a1[0]&a1[1]&~a1[3]) | (a1[0]&a1[2]&a1[3]) | (a1[1]&a1[2]&~a1[3]);
	
	assign c[2] = (~a1[0]&~a1[1]&a1[2]&~a1[3]) | (a1[0]&a1[1]&a1[2]) | (a1[0]&a1[1]&~a1[3]); 
	
	assign c[3] = (~a1[0]&~a1[1]&~a1[2]&a1[3]) | (~a1[0]&a1[1]&~a1[2]&~a1[3]) | (~a1[0]&a1[1]&a1[2]&a1[3]) | (a1[0]&~a1[1]&a1[2]&~a1[3]) | (a1[0]&a1[1]&a1[2]&a1[3]);
	
	assign c[4] = (~a1[0]&~a1[1]&~a1[2]&a1[3]) | (~a1[0]&~a1[1]&a1[2]&a1[3]) | (~a1[0]&a1[1]&~a1[2]&~a1[3]) | (~a1[0]&a1[1]&~a1[2]&a1[3]) | (~a1[0]&a1[1]&a1[2]&a1[3]) | (a1[0]&~a1[1]&~a1[2]&a1[3]);
	
	assign c[5] = (a1[0]&a1[1]&~a1[2]&a1[3]) | (~a1[0]&~a1[1]&a1[3]) | (~a1[0]&~a1[1]&a1[2]) | (~a1[0]&a1[2]&a1[3]);
	
	assign c[6] = (~a1[0]&a1[1]&a1[2]&a1[3]) | (a1[0]&a1[1]&~a1[2]&~a1[3]) | (~a1[0]&~a1[1]&~a1[2]);
	
	assign result[0] = (~sum[0]&sum[1]&~sum[2]&~sum[3]) | (sum[0]&~sum[1]&sum[2]&sum[3]) | (sum[0]&sum[1]&~sum[2]&sum[3]) + (~sum[0]&~sum[1]&~sum[2]&sum[3]);
	
	assign result[1] = (~sum[0]&sum[1]&~sum[2]&sum[3]) | (sum[0]&sum[1]&~sum[3]) | (sum[0]&sum[2]&sum[3]) | (sum[1]&sum[2]&~sum[3]);
	
	assign result[2] = (~sum[0]&~sum[1]&sum[2]&~sum[3]) | (sum[0]&sum[1]&sum[2]) | (sum[0]&sum[1]&~sum[3]); 
	
	assign result[3] = (~sum[0]&~sum[1]&~sum[2]&sum[3]) | (~sum[0]&sum[1]&~sum[2]&~sum[3]) | (~sum[0]&sum[1]&sum[2]&sum[3]) | (sum[0]&~sum[1]&sum[2]&~sum[3]) | (sum[0]&sum[1]&sum[2]&sum[3]);
	
	assign result[4] = (~sum[0]&~sum[1]&~sum[2]&sum[3]) | (~sum[0]&~sum[1]&sum[2]&sum[3]) | (~sum[0]&sum[1]&~sum[2]&~sum[3]) | (~sum[0]&sum[1]&~sum[2]&sum[3]) | (~sum[0]&sum[1]&sum[2]&sum[3]) | (sum[0]&~sum[1]&~sum[2]&sum[3]);
	
	assign result[5] = (sum[0]&sum[1]&~sum[2]&sum[3]) | (~sum[0]&~sum[1]&sum[3]) | (~sum[0]&~sum[1]&sum[2]) | (~sum[0]&sum[2]&sum[3]);
	
	assign result[6] = (~sum[0]&sum[1]&sum[2]&sum[3]) | (sum[0]&sum[1]&~sum[2]&~sum[3]) | (~sum[0]&~sum[1]&~sum[2]);
	
	

endmodule



