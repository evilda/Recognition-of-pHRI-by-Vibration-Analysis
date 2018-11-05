global dataset realtime;

realtime = [5.0 7.9 10.6 8.2 8.2 6.9 6.0 7.3 0.0 9.6 6.4 9.2 10.8 9.7 7.1 9.6 6.8 7.1 8.6 6.5 3.7 3.7 6.5 6.7 8.0 6.5 7.0 7.5 11.5 10.4 8.6 6.8 8.4 7 6.2 8 7 7 7.3 7.4 6.9 6.5]; % actual time points when the pHRI happens


n = 'glass\330ml_bottle\empty_1.mat';
addin(n);
n = 'glass\330ml_bottle\empty_2.mat';
addin(n);
n = 'glass\330ml_bottle\full_1.mat';
addin(n);
n = 'glass\330ml_bottle\full_2.mat';
addin(n);
n = 'glass\330ml_bottle\half_1.mat';
addin(n);
n = 'glass\330ml_bottle\half_2.mat';
addin(n);

n = 'glass\500ml_bottle\empty_1.mat';
addin(n);
n = 'glass\500ml_bottle\empty_2.mat';
addin(n);
n = 'glass\500ml_bottle\full_1.mat';
addin(n);
n = 'glass\500ml_bottle\full_2.mat';
addin(n);

n = 'glass\750ml_bottle\empty_1.mat';
addin(n);
n = 'glass\750ml_bottle\empty_2.mat';
addin(n);
n = 'glass\750ml_bottle\full_1.mat';
addin(n);
n = 'glass\750ml_bottle\full_2.mat';
addin(n);
n = 'glass\750ml_bottle\empty_1.mat';
addin(n);
n = 'glass\750ml_bottle\empty_2.mat';
addin(n);

n = 'plastic\500ml_plastic_bottle\empty_1.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\empty_2.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\full_1.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\full_2.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\half_1.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\half_2.mat';
addin(n);

n = 'plastic\1000ml_plastic_bottle\empty_1.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\empty_2.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\full_1.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\full_2.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\half_1.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\half_2.mat';
addin(n);

n = 'glass\500ml_bottle\half_1.mat';addin(n);
n = 'glass\500ml_bottle\half_2.mat';addin(n);

n = 'wood\small_1.mat';addin(n);
n = 'wood\small_2.mat';addin(n);
n = 'wood\large_1.mat';addin(n);
n = 'wood\large_2.mat';addin(n);

n = 'fruits\apple_1.mat';addin(n);
n = 'fruits\apple_2.mat';addin(n);
n = 'fruits\peach_1.mat';addin(n);
n = 'fruits\peach_2.mat';addin(n);

n = 'cellphone\horizontal_1.mat';addin(n);
n = 'cellphone\horizontal_2.mat';addin(n);
n = 'cellphone\vertical_1.mat';addin(n);
n = 'cellphone\vertical_2.mat';addin(n);

function addin(n)
persistent i;
global dataset realtime;
if isempty(i)  % initialing
    i=1;
end

load(n); % loading measured data
dataset(i).name =n; % name of the measured object
dataset(i).database = simout;  % measured data
dataset(i).rtime = realtime(i);  %% actual time point when the pHRI happens
i = i+1;
clear simout;
end
