clc;
clear;
%5hour
%Problem 1
%1
gaus = normrnd(12,0.4,[1,1000000]);
outliner=[10., 10.3, 2.1, 0., 0., 15.6, 22.3, 12.7];
plot(outliner,1,'*r');
hold on;
histogram(gaus);
legend('Bad data')
%Identify all the outliner gaus point out of five sigma of background
%signal
data = [outliner gaus];
pd = fitdist(data','Normal');
prob = normcdf(11);
right_x = icdf(pd,prob);
left_x = icdf(pd,1-prob);

Pos_true = 0;
Pos_false = 0;
Neg_true = 0;
Neg_false = 0;
for i = 1:100008
    if data(i)>left_x&&data(i)<right_x
        if ismember(data(i),outliner)
            Pos_false = Pos_false + 1;
        else
            Pos_true = Pos_true + 1;
        end
    else
        if ismember(data(i),outliner)
            Neg_true = Neg_true + 1;
        else
            Neg_false = Neg_false + 1;
        end
    end
end

table = zeros(2,2);
table(1,1) = Pos_true;
table(1,2) = Pos_false;
table(2,1) = Neg_true;
table(2,2) = Neg_false;
table
%Problem3
lambda = 1*6800/(15*8*60);
ob = makedist('Poisson', 'lambda', lambda);
prob = 1-cdf(ob,5);
sigma = norminv(prob)