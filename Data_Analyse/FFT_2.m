Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
size_t = size(simout.Time(10000:12000));
L = size_t(1);             % Length of signal
t = (0:L-1)*T;        % Time vector
accl = simout.Data(10000:12000);
plot(simout.Time(10000:12000), accl);
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