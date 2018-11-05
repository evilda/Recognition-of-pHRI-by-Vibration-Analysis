len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1); %time series
data(2,:) = simout.Data(1,1,:); %data seies

%%%%getting the acceleration's amplitude
mean_100 = mean(data(2,100:430)); % calculating the offset approximately
data2 = abs(data(2,:)-mean_100);  %removing offset

%%%% smoothing data of acceleration
data3_a1 = movmean(data2,73);
data3_a = movmean(data3_a1,113);
data4_a = smooth(data3_a,0.007,'rloess');

%%%% freqency calculation through zero point counting
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

%%%% smoothing data of frequency %%%%
data3_f1 = movmean(fre, 73);  % first moving average
data3_f = movmean(data3_f1, 113); %second moving average
data4_f = smooth(data3_f, 0.005,'rloess'); % RLoesss operator

%%%% calculating gradient %%%%

gradient_a = zeros(1,len);
gradient_f = zeros(1,len);
windowlen = 50;
ignore = 260;
gradient_a = gradient1(data4_a, windowlen,ignore);
gradient_f = gradient1(data4_f, windowlen, ignore);

%%%% edge detection of frequency%%%%

fmultiplier = 4;
begin = ignore+600;
peak = max(gradient_f(ignore:begin));
if peak<1
    peak = 1;
end
win_len = 250;

for j1 = begin:win_len:(length_s-win_len)
    max_gradient_f = max(gradient_f(j1:(j1+win_len-1)));
    if max_gradient_f>fmultiplier*peak
        break
        elseif max_gradient_f>peak
            peak = 0.5*(max_gradient_f+peak);
    end
end

%%%% edge detection of acceleration %%%%

amultiplier = 4;
peak = max(gradient_a(ignore:begin));
if peak<0.1
    peak = 0.1;
end

for j2 = begin:win_len:(length_s-win_len)
    max_gradient_a = max(gradient_a(j2:(j2+win_len-1)));
    if max_gradient_a>amultiplier*peak
        break
        elseif max_gradient_a>peak
            peak = 0.5*(max_gradient_a+peak);
    end
end

%%% plot %%%%

figure
plot(data(1, :),data4_f,'g',...
data(1,:), gradient_f,...
data(1,j1+win_len-1),data4_f(j1+win_len-1),'*r');

figure
plot(data(1, :),data4_a,'g',...
data(1,:), gradient_a,...
data(1,j2+win_len-1),data4_a(j2+win_len-1),'*r');

%%%% function %%%%

function y = gradient1(data, windowlen, ignore)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1+ignore):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end

