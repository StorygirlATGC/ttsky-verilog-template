module musicfeatures (input clk1, input clk2, input octave_dena, input octave_uena, input tremolo_ena, output out_o, output extra_features);
	wire octave_down;
	wire tremolo;
	wire octave_up;
	assign tremolo = clk1&~clk2;
	assign octave_up = ((~clk1) ^ clk1);
	DFF v1 ( .D(~octave_down), .clk(clk1), .Q(octave_down) );

	
	assign out_o = octave_dena ? octave_down: octave_uena ? octave_up: 0;
	assign extra_features = tremolo_ena ? tremolo: 0;
endmodule
