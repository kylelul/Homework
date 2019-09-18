`timescale 1ns/10ps
module ebcounter_t();
	wire [3:0] out;
	wire [3:0] outh;
	wire [1:0] rco;
	wire [7:0] ebout;
	reg clk,reset,enable;

	ebcounter T1(.out(out),
			.ebout(ebout),
			.outh(outh),
			.rco(rco),
			.clk(clk),
			.enable(enable),
			.reset(reset));
	initial
		clk = 1'b1;
		always #5 clk=~clk;
	initial
		begin
		$display ("time\t clk\t reset\t enable\t 8counter\t");
		$monitor ("%g\t %b\t %b\t %b\t %b\t", $time,clk,reset,enable,ebout);
		#0 reset=1'b1;
			enable=1'b1;
		#10 reset=1'b0;
			enable=1'b0;
		#1800 $finish;
		end
	initial 
		begin
			$shm_open ("mywave.db");
			$shm_probe (ebcounter_t,"AS");
			$shm_save;
		end
endmodule
