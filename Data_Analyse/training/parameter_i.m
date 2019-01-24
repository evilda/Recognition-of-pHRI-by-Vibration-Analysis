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

ignore = 260;
iG=1;
for windowlen = 10:50:360
    [gradient_a, peakG] = gradient1(data4_a, windowlen,ignore); % data4_a is the output of RLowess filter
    peak(iG) = peakG.*0.003;
    iG=iG+1;
    plot(data(1,:),gradient_a);
    hold on
end
hold off
peak = peak-peak(1);
%%%% function %%%%
% return the gradient and the point where the gradient reaches peak
function [y1,y2] = gradient1(data, windowlen, ignore)
len = length(data);
peak=0;
y1 = zeros(1,len);
for i = (windowlen*2+1+ignore):1:len
    y1(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
    if y1(i) > peak
        peak = y1(i);
        y2=i;
    end
end
end

