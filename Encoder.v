//////////////////////////////////////////////////////////////
// 	Design of a 16-bit Encoder			/////
//	The encoder has 16-bit input 			/////
//	and 4-bit output.				/////
////////////////////////////////////////////////////////////

module encode164( out, in, en);
output [3:0] out;
input [15:0] in;
input en;

reg [3:0] out;

always@(en or in)
begin
	out = 0;
	if (en == 1)
	begin
		case(in)
		16'b0000000000000010: out = 4'b0001;
		16'b0000000000000100: out = 4'b0010;
		16'b0000000000001000: out = 4'b0011;
		16'b0000000000010000: out = 4'b0100;
		16'b0000000000100000: out = 4'b0101;
		16'b0000000001000000: out = 4'b0110;
		16'b0000000010000000: out = 4'b0111;
		16'b0000000100000000: out = 4'b1000;
		16'b0000001000000000: out = 4'b1001;
		16'b0000010000000000: out = 4'b1010;
		16'b0000100000000000: out = 4'b1011;
		16'b0001000000000000: out = 4'b1100;
		16'b0010000000000000: out = 4'b1101;
		16'b0100000000000000: out = 4'b1110;
		16'b1000000000000000: out = 4'b1111;
		default out = 4'b0000;
		endcase
	end
end
endmodule

//////////////////////////////////////////////////////////////////////
//	Testbench to test the design for working		/////
/////////////////////////////////////////////////////////////////////

module tb_encode();
wire [3:0] out;
reg [15:0] in;
reg en;

// Instantiation of the design

encode164 e1(.out(out),.in(in),.en(en));

// Initialise the signals
initial
begin
	in = 16'b0000000000000000;
	en = 0;
end

initial
begin
	#10 en = 1;
	#10 in = 16'b0000000000000010;
	repeat (14)
	begin
		#10 in = in << 1;
	end
end
endmodule
		
