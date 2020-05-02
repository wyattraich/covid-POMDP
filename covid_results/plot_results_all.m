close all; clear all; clc;

filenamePP = 'results_POMCPOW.txt';
filename111 = 'results_111.txt';
filename555 = 'results_555.txt';
action = [1,1,1]; % mob,quar,t
startRow = 2;
endRow = 100;
days = linspace(startRow-1,endRow-1,endRow-startRow+1);
num_days = length(days);

resultPP = importfile(filenamePP, startRow, endRow);
result111 = importfile(filename111, startRow, endRow);
result555 = importfile(filename555, startRow, endRow);

for i=1:5
    count = [(sum(resultPP.mob_a(:) == i))/num_days, (sum(resultPP.q_a(:) == i))/num_days, sum(resultPP.test_a(:) == i)/num_days];
    count_vec(i,:) = count;
end

full_res = [[0,0,0];[0,0,0];[0,0,0];[0,0,0];[1,1,1]];

hold on
bar(count_vec)
title('Distribution of Actions: POMCPOW','FontSize',16)
xlabel('Actions','FontSize',16)
ylabel('Distribution','FontSize',16)
ylim([0,1])
legend('Mobility','Quarantine','Test','FontSize',16)


ck =1;


