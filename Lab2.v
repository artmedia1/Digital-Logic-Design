module quiz2c(input a[3:0], output b[6:0]);

	assign b[0] = (~a[0]&a[1]&~a[2]&~a[3]) | (a[0]&~a[1]&a[2]&a[3]) | (a[0]&a[1]&~a[2]&a[3]) + (~a[0]&~a[1]&~a[2]&a[3]);
	//
	assign b[1] = (~a[0]&a[1]&~a[2]&a[3]) | (a[0]&a[1]&~a[3]) | (a[0]&a[2]&a[3]) | (a[1]&a[2]&~a[3]);
	
	// In minterm form, the function was originally f = ~a~bc~d + ab~c~d + abc~d + abcd
	// Reduction:  
	// f = ~a~bc~d + ab~d(~c+c) + abcd 
	//   = ~a~bc~d + ab~d(1) + abcd  
	//   = ~a~bc~d + ab~d + abcd 
	//   = ~a~bc~d + ab(~d+cd)
	//	 = ~a~bc~d + ab(c+~d)
	//   = ~a~bc~d + abc + ab~d
	assign b[2] = (~a&~b&c&~d) | (a&b&c) | (a&b&~d); 
	
	assign b[3] = (~a[0]&~a[1]&~a[2]&a[3]) | (~a[0]&a[1]&~a[2]&~a[3]) | (~a[0]&a[1]&a[2]&a[3]) | (a[0]&~a[1]&a[2]&~a[3]) | (a[0]&a[1]&a[2]&a[3]);
	
	assign b[4] = (~a[0]&~a[1]&~a[2]&a[3]) | (~a[0]&~a[1]&a[2]&a[3]) | (~a[0]&a[1]&~a[2]&~a[3]) | (~a[0]&a[1]&~a[2]&a[3]) | (~a[0]&a[1]&a[2]&a[3]) | (a[0]&~a[1]&~a[2]&a[3]);
	
	assign b[5] = (a[0]&a[1]&~a[2]&a[3]) | (~a[0]&~a[1]&a[3]) | (~a[0]&~a[1]&a[2]) | (~a[0]&a[2]&a[3]);
	
	assign b[6] = (~a[0]&a[1]&a[2]&a[3]) | (a[0]&a[1]&~a[2]&~a[3]) | (~a[0]&~a[1]&~a[2]);

endmodule