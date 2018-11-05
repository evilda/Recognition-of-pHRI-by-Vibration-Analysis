len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);

mean_100 = mean(data(2,100:430));
data2 = abs(data(2,:)-mean_100);

data3_a = movmean(data2,71);
data3 = movmean(data3_a,111);
data4 = smooth(data3,0.005,'rloess');

% edge detection
% gradient = zeros(1,len);
windowlen = 50;
gradient = gradient1(data4, windowlen);

multiplier = 3;
win_len = 250;
peak = max(gradient(330:700));
for j1 = 701:win_len:(len-win_len)
    max_gradient = max(gradient(j1:(j1+win_len-1)));
    if max_gradient>multiplier*peak
        
        break
        elseif max_gradient>peak
            peak = max_gradient;
    end
end
figure
plot(data(1, :),data4,'g',...
data(1,:), gradient,...
data(1,j1+win_len-1),data4(j1+win_len-1),'*r');


function y = gradient1(data, windowlen)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end