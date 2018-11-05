% This program is to pre-process the raw date for the training of M_f, so
% that the computational time will reduce.


len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1); %time series
data(2,:) = simout.Data(1,1,:); %data seies

%%%% getting the acceleration's amplitude

mean_100 = mean(data(2,100:430)); % calculating the offset approximately

%%%% freqency calculation through zero point counting
data_s = smooth(data(2,:),3); % pre-smooth
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

%%%% smoothing data of frequency %%%%
data3_f1 = movmean(fre, 127);  % first moving average
data3_f = movmean(data3_f1, 131); %second moving average
data4_f = smooth(data3_f, 0.07,'rloess'); % RLoesss operator

%%%% calculating gradient %%%%

gradient_a = zeros(1,len);
windowlen = 160;
ignore = 260;
gradient_a = gradient1(data4_f, windowlen, ignore);

%%%% function %%%%

function y = gradient1(data, windowlen, ignore)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1+ignore):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end

