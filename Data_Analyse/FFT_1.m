T = 0.003;             % Sampling period       
Fs = 1/T;            % Sampling frequency                    

L = length(simout.Time);             % Length of signal
t = (0:L-1)*T;        % Time vector
accl = simout.Data(:);
plot(simout.Time, accl);
Y = fft(accl);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
ylim([0 10])