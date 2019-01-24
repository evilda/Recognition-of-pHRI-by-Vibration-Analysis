% this program is to culculate the error with a specified parameter m
% (multiplier)

len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);  %time series
gradient_a = simout.Data(1,1,:);  %data series of gradient

%%%% edge detection of acceleration %%%%

ignore = 260;
begin = ignore+600;
peak = max(gradient_a(ignore:begin));
if peak<mp
    peak = mp;
end
win_len = 250;
for j2 = begin:win_len:(len-win_len)
    max_gradient_a = max(gradient_a(j2:(j2+win_len-1)));
    if max_gradient_a>amultiplier*peak
        break
        elseif max_gradient_a>peak
            peak = 0.5*max_gradient_a+0.5*peak;
    end
end
Ans = data(1,j2+win_len-1); %return the error