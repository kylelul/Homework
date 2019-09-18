`timescale 1ns/10ps
module usr_t();
	wire [3:0] Data_Out;
	wire MSB_out, LSB_out;
	reg  [3:0] Data_In;
	reg  MSB_In, LSB_In;
	reg  s1,s0,clk,rst;
	
	usr T1(.Data_Out(Data_Out),
		.MSB_out(MSB_out),
		.LSB_out(LSB_out),
		.Data_In(Data_In),
		.MSB_In(MSB_In),
		.LSB_In(LSB_In),
		.s1(s1),
		.s0(s0),
		.clk(clk),
		.rst(rst));

	initial	
		clk=1'b0;
		always #5 clk=~clk;

	initial
		begin
		$display ("time\t clk\t rst\t s1\t s0\t out\t");
		$monitor ("%g\t %b\t %b\t %b\t %b\t %b\t", $time,clk,rst,s1,s0,Data_Out);
		#0 	rst=1'b1;
		#10     rst=1'b0;
		#45	rst=1'b1;
		#10	rst=1'b0;
		#45	rst=1'b1;
		#10	rst=1'b0;
		#1000 	$finish;
		end
	initial
		begin
		#0	s0=1'b0;
		#20	s0=1'b1;	
		#40	s0=1'b0;
		#55	s0=1'b1;
		#95	s0=1'b0;
		end
	initial
		begin
		#0	s1=1'b0;
		#70	s1=1'b1;
		#40	s1=1'b0;
		#10	s1=1'b1;
		#90	s1=1'b0;
		end
	initial
		begin
		#0	LSB_In=1'b1;
			MSB_In=1'b1;
			Data_In=4'b1111;
		end

	initial
		begin
			$shm_open ("mywave.db");
			$shm_probe (usr_t,"AS");
			$shm_save;
		end
endmodule

		
	

