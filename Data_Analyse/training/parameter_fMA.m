% this program is to estimate the parameter of moving average in frequency
% analysis, i.e. p_f1 and p_f2

len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);

mean_100 = mean(data(2,100:430));
data2 = abs(data(2,:)-mean_100);

data_s = smooth(data(2,:),3);
time_s = data(1,:);
t_interval = time_s(2) - time_s(1); % period
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

 prime = [53, 199; 127, 131; 59, 67; 157, 167; 191, 197]; % part of the prime numbers between [50 200]
 len = length(prime);
for i = 1:len
    data3 = movmean(data2, prime(i,1));
    data4 = movmean(data3, prime(i,2));
    plot(data(1,:),data4);
    hold on
end