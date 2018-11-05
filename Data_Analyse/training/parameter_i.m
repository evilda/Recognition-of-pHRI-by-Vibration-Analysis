len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1); %time series
data(2,:) = simout.Data(1,1,:); %data seies

%%%%getting the acceleration's amplitude
mean_100 = mean(data(2,100:430)); % calculating the offset approximately
data2 = abs(data(2,:)-mean_100);  %removing offset

%%%% smoothing data of acceleration
data3_a1 = movmean(data2,137);
data3_a = movmean(data3_a1,139);
data4_a = smooth(data3_a,0.007,'rloess');

%%%% calculating gradient %%%%

gradient_a = zeros(1,len);
len = length(windowlen);
ignore = 260;
for windowlen = 20:50:370
    gradient_a = gradient1(data4_a, windowlen,ignore); % data4_a is the output of RLowess filter
    plot(data(1,:),gradient_a);
    hold on
end

%%%% function %%%%

function y = gradient1(data, windowlen, ignore)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1+ignore):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end