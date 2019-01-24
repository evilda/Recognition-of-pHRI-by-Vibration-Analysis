% to process the raw data. From the raw data we can see, that the mean of 
% signal is almost stable, only the peak-peak value and frequency are 
% obviously changed. With the mean value of data in 1st second we can convert
% "peak1 - peak2" to "peak1 + peak2"


mean_100 = mean(data(2,100:430));
data2 = abs(data(2,:)-mean_100);

data3_1 = movmedian(data2,30);
data3 = movmean(data3_1,131);
% subplot(2,1,1);
% figure
% plot(data(1,:),data3,'g')
% hold on;

data4 = smooth(data3,0.03,'rloess');
% subplot(2,1,1);
plot(data(1,:),data4,'r')


% dim = size(data3);
% len = dim(1);
% i = fix(len/60);
% j = 0;
% data4 = zeros(1,i);
% time4 = [0.18:0.18:(i*0.18)];
% while i>0
%     data4(j+1) = sum(data3((j*60+1):(j*60+60)));
%     j = j+1;
%     i = i-1;
% end
% subplot(2,1,2);
% plot(time4,data4);


