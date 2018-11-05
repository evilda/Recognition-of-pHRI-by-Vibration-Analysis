% function data = simout_conversion(simout)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
len = size(simout.Time);
len = len(1);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);
% time_ = data(1,100:200);
% data_ = data(2,100:200);
% end

plot(data(1,:),data(2,:));