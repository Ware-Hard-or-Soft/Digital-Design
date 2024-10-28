# VHDL Stopwatch Project
## Overview
This project implements a digital stopwatch using VHDL. The modules included support core stopwatch functionality, such as counting, displaying, debouncing inputs, frequency division, and overall control.

## Architecture

- **Latch (`latch.vhd`)**: Stores and holds signals for stability within the system.
- **Frequency Divider (`frequency_divider.vhd`)**: Adjusts the clock frequency to match timing needs.
- **Display (`display.vhd`)**: Handles output to a 7-segment or similar display for time representation.
- **Debounce (`debounce.vhd`)**: Ensures stable button inputs by filtering out noise.
- **Counter (`counter.vhd`)**: Counts time intervals, forming the core of the stopwatch functionality.
- **Controller (`controller.vhd`)**: Manages start, stop, reset, and other operational states.

## Getting Started

### Prerequisites
- VHDL compiler/simulator such as [ModelSim](https://www.mentor.com/company/products/modelsim/), [GHDL](https://ghdl.github.io/)
- GHDL or GTKWave

### Running the Simulation
1. **Compile** each VHDL file in the `src/` directory.
2. **Simulate** the `stopwatch_tb.vhd` testbench in your simulator.

```bash
# Example using GHDL
ghdl -a src/*.vhd       # Analyze all source files
ghdl -a tests/stopwatch_tb.vhd # Analyze the testbench
ghdl -e stopwatch_tb     # Elaborate testbench
ghdl -r stopwatch_tb --vcd=stopwatch_tb.vcd # Run and save waveform
