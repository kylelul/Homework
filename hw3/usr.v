`timescale 1ns/10ps
module usr(Data_Out,MSB_out, LSB_out,Data_In,MSB_In, LSB_In,s1,s0,clk,rst);
output Data_Out;
output MSB_out, LSB_out;
input [3:0] Data_In;
input MSB_In, LSB_In;
input s1,s0,clk,rst;
reg [3:0] Data_Out;

	assign MSB_out = Data_Out[3];
	assign LSB_out = Data_Out[0];
	
	always @ (posedge clk)begin
	 if(rst == 1'b1) Data_Out <= 0;
	 else case({s1,s0})
	  0:	Data_Out <= Data_Out; 				//hold
	  1:	Data_Out <= {MSB_In, Data_Out[3:1]};	//Serial shift from MSB
	  2:	Data_Out <= {Data_Out[2:0], LSB_In};	//Serial shift from LSB
	  3:  	Data_Out <= Data_In;				//Parallel load
	 endcase
	end
endmodule

