module counter(out,reset,clk);
output [3:0] out;
input clk,reset;
reg [3:0] out;
reg [3:0] out_tmp;

always @(posedge clk or posedge reset)
if (reset)
 out<=1'b0;
else
 out<=out+1;


always @(posedge clk or posedge reset)
if (reset)
	out_tmp <= 4'b0;
else
	out_tmp <= out +2;

endmodule
