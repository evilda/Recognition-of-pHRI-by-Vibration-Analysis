% This program is to pre-process the raw date for the training of M_a, so
% that the computational time will reduce.

len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1); %time series
data(2,:) = simout.Data(1,1,:); %data seies

%%%%getting the acceleration's amplitude
mean_100 = mean(data(2,100:430)); % calculating the offset approximately
data2 = abs(data(2,:)-mean_100);  %removing offset

%%%% smoothing data of acceleration
w_len = 150;
data3 = movmean(data2,w_len);
p = fix(w_len/2);
data4 = data3(p:len);
data4 = movmean(data4, w_len);
data4 = [data3(1:(p-1)), data4];
data4_a = smooth(data4,0.030,'rloess');

%%%% calculating gradient %%%%

gradient_a = zeros(1,len);
windowlen = 158;
ignore = 260;
gradient_a = gradient1(data4_a, windowlen,ignore);

%%%% function %%%%

function y = gradient1(data, windowlen, ignore)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1+ignore):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end