clc;
clear;
% A little statistics 
% 1B 
% I set mean at 0 while standard deviation as 1, probability result match z-table
p1= normcdf(0.5,0,1);
p2= normcdf(2.3,0,1);
p3= normcdf(3.1,0,1);
% 1C 
% inverse probability match x values 1, 2 and 5 and nevatige x value.
sg1= norminv(0.84134) ;
sg2= norminv(0.97725) ;
sg5 = norminv(0.9999997) ;
sgnega= norminv(0.25);
% 1D 
% In standard normal distribution since we set mean at 0,
% if probability is less than 0.5 the sigma would return as negative.
% 2A
% Exponential distribution
x = linspace(0,30,1000);
expD = makedist("Exponential",'mu',1.2);
% 2B
subplot(1,2,2)
plot(x,pdf(expD,x),"LineWidth",4);
set(gca,'YScale','log')
title('Exponential distribution with Yscale');
subplot(1,2,1)
plot(x,pdf(expD,x),"LineWidth",4);
% 3A
% My hypothetical measurement is x=5.
% 3B
% What is the probability of finding signal (x>5) from the background?
% 3C
% probablity = 1 - integral(expD, -Inf, 5)
% 3D
pb = 1 - cdf(expD, 6);   %if it should be 5？
% 3E
sigma = norminv(1 - pb);
% 4
% probability of signal x>2 in background and coorespond sigma
pb_2 = 1 - cdf(expD, 2);
sigma_2 = norminv(1 - pb_2);
% probability of signal x>4
pb_4 = 1 - cdf(expD, 4);
sigma_4 = norminv(1 - pb_4);
% probability of signal x>8
pb_8 = 1 - cdf(expD, 8);
sigma_8 = norminv(1 - pb_8);
% The sigma of exponential distribution have anti corelationship with
% probability
% Non-continuous distributions
% Binominal distribution
% 1B 
x = 0:50;
%Number of trials set to 34 Probability of success as 0.7
bin = makedist("Binomial",'N',34, 'p',0.7); 
 %should start a new figure
subplot(2,2,1)
stairs(x,pdf(bin,x),"LineWidth",3);
subplot(2,2,2)
stairs(x-5,pdf(bin,x),"LineWidth",3);
x = 0:100;
%Number of trials set to 69 Probability of success as 0.05
bin = makedist("Binomial",'N',84, 'p',0.05); 
subplot(2,2,1) %here should be 2,2,3
stairs(x,pdf(bin,x),"LineWidth",3);
subplot(2,2,2) %here should be 2,2,4
stairs(x-5,pdf(bin,x),"LineWidth",3);
% 1C
% What is the probability of finding signal between x=3 and x=5 in
% background of 1B
pb = cdf(bin, 5) - cdf(bin, 3);
% probability here is 0.3669
% 1D
% Discrete dataset is often collected in experimental physics, sigma
% and probabilities are discrete thus these variables 
% are estimate of real number.
% 1E
% mean or expectation of a Binominal distribution is probability-weighted 
% average of all its possible values. This probability-weight process works
% for both continuous and discrete.
% I think the random variables are continuously changing.  %I don't understand what continuously cganging is. If you zoom your
                                                           %graph, it's stairs shape, the variable x should not be continuous

