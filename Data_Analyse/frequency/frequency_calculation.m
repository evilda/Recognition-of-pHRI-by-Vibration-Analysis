% to calculate the frequence of a wave in real time

% simout conversion
len = size(simout.Time);
len = len(1);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);

% freqency calculation through zero point counting
data_s = smooth(data(2,:),3);
time_s = data(1,:);
t_interval = time_s(2) - time_s(1);
mean_100 = mean(data(2,100:430));

length_s = length(data_s);
sign_s = 1;
count_s = 0;
fre = zeros(1,length_s);
timepunkt_s = zeros(1,3);
for i = 2:(length_s-1)
    if ((data_s(i)-mean_100)*sign_s) <=0 && ((data_s(i+1)-mean_100)*sign_s) <= 0
        sign_s = -sign_s;
        count_s = count_s + 1;
        timepunkt_s(count_s) = time_s(i-1) + t_interval*(mean_100 - data_s(i-1))/(data_s(i)-data_s(i-1));
        
        if count_s == 3
            fre(i) = 1/(timepunkt_s(3)-timepunkt_s(1));
            count_s = 1;
            timepunkt_s(1)=timepunkt_s(3);
        else
            fre(i) = fre(i-1);
        end
    else
        fre(i) = fre(i-1);
    end
end


% % % % % smoothing

data3 = movmean(fre,50);
% subplot(2,1,1);
% figure
% plot(data(1,:),data3,'g')
% hold on;

data4 = smooth(data3,0.02,'rloess');
% subplot(2,1,1);
% plot(data(1,:),data4,'r')

plot(time_s,fre,time_s, data_s,time_s, data4)
% fre2 = smooth(fre, 50);
% plot(time_s,fre2)
            
