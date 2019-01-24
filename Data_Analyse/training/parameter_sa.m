% this program is to estimate the parameter of RLowess. The computational
% time is logged at the same time.

len = length(simout.Time);
data = zeros(2,len);
data(1,:) = simout.Time(:,1); %time series
data(2,:) = simout.Data(1,1,:); %data seies

%%%%getting the acceleration's amplitude
mean_100 = mean(data(2,100:430)); % calculating the offset approximately
data2 = abs(data(2,:)-mean_100);  %removing offset

%%%% smoothing data of acceleration
w_len = 150;
data3 = movmean(data2,w_len);
p = fix(w_len/2);
data4 = data3(p:len);
data4 = movmean(data4, w_len);
data4 = [data3(1:(p-1)), data4];

s = (0.03:0.001:0.04);% test sequence
len2 = length(s);
m = zeros(1,len2);
t = zeros(1,len2);
R = zeros(1,len2);
% data5 = (smooth(data4,0.005,'rloess'))'; % smoothing
% data5_1 = [data5(2:len) data5(len)];
% delt = (data5_1-data5).^2;
% R0 = sum(delt);
R0 = 0.3947075;
% 
for i =1:len2
    tic;   % measuring computational time
    data5 = (smooth(data4,s(i),'rloess'))'; % smoothing
    data5_1 = [data5(2:len) data5(len)];
    delt = (data5_1-data5).^2;
    R(i) = R0/sum(delt);
    t(i)=toc; % logging the computational time
    m(i) = (1/t(i))*R(i);
end
plot(s,m); 