module main();
	reg A,B,i0,i1;
	reg[3:0]i;
	wire and0,or0,xor0,not0,A0,O0,X0,N0,oput;
	
	Decoder decoder(A,B,and0,or0,xor0,not0);
	Comp comp(i0,i1,A0,O0,X0,N0);
	Output output0(A0,O0,X0,N0,and0,or0,xor0,not0,oput);
	initial
	begin
		//AND TESTS
		A=0;
		B=0;
		
		$display("AND TESTS\nA=%b B=%b",A,B);
		#1
		$display("DECODER TEST\nand0=%b or0=%b xor0=%b not0=%b\n",and0,or0,xor0,not0);
		for(i=0;i<4;i=i+1)begin
			i0 = i[1];
			i1 = i[0];
			#1
			$display("i0=%b i1=%b\nA0=%b O0=%b X0=%b N0=%b oput=%b\n",
		i0,i1,A0,O0,X0,N0,oput);
		end
		
		//OR TESTS
		A=0;
		B=1;
		$display("OR TESTS\nA=%b B=%b",A,B);
		#1
		$display("DECODER TEST\nand0=%b or0=%b xor0=%b not0=%b\n",and0,or0,xor0,not0);
		for(i=0;i<4;i=i+1)begin
			i0 = i[1];
			i1 = i[0];
			#1
			$display("i0=%b i1=%b\nA0=%b O0=%b X0=%b N0=%b oput=%b\n",
		i0,i1,A0,O0,X0,N0,oput);
		end
		
		//XOR TESTS
		A=1;
		B=0;
		$display("XOR TESTS\nA=%b B=%b",A,B);
		#1
		$display("DECODER TEST\nand0=%b or0=%b xor0=%b not0=%b\n",and0,or0,xor0,not0);
		for(i=0;i<4;i=i+1)begin
			i0 = i[1];
			i1 = i[0];
			#1
			$display("i0=%b i1=%b\nA0=%b O0=%b X0=%b N0=%b oput=%b\n",
		i0,i1,A0,O0,X0,N0,oput);
		end
		
		//NOT TESTS
		A=1;
		B=1;
		$display("NOT TESTS\nA=%b B=%b",A,B);
		#1
		$display("DECODER TEST\nand0=%b or0=%b xor0=%b not0=%b\n",and0,or0,xor0,not0);
		for(i=0;i<4;i=i+1)begin
			i0 = i[1];
			i1 = i[0];
			#1
			$display("i0=%b i1=%b\nA0=%b O0=%b X0=%b N0=%b oput=%b\n",
		i0,i1,A0,O0,X0,N0,oput);
		end
		
	end
endmodule

module Decoder(A,B,and0,or0,xor0,not0);
	input A,B;
	output and0,or0,xor0,not0;
	assign and0 = ~A & ~B;
	assign or0 = ~A&B;
	assign xor0 = A&~B;
	assign not0 = A&B;
endmodule

module Comp(i0,i1,A0,O0,X0,N0);
	input i0,i1;
	output A0,O0,X0,N0;
	assign A0 = i0&i1;
	assign O0 = i0|i1;
	assign X0 = i0^i1;
	assign N0 = ~i0;	
endmodule

module Output(A0,O0,X0,N0,and0,or0,xor0,not0,oput);
	input A0,O0,X0,N0,and0,or0,xor0,not0;
	output oput;
	wire w0,w1,w2,w3;
	assign w0 = A0&and0;
	assign w1 = O0&or0;
	assign w2 = X0&xor0;
	assign w3 = N0&not0;
	
	assign oput = w0|w1|w2|w3;
endmodule
