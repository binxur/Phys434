clc;
clear;
%1
%A
%While summing for more days the distribution remain same.
x = 0:10;
poisson1 = poisspdf(x,3);
figure()
subplot(2,2,1)
stairs(x,poisson1,"LineWidth",4);
title('1 Day data')
 
x = 0:20;
poisson2 = conv(poisson1,poisson1);
subplot(2,2,2)
stairs(x,poisson2,"LineWidth",4);
title('2 Days data')
 
x = 0:30;
poisson3 = conv(poisson2,poisson1);
subplot(2,2,3)
stairs(x,poisson3,"LineWidth",4);
title('3 Days data')
 
x = 0:40;
poisson4 = conv(poisson3,poisson1);
subplot(2,2,4)
stairs(x,poisson4,"LineWidth",4);
title('4 Days data');
%B
%After five days convolution the summed probability distribution remain same.
%The summed distribution remain same because convolution 
%represents the area of overlap under two distribution. Since both
%distributions are same the overlap should remain same.
%Since the data from each day is poisson distribution,the sum of poisson
%distribution should remain with different mean.
%C
%Since the data from each day is poisson distribution,the sum of poisson
%distribution should remain poisson with increased mean.

%2
%A
x = 0:2/200:2;
probd = raylpdf(x,0.5);

figure()
subplot(2,2,1)
plot(x,probd)
title('Original data')

x = 0:0.01:4;
probd1 = conv(probd,probd);
subplot(2,2,2)
plot(x,probd1)
title('1 Average interval')

x = 0:0.01:6;
probd2 = conv(probd1,probd);
subplot(2,2,3)
plot(x,probd2)
title('2 Average interval')

x = 0:0.01:8;
probd3 = conv(probd2,probd);
subplot(2,2,4)
plot(x,probd3)
title('3 Average interval')
%The distribution will be less skew and getting closer to Gaussian distribution over
%more observing intervals.The new distribution have a higher peak.
%B
probd4 = conv(probd3,probd);
x = 0:0.01:(length(probd4)-1)*0.01;
figure()
plot(x,probd4)
title('4 Average interval)')

probd5 = conv(probd4,probd);
x = 0:0.01:(length(probd5)-1)*0.01;
figure()
plot(x,probd5)
title('5 Average interval)')

probd6 = conv(probd5,probd);
x = 0:0.01:(length(probd6)-1)*0.01;
figure()
plot(x,probd6)
title('6 Average interval)')
%After 6 convolution graph looks similar to Gaussian distribution.I think
%it would reach gaussian distribution once the mean reach center of
%distribution.

%3
%A
%Set width as 10, and Y as 19.97
X = 4;
Y = 19.97;
%The background distribution graph
bg = makedist('Normal','sigma',X);
x = -30:30;
figure()
plot(x,pdf(bg,x))
title('Background')
%Assume all signal strength is larger than Y is the signal we want
s_pd = 1-cdf(bg,Y)
sigma = norminv(1-s_pd)
%sigma =  4.9925<5, therefore it isn't a discovery but really close
%B
%what is the probability distribution with same but 10k larger background?
%Probability distribution function of 10k pixels should be 10k*background pdf.
N = 10000;
figure()
plot(x,N*pdf(bg,x))
title('Background with 10k pixels')

%C
s_pd2 = N*s_pd;
sigma2 = norminv(1-s_pd2)
%sigma of 10k pixel is 2.75
%A
pd_5 = normcdf(5);
signal = icdf(bg,1-pd_5)
%signal required for a 5-sigma detection in Version 1 is -20
%B
signal2 = icdf(bg,1-pd_5/N)
%signal required for a 5-sigma detection in Version 2 is 14.8761
%C
%For factor of 10k, signal must be brighter than signal2 which is 14.8761
%The the sensitivity penalty is neglect compare to large factors.
%D
%The probability within 5 sigma of a standard normal distribution will
%not change. But if trials factor decrease with orders the 
%5-sigma sensitivity penalty will not be neglectable.