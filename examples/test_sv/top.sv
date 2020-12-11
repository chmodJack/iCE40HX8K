module top #(parameter N = 32)(
	input  logic         hwclk,
	output logic         led1,
	output logic         led2,
	output logic         led3,
	output logic         led4,
	output logic         led5,
	output logic         led6,
	output logic         led7,
	output logic         led8
);

logic [N - 1 : 0] counter;

assign led1 = counter[18];
assign led2 = counter[19];
assign led3 = counter[20];
assign led4 = counter[21];
assign led5 = counter[22];
assign led6 = counter[23];
assign led7 = counter[24];
assign led8 = counter[25];

// rising edge triggered ff with async reset
always_ff @(posedge hwclk)
	counter <= counter + 1;

endmodule
