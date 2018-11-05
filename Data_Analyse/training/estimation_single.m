% this program is to display the result of a single iteration of the
% training of parameter m (multiplier)

load('preprocess_training_dataset_a.mat') % loading dataset
len = size(dataset);
len_dataset = len(2);  % number of databases
error = zeros(1,len_dataset+1); 
amultiplier = 3; % initial value of multiplier
mp = 0.3; % minimal value for peak. 1 for frequency analysis and 0.1 for acceleration analysis.
% mp = 1;
for i_t = 1:len_dataset
    simout = dataset(i_t).database;
    realtime = dataset(i_t).rtime;
    estimation_Mutipiler;
%     acceleration_and_frequency; % edge detection and return the recognized time point
    error(i_t) = Ans - realtime;
end
error(len_dataset+1) = sum(error);
error = error';
