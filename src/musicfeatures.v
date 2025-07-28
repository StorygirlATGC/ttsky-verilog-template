module musicfeatures (input clk1, input clk2, input octave_dena, input octave_uena, input tremolo_ena, input led_ena, output out_full, output led_out);
	wire octave_down;
	wire tremolo;
	wire octave_up;
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

	reg [5:0] q;
	reg led;
	reg led_reg;
	always @(posedge clk1) begin
		q <= (q==63) ? 0: q+1;
		led <= (q == 0) ? 0:1;
		led_reg <= led_ena ? led: 0;
	end
	assign led_out = led_reg;
endmodule
