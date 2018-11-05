% to find the averange peak-peak value in a period

gradient_1 = gradient(data_);
subplot(2,1,1)
plot(time_, gradient_1)
title('1-gradien')
subplot(2,1,2)
plot(time_,data_)