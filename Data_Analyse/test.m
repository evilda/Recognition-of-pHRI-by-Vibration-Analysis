mean_100 = mean(data(2,100:430));
data2 = abs(data(2,:)-mean_100);

plot(data(1,:),data2)