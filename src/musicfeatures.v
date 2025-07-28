module musicfeatures (input clk1, input clk2, input octave_dena, input octave_uena, input tremolo_ena, input led_ena, output out_full, output led_out);
	wire octave_down;
	wire tremolo;
	wire octave_up;
	wire led;
	wire led1, led2, led3, led4, led5, led6;
	wire octave_change;
	wire octave_on;
	wire octave_out;

	assign octave_up = ((~clk1) ^ clk1);
	DFF v1 ( .D(~octave_down), .clk(clk1), .Q(octave_down) );

	assign octave_on = octave_dena ^ octave_uena;
	
	assign octave_change = octave_dena ? octave_down: octave_uena ? octave_up: 0;
	assign octave_out = octave_on ?  octave_change : clk1;
	assign tremolo = octave_out & ~ clk2;
	assign out_full = tremolo_ena ? tremolo: octave_out;

	DFF l1 (.D(~led6), .clk(octave_out), .Q(led1));
	DFF l2 (.D(led1), .clk(~led1), .Q(led2));
	DFF l3 (.D(led2), .clk(~led2), .Q(led3));
	DFF l4 (.D(led3), .clk(~led3), .Q(led4));
	DFF l5 (.D(led4), .clk(~led4), .Q(led5));
	DFF l6 (.D(led5), .clk(~led5), .Q(led6));
	assign led = led6;

	assign led_out = led_ena ? led: 0;
endmodule




