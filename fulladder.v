module fulladder (a, b, cin, cout);
	input a, b, cin;
	output cout;
	
	//assign sum = a ^ b ^ cin;
	assign cout = (a & b) | (a & cin) | (b & cin);
	
endmodule 