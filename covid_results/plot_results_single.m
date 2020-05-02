close all; clear all; clc;

filename = 'results_POMCPOW.txt';
action = [5,5,5]; % mob,quar,t
startRow = 2;
endRow = 100;
results = importfile(filename, startRow, endRow);
n = 20; %smoothing parameter
pop_size = 8e6;
susceptable = pop_size-results.deaths-results.sum_inc-results.removed;
days = linspace(startRow-1,endRow-1,endRow-startRow+1);

%% Plotting

%plot st each add up to 1
bottom = results.deaths'/pop_size;
next = (results.deaths'+results.sum_inc')/pop_size;
next2 = (results.deaths'+results.sum_inc'+results.removed')/pop_size;
top = (results.deaths'+results.sum_inc'+results.removed'+susceptable')/pop_size;
b=figure();
hold on
jbfill(days,top, next2,'b','b',0,0.5);
jbfill(days, next2, next, 'g','g',0,0.5);
jbfill(days, next, bottom, 'y','y',0,0.5);
jbfill(days, bottom, zeros(1,length(results.end_inc)), 'r','r',0,0.5);
hold off
%pop_per_title_str = sprintf('Population Distribution vs Days a=[%d,%d,%d]',action(1),action(2),action(3));
pop_per_title_str = sprintf('Population Distribution vs Days POMCPOW'); %%%%POMCPOW%%%%%
title(pop_per_title_str,'FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Fraction of Population','FontSize',16)
ylim([0 1])
legend('Susceptable', 'Immune', 'Infected', 'Dead','FontSize',16)
%pop_per_save_str = sprintf('pop_percent_pn_%d%d%d.png',action(1),action(2),action(3));
%pop_per_save_str = sprintf('pop_percent_pn_POMCPOW.png'); %%%%POMCPOW%%%%%
%saveas(b,pop_per_save_str)


%plot with fill not distributed
a=figure();
hold on
jbfill(days,susceptable'/pop_size, results.removed'/pop_size,'b','b',0,0.5);
jbfill(days, results.removed'/pop_size, results.sum_inc'/pop_size, 'g','g',0,0.5);
jbfill(days, results.sum_inc'/pop_size, results.deaths'/pop_size, 'y','y',0,0.5);
jbfill(days, results.deaths'/pop_size, zeros(1,length(results.end_inc)), 'r','r',0,0.5);
hold off
%pop_per_title_str = sprintf('Population Distribution vs Days a=[%d,%d,%d]',action(1),action(2),action(3));
pop_per_title_str = sprintf('Population Distribution vs Days POMCPOW'); %%%%POMCPOW%%%%%
title(pop_per_title_str,'FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Fraction of Population','FontSize',16)
ylim([0 1])
legend('Susceptable', 'Immune', 'Infected', 'Dead','FontSize',16)
%pop_per_save_str = sprintf('pop_percent_p_%d%d%d.png',action(1),action(2),action(3));
%pop_per_save_str = sprintf('pop_percent_p_POMCPOW.png'); %%%%POMCPOW%%%%%
%saveas(a,pop_per_save_str)


%plot deaths
figure()
plot(days,results.deaths,'linewidth',2)
title('Deaths vs Days','FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Deaths','FontSize',16)

%plot incidence end
figure()
%end_inc_s = smooth(results.end_inc,length(results.end_inc)/n);
%plot(days,end_inc_s,'linewidth',2)
plot(days,results.end_inc,'linewidth',2)
title('New Cases vs Days','FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Cases','FontSize',16)

%plot incidence sum
figure()
plot(days,results.sum_inc,'linewidth',2)
title('Cases vs Days','FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Incidence Sum','FontSize',16)

%plot actions
figure()
hold on
plot(days,results.mob_a,'linewidth',2) %,'r.')
plot(days,results.test_a,'linewidth',2) %,'g.')
plot(days,results.q_a,'linewidth',2)%,'b.')
title('Actions vs Days','FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Actions','FontSize',16)
legend('mobility', 'conv', 'quarantine')

%plot reward
figure()
%rew_s = smooth(results.rew,length(results.rew)/n);
%plot(days,rew_s,'linewidth',2)
plot(days,results.rew,'linewidth',2)
title('Reward vs Days','FontSize',16)
xlabel('Days','FontSize',16)
ylabel('Reward Sum','FontSize',16)
% area(days,susceptable/pop_size,'linewidth',2)
% area(days,results.removed/pop_size,'linewidth',2)
% area(days,results.deaths/pop_size,'linewidth',2)
% area(days,results.end_inc/pop_size,'linewidth',2)


