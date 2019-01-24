% % this program is to estimate the parameter of RLowess in frequency
% % analysis, i.e. s_f
% 
% len = length(simout.Time);
% data = zeros(2,len);
% data(1,:) = simout.Time(:,1);
% data(2,:) = simout.Data(1,1,:);
% 
% mean_100 = mean(data(2,100:430));
% data2 = abs(data(2,:)-mean_100);
% 
% data_s = smooth(data(2,:),3);
% time_s = data(1,:);
% t_interval = time_s(2) - time_s(1); % period
% length_s = length(data_s);
% sign_s = 1;
% count_s = 0;
% fre = zeros(1,length_s);
% timepunkt_s = zeros(1,3);
% for i = 2:(length_s-1)
%     if ((data_s(i)-mean_100)*sign_s) <=0 && ((data_s(i+1)-mean_100)*sign_s) <= 0
%         sign_s = -sign_s;
%         count_s = count_s + 1;
%         timepunkt_s(count_s) = time_s(i-1) + t_interval*(mean_100 - data_s(i-1))/(data_s(i)-data_s(i-1));
%         
%         if count_s == 3
%             fre(i) = 1/(timepunkt_s(3)-timepunkt_s(1));
%             count_s = 1;
%             timepunkt_s(1)=timepunkt_s(3);
%         else
%             fre(i) = fre(i-1);
%         end
%     else
%         fre(i) = fre(i-1);
%     end
% end
% 
% 
% %%%% smoothing data of acceleration
% w_len = 100;
% data3 = movmean(fre,w_len);
% p = fix(w_len/2);
% data4 = data3(p:len);
% data4 = movmean(data4, w_len);
% data4 = [data3(1:(p-1)), data4];

s = (0.03:0.001:0.04);% test sequence
len2 = length(s);
m = zeros(1,len2);
t = zeros(1,len2);
R = zeros(1,len2);
% data5 = (smooth(data4,0.005,'rloess'))'; % smoothing
% data5_1 = [data5(2:len) data5(len)];
% delt = (data5_1-data5).^2;
% R0 = sum(delt);
R0 = 0.0877357;
 
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