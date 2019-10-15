clc;
clear;
%1 The probability of rolling two 1 is 1/36 while the probability of 
% seven is 6/36
%2
%   p0 = 0;
%   P1 = 0;
%   P2 = 1/36;
%   P3 = P1*P2+P2*P1=2/36
%   P4 = P1*P3+P2*P2+P3*P1=3/36
%   P5 = P1*P4+P2*P3+P3*p2+P4*P1=4/36
%   P6 = P1*P5+P2*P4+P3*P3+P4*P2+P5*P1=5/36
%   P7 = P1*P6+P2*P5+P3*P4+P4*P3+P5*P2+P6*P1=6/36
%   P8 = 5/36   
%   P9 = 4/36
%   P10 = 3/36
%   P11 = 2/36
%   P12 = 1/36
% Numerically
 sol=zeros(36,1);
 num=1;
 for i=1:12
     for j=1:6
         if i-j<=0;
         else if i-j>6;
             else
                 sol(num,1)=i;
                num=num+1;
             end
         end
     end
 end
 figure()
 histogram(sol,'Normalization','Probability')
 xlabel('Sum of two dices')
 ylabel('Probability');
 %3
 pb=zeros(11,1);
 for i=1:11
     if i<=6
        pb(i,1)=i/36;
     else
         pb(i,1)=(12-i)/36;
     end
 end
 mean = 0;
for i = 1:length(pb)
    mean = mean+(i+1)*pb(i,1);
end

variance = 0;
for i = 1:length(pb)
    variance = variance+sqrt(((i+1)-mean)^2*pb(i,1));
end

%4
dice10 = zeros(1,10);
for i = 1:10
    dice1 = randi(6,1);
    dice2 = randi(6,1);
    total = dice1+dice2;
    dice10(1,i) = total*pb(total-1,1);
end

 figure()
 histogram(dice10,'Normalization','Probability')
 xlabel('Average')
 ylabel('Ptobability')
 %5
x = linspace(-10,10,1000);
std = 3;
meann = 1;
%get 1000 random num from Gaussian distribution which mean is 3 and std is
%1
gaus1_data = sort(std.*randn(1000,1) + meann);
std = 4;
meann = 0;
%get 1000 random num from Gaussian distribution which mean is 0 and std is
%4
gaus2_data = sort(std.*randn(1000,1) + meann);
%get average of two distributions above
ave_data = sort((gaus1_data+gaus2_data)*0.5);
gaus1 = fitdist(gaus1_data, 'Normal');
gaus2 = fitdist(gaus2_data, 'Normal');
ave = fitdist(ave_data, 'normal');

figure()
subplot(1,3,1)
plot(x,pdf(gaus1,x),"LineWidth",4)
title('First Gaussian distribution')
subplot(1,3,2)
plot(x,pdf(gaus2,x),"LineWidth",4)
title('Second Gaussian distribution')
subplot(1,3,3)
plot(x,pdf(ave,x),"LineWidth",4)
title('Average of Distribution 1 and 2')
%The average of two Gaussian distributions is also a Gaussian distribution
%its mean and standard deviation are 
%closed to the average of original Gaussian distributions