% this program is to estimate the parameter of moving average in
% acceleration analysis, i.e. p_a1 and p_a2

len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);

mean_100 = mean(data(2,100:430));
data2 = abs(data(2,:)-mean_100);
p = [149,150,151]; % part of the prime numbers between [50 150]
lens = length(p);
defer = zeros(1,lens);
plot([0,15],[15.6,15.6]);
hold on
for i = 1:lens
    data3 = movmean(data2, p(i));
    p1 = fix(p(i)/2);
    data4 = data3(p1: len);
    data4 = movmean(data4, p(i));
    data4 = [data3(1:(p1-1)), data4];
    plot(data(1,:),data4);
    hold on
end
hold off
% axis([5.83 5.87 15.5 15.8]); 
[x,y] = ginput(len);
d = 5.9584-x;