# Radar Pulse Compression in MATLAB

This project demonstrates a simple radar pulse compression workflow in MATLAB. It includes signal generation, reference waveform construction, FFT-based matched filtering, and visualization of the compressed radar response in the range domain.

The implementation was created as a personal radar signal processing practice project based on concepts learned in academic coursework and independently reorganized into a standalone demonstration.

## Overview

Pulse compression is a fundamental radar signal processing technique used to improve range resolution while maintaining sufficient transmitted energy. In this project, a radar signal is processed using frequency-domain matched filtering, and the compressed response is visualized after inverse FFT processing.

## Features

- Radar signal generation in MATLAB
- Reference waveform construction
- FFT-based matched filtering
- Compressed response visualization
- Range-domain plotting

## Processing Chain

Radar signal -> FFT -> Reference signal matching -> IFFT -> Compressed response

## Files

- README.md
- pulse_compression_demo.m
- generate_rect_window.m

## Requirements

- MATLAB

## How to Run

1. Open MATLAB.
2. Open the project folder.
3. Run `pulse_compression_demo`.
4. The script will:
   - generate the radar signal
   - compute the matched filter output
   - display the compressed response

## Notes

This repository is intended as a compact educational and portfolio-style implementation of pulse compression concepts in radar signal processing.

Possible extensions:
- use full LFM chirp transmission
- compare different window functions
- analyze sidelobe levels
- investigate range resolution versus bandwidth