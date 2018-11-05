global tdataset trealtime;

trealtime = [9.6 10.9 7.5 6.5 8.0 8.5 10.2 7.0 8.5 10.5 9.5 6.6 8.2 6.4 7.0 6.7 6.4 6.7 6.7 6.6 6.5 7.0 6.9 6.9 10.1 6.4 7.7 5.8 8.7 6.2 6.4 7.6 6.5 5.3 6.7 6.7 10.6 7.3 6.5 7.3 7.4];
n = 'glass\330ml_bottle\empty_3.mat';
addin(n);
n = 'glass\330ml_bottle\empty_4.mat';
addin(n);
n = 'glass\330ml_bottle\full_3.mat';
addin(n);
n = 'glass\330ml_bottle\full_4.mat';
addin(n);
n = 'glass\330ml_bottle\half_3.mat';
addin(n);
n = 'glass\330ml_bottle\half_4.mat';
addin(n);

n = 'glass\500ml_bottle\empty_3.mat';
addin(n);
n = 'glass\500ml_bottle\empty_4.mat';
addin(n);
n = 'glass\500ml_bottle\full_3.mat';
addin(n);

n = 'glass\750ml_bottle\empty_3.mat';
addin(n);
n = 'glass\750ml_bottle\empty_4.mat';
addin(n);
n = 'glass\750ml_bottle\full_3.mat';
addin(n);
n = 'glass\750ml_bottle\full_4.mat';
addin(n);
n = 'glass\750ml_bottle\empty_3.mat';
addin(n);
n = 'glass\750ml_bottle\empty_4.mat';
addin(n);

n = 'plastic\500ml_plastic_bottle\empty_3.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\empty_4.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\full_3.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\full_4.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\half_3.mat';
addin(n);
n = 'plastic\500ml_plastic_bottle\half_4.mat';
addin(n);

n = 'plastic\1000ml_plastic_bottle\empty_3.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\empty_4.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\full_3.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\full_4.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\half_3.mat';
addin(n);
n = 'plastic\1000ml_plastic_bottle\half_4.mat';
addin(n);

n = 'glass\500ml_bottle\half_3.mat';addin(n);
n = 'glass\500ml_bottle\half_4.mat';addin(n);

n = 'wood\small_3.mat';addin(n);
n = 'wood\small_4.mat';addin(n);
n = 'wood\large_3.mat';addin(n);
n = 'wood\large_4.mat';addin(n);

n = 'fruits\apple_3.mat';addin(n);
n = 'fruits\apple_4.mat';addin(n);
n = 'fruits\peach_3.mat';addin(n);
n = 'fruits\peach_4.mat';addin(n);

n = 'cellphone\horizontal_3.mat';addin(n);
n = 'cellphone\horizontal_4.mat';addin(n);
n = 'cellphone\vertical_3.mat';addin(n);
n = 'cellphone\vertical_4.mat';addin(n);



function addin(n)
persistent i;
global tdataset trealtime;
if isempty(i)  % initialing
    i=1;
end

load(n); % loading measured data
tdataset(i).name =n; % name of the measured object
tdataset(i).database = simout;  % measured data
tdataset(i).rtime = trealtime(i);  %% actual time point when the pHRI happens
i = i+1;
clear simout;
end
