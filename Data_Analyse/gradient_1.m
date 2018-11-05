% edge detection

gradient = zeros(1,len);
i = 1;
figure
for windowlen = 50:50:150
    gradient = gradient1(data4, windowlen);
    subplot(3,1,i);
    i =i+1;
    plot(data(1,:),gradient);
end


% subplot(2,1,1);
% plot(data(1,:),gradient);
subplot(3,1,3);
plot(data(1,:),data4);


function y = gradient1(data, windowlen)
len = length(data);
y = zeros(1,len);
for i = (windowlen*2+1):1:len
    y(i) = (3*data(i)-2*data(i-windowlen)-data(i-2*windowlen))^2;
end
end