<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Our chip has a digital audio input wave that is modified through the chip, and the ouput is the modified wave. Our features are octave changes, a tremolo, and an LED based off of the sound. The structure of these modification is split into two parts: audio and effects. The audio includes the octave changes and the effects include the LED display and the tremolo. The octave down is done with a clock divider using a flip flop. The octave up uses a delay/inverter and an xor to double the frequency of the signal. The tremolo uses a second clock signal to interupt the sound at certain points to produce the rough effects of a tremolo. The LED Display uses a series of flip flops to divide the audio signal enough such that the flickering based off of the frequency of the sound is visible to the human eye. 

## How to test

Explain how to use your project

## External hardware

- 2 555 timers (one for audio input signal, one for the tremolo additional clock) both of which are configured in astable mode (this requires additional hardware such as resistors and capacitors).
  - This chip is designed for audio input signals with frequencies between 261.6256Hz and 523.2511Hz (C<sub>4</sub> and C<sub>5</sub>), but will likely work to some degree for others outside of it.
  - the tremolo signal was tested at 10Hz, but feel free to change it.
- 1 LED for the LED light output (use resistors as necessary)
- 4 switches to enable the different features (recommend spst or spdt) 

