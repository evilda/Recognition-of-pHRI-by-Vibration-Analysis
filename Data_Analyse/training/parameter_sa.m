% this program is to estimate the parameter of RLowess. The computational
% time is logged at the same time.

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
s = [0.025, 0.05, 0.075];
len = length(s);
for i =1:len
    tic;   % measuring computational time
    data4_a = smooth(data3_a,s(i),'rloess'); % smoothing
    plot(data(1,:),data4_a);
    t(i)=toc; % logging the computational time
    hold on
end