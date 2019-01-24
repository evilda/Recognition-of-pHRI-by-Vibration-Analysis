%%%% to process the measured raw data and prepare the data for estimation,
%%%% so that the computaion reduces %%%%

load('training_dataset.mat') % loading dataset
len = size(dataset);
len_dataset = len(2);  % number of databases
for i_t = 1:len_dataset
    simout = dataset(i_t).database;
    realtime = dataset(i_t).rtime;
%     preprocess_acceleration
    preprocess_frequency;    % data pre-processing
    simout.Data = gradient_a;
    dataset(i_t).database = simout;
end
