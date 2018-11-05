% this program is to evaluate the recognition system with testing dataset.

%load('test_dataset.mat') % loading dataset
len = size(dataset);
len_dataset = len(2);  % number of databases
error = zeros(len_dataset+1,3); 

for i_t = 1:len_dataset
    simout = dataset(i_t).database;
    realtime = dataset(i_t).rtime;
    acceleration_and_frequency; % this is a .m file to recognize edge and return the recognized 
    % time point
    error(i_t,:) = [Ans ta tf] - realtime; % Ans is the synthetical error, 
    % ta is the error in accerelation analysis, and tf is error in
    % frequency analysis
end
error(len_dataset+1,1) = sum(error(:,1));