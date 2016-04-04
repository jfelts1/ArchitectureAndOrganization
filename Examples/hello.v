/*module main();
    initial
    begin
        $display("I want to pass 260.");
        $finish ;
    end
endmodule
*/
module main();
reg x,y;
wire nandout;

andgate myand(x,y,nandout);

initial
	begin
		x =1;
		y =1;
		#1
		$display("x=%b NAND y=%b out=%b",x,y,nandout);
		$finish;
	end
endmodule

module andgate(a,b,out);
input a,b;
output out;
wire out;
wire w0;
	assign w0 = a&b;
	assign out = ~w0;
endmodule
