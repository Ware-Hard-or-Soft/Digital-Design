# VHDL Stopwatch Project
## Overview
This project implements a digital stopwatch using VHDL. The modules included support core stopwatch functionality, such as counting, displaying, debouncing inputs, frequency division, and overall control.
## Project Structure
Latch (latch.vhd): Stores and holds signals for stability within the system.
Frequency Divider (frequency_divider.vhd): Adjusts the clock frequency to match timing needs.
Display (display.vhd): Handles output to a 7-segment or similar display for time representation.
Debounce (debounce.vhd): Ensures stable button inputs by filtering out noise.
Counter (counter.vhd): Counts time intervals, forming the core of the stopwatch functionality.
Controller (controller.vhd): Manages start, stop, reset, and other operational states.
