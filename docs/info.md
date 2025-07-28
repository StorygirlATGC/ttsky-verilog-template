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

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
