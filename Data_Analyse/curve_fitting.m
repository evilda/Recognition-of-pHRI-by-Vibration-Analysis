% find a sin-function to fit the data, so that the frequency of signal can be read
% directly from the function

len = size(simout.Time);
len = len(1);
data = zeros(2,len);
data(1,:) = simout.Time(:,1);
data(2,:) = simout.Data(1,1,:);

windowlen = 100;
n = fix(len/windowlen);
sinpeak = zeros(1,n);

for i = 0:1:(n-1)
    time_ = data(1, (i*100+1):(i*100+100));
    data_ = data(2, (i*100+1):(i*100+100));
    sinpeak(1+i) = peaksearch(time_, data_);
end
plot (sinpeak)

function sinpeak = peaksearch(time_, data_)
[fitresult, gof] = creatFit(time_, data_);
x = atan(fitresult.b1/fitresult.a1);
maxa = fitresult.b1/(sin(x));
sinpeak = abs(maxa) + fitresult.a0;
end