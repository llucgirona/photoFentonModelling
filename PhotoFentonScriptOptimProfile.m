clc; clear all; close all;
format long
set(0,'DefaultLineLineWidth',3)

%%
addpath("read&find"); addpath("plots"); 
addpath("OF"); addpath("Dosif_H2O2"); addpath("defODE")

%%
filename = 'Experiments.xlsx';
sheet = 'Data_initial_conditions';

C0=readData(filename,sheet,'B2:B10');
Cin=readData(filename,sheet,'C2:C9');
PARAM=readData(filename,sheet,'B13:B24');
ALTRES=readData(filename,sheet,'B27:B30');

nS0 = readmatrix(filename, 'Sheet', sheet, 'Range', 'B32');
nS=nS0(1);
tSlot=15/60; %h

%%
tfin = 3.5;
sheetSave="3.5h_opt_sim";
tspan=linspace(0,tfin);
vecH2O2=optim_dosif(nS,tfin,PARAM,ALTRES,C0,Cin,tSlot);
[t,C] = ode15s(@(t,C) PhotoFentonFunctionDosif(t,C,PARAM,ALTRES,Cin,vecH2O2,nS,tSlot), tspan, C0);
writematrix(vecH2O2',filename,'Sheet',sheetSave,'Range','A2')

plot_all_profiles(t,C,filename,sheetSave)


% 
% for tfin=1:5%5
%     sheetSave=[num2str(tfin),'h'];
%     tspan=linspace(0,tfin);
%     vecH2O2=optim_dosif(nS,tfin,PARAM,ALTRES,C0,Cin,tSlot);
%     [t,C] = ode15s(@(t,C) PhotoFentonFunctionDosif(t,C,PARAM,ALTRES,Cin,vecH2O2,nS,tSlot), tspan, C0);
%     writematrix(vecH2O2',filename,'Sheet',sheetSave,'Range','N19')
% 
%     plot_all_profiles(t,C,filename,sheetSave)
% 
% end

%%

%plot_conversion(t,C(:,9))
