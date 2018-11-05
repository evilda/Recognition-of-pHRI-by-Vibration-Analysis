% this program is to train the parameter m (multiplier)

% load('preprocess_training_dataset_a.mat') % loading dataset
load('preprocess_training_dataset_f.mat') % loading dataset
len = size(dataset);
len_dataset = len(2);  % number of databases
error = zeros(1,len_dataset+1);
sumerror = 1000;
amultiplier = 6; % initial value of multiplier
mp = 2.2; % minimal value for peak. 1 for frequency analysis and 0.1 for acceleration analysis.
% mp = 0.3;
failcase = [9 29 30]; % the order of the fail cases
while sumerror>150
    amultiplier = amultiplier-0.01;
    for i_t = 1:len_dataset
        simout = dataset(i_t).database;
        realtime = dataset(i_t).rtime;
        estimation_Mutipiler;  % calling the .m file
    %     acceleration_and_frequency; % edge detection and return the recognized time point
        error(i_t) = Ans - realtime;
    end
    sumerror = sum(error)-sum(error(failcase));
end
error(len_dataset+1) = sumerror;
error=error';
