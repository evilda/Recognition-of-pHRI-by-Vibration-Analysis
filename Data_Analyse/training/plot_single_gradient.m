n = 40;
data = zeros(2,5001);
data(1,:) = dataset(n).database.Time(:,1);
data(2,:) = dataset(n).database.Data(1,1,:);
plot(data(1,:),data(2,:));