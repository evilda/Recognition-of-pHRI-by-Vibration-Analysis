% % % % % gradient calculation

gradient = zeros(1,len);
i = 1;

for windowlen = 50:50:50
    gradient = gradient1(data4, windowlen);
%     subplot(3,1,i);
    i =i+1;
%     plot(data(1,:),gradient);
end





% % % %  edge detection

multiplier = 5;

peak = max(gradient(101:700));
win_len = 100;

for j1 = 701:win_len:(length_s-win_len)
    max_gradient = max(gradient(j1:(j1+win_len-1)));
    if max_gradient>multiplier*peak
        
        break
        elseif max_gradient>peak
            peak = 0.5*(max_gradient+peak);
    end
end
figure
plot(data(1, :),data4,'g',...
data(1,:), gradient,...
data(1,j1+win_len-1),data4(j1+win_len-1),'*r');



% % % % function

function y = gradient1(data, windowlen)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1+165):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end

