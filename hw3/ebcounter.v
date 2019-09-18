`timescale 1ns/10ps
module ebcounter(out,ebout,outh,rco,reset,enable,clk);
output out;
output outh;
output rco;
output ebout;
input clk,reset,enable;
reg [3:0] out;
reg [3:0] outh;
reg [1:0] rco;
wire [7:0] ebout;

assign ebout = {outh,out};

always @(negedge clk)
if (reset)
	out<=1'b0;
else
	if (enable==1'b0)
	out<=out+1;
always @(posedge clk)
if (out==4'b1111)
	rco<=1'b1;
else 
	rco<=1'b0;
always @(negedge clk)
if (reset)
	outh<=1'b0;
else 
	if(rco==1'b1)
	outh<=outh+1;
endmodule


