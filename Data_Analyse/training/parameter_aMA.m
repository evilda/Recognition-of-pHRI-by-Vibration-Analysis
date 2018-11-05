% this program is to estimate the parameter of moving average in
% acceleration analysis, i.e. p_a1 and p_a2

len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);

mean_100 = mean(data(2,100:430));
data2 = abs(data(2,:)-mean_100);
 prime = [109, 137; 107, 113; 123, 131;137, 139; 127, 139]; % part of the prime numbers between [50 150]
 len = length(prime);
for i = 1:len
    data3 = movmean(data2, prime(i,1));
    data4 = movmean(data3, prime(i,2));
    plot(data(1,:),data4);
    hold on
end