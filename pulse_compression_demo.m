% pulse_compression_demo.m
clear; close all; clc;

% Physical constant
c = 3e8;

% Radar parameters
pulseDuration = 5e-6;      % [s]
bandwidth = 150e6;         % [Hz]
sampleRate = 10 * bandwidth; % [Hz]

% Time axis
timeAxis = -pulseDuration : 1/sampleRate : 2*pulseDuration;

% Transmit signal
% A rectangular pulse is used here as a compact demo signal.
% The reference signal below uses an LFM chirp for matched filtering.
txSignal = generate_rect_window(timeAxis, pulseDuration/2, pulseDuration);

% Plot transmit signal
figure;
plot(timeAxis, txSignal, 'LineWidth', 1.2);
title('Transmit Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FFT of transmit signal
numSamples = length(timeAxis);
txSpectrum = fftshift(fft(txSignal));
frequencyAxis = (0:numSamples-1)/numSamples * sampleRate - sampleRate/2;

% Plot transmit spectrum
figure;
plot(frequencyAxis, 20*log10(abs(txSpectrum)/max(abs(txSpectrum)) + eps), 'LineWidth', 1.2);
title('Transmit Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
ylim([-80 5]);

% Reference signal for matched filtering
referenceTime = 0 : 1/sampleRate : pulseDuration;
referenceSignal = exp(1j*pi*bandwidth/pulseDuration * (referenceTime - pulseDuration/2).^2);

% Frequency-domain matched filtering
referenceSpectrum = fft(referenceSignal, numSamples);
matchedSpectrum = fft(txSignal) .* conj(referenceSpectrum);
compressedSignal = ifft(matchedSpectrum);

% Convert time axis to range axis
rangeAxis = timeAxis * c / 2;

% Normalize compressed response in dB
compressedResponse_dB = 20*log10(abs(compressedSignal) + eps);
compressedResponse_dB = compressedResponse_dB - max(compressedResponse_dB);

% Plot compressed response
figure;
plot(rangeAxis, compressedResponse_dB, 'LineWidth', 1.2);
title('Pulse Compression Result');
xlabel('Range (m)');
ylabel('Normalized Magnitude (dB)');
grid on;
ylim([-40 0]);