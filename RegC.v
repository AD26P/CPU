////////////////////////////////////////////////////////////////////////////////////////////
//	Program to realise a Register. The operation depends on Clock and load		///
///////////////////////////////////////////////////////////////////////////////////////////

module regC (clk, loadC, dataCin, dataCout);
input clk;
input loadC;
input [31:0] dataCin;
output [31:0] dataCout;

reg [31:0] dataCout;
reg [31:0] tempC;

always@(clk,loadC)
begin
	@(posedge clk) 
	begin
		if ( loadC == 1) begin
		dataCout <= dataCin;
		tempC <= dataCin;
		end

		else if (loadC == 0) begin
		dataCout <= tempC;
		end
	end
end
endmodule

//////////////////////////////////////////////////////////////////////////////
//	Program to test the design of the Register			/////
////////////////////////////////////////////////////////////////////////////
module tb_regC ();
reg clk;
reg loadC;
reg [31:0] dataCin;
wire [31:0] dataCout;

// Instantiation of the Register C

regC r1 (.clk(clk), .loadC(loadC), .dataCin(dataCin), .dataCout(dataCout));

// Initialization
initial
begin
	clk <= 1'b0;
	loadC <= 0;
	dataCin <= 32'h00000000;
end

// Clock signal setup

always #5 clk = ~clk;

// Stimilus
initial
begin
	#20 loadC = 1;
	dataCin = 32'h00f430fe;
	
	#20 loadC = 0;
	dataCin = 32'h12340fe6;

	#20 loadC = 1;
end
endmodule
