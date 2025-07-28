module musicfeatures (input clk1, input clk2, input octave_dena, input octave_uena, input tremolo_ena, input led_ena, output out_o, output extra_features, output led_out);
	wire octave_down;
	wire tremolo;
	wire octave_up;
	wire led;
  	wire led1, led2, led3, led4, led5, led6;
	assign tremolo = clk1&~clk2;
	assign octave_up = ((~clk1) ^ clk1);
	DFF v1 ( .D(~octave_down), .clk(clk1), .Q(octave_down) );

  	DFF l1 (.D(~led6), .clk(clk1), .Q(led1));
  	DFF l2 (.D(led1), .clk(clk1), .Q(led2));
  	DFF l3 (.D(led2), .clk(clk1), .Q(led3));
  	DFF l4 (.D(led3), .clk(clk1), .Q(led4));
  	DFF l5 (.D(led4), .clk(clk1), .Q(led5));
  	DFF l6 (.D(led5), .clk(clk1), .Q(led6));
  	assign led = led6;

	
  	assign out_o = octave_dena ? octave_down: octave_uena ? octave_up: 0;
  	assign extra_features = tremolo_ena ? tremolo: 0;
  	assign led_out = led_ena ? led: 0;
endmodule


