%********************************************************
% ANN model for PM 2.5 prediction
% Created by Hue Dinh (https://github.com/huealu)
%*********************************************************
clc
clear all; 
close all;
%*********************************************************
File = readtable ('Data2013.xlsx') % Read data from file
x0 = File{:, 7:16}
y0 = File{:, 17}
x = NormalizeData(x0);
y = NormalizeData(y0);

format short g;
nntwarn off
[xtrain, ytrain, xtest, ytest] = TrainTestDivide(x, y, 0.3);
%---------------------------------------------------------
n = length(ytrain)
m = length(ytest)
%---------------------------------------------------------
node = 10 % number of hidden layer nodes
node1 = 1
%---------------------------------------------------------
% Create a feed-forward backpropagation network
net =...
    newff(xtrain', ytrain',[node node1], {'tansig' 'tansig' 'purelin'}, 'trainlm','learngdm','mse')
net.trainParam.epochs       = 500;
net.trainParam.goal         = 0;
net.trainParam.max_fail     = 500; 
net.trainParam.show         = 5;
net.trainParam.mu_dec       = 1e-5;
net.trainParam.mu_inc       = 2;
net.trainParam.mu_max       = 10000;
net.trainParam.min_grad     = 1e-5;
%*********************************************************
% Training stage
%*********************************************************
net = init(net)
[net,tr] = train(net,xtrain',ytrain')
%*********************************************************
% Simulation and calculating error
%*********************************************************
ypredtrain   = sim(net,xtrain')';
ypredtest    = sim(net,xtest')';
%*********************************************************
% Neural Network covergence
%*********************************************************
figure(3)   
semilogy(tr.epoch,tr.perf,'LineWidth',2);
xlabel('{\bf Epochs}'); grid;
ylabel('{\bf MSE}');
title('{\bf NN convergence}');
%*********************************************************
% Drawing the results
%*********************************************************
%close all;
x1='{\bf Observed and Estimated PM 2.5 Using Regression - Training Case}';
x2='{\bf Observed and Estimated PM 2.5 Using Regression - Testing Case}';
draw_train_test(ytrain,ypredtrain,ytest,ypredtest,x1,x2); % draw function %
%*********************************************************
% Scattered Plot
%*********************************************************
ScatteredPlot(ytrain,ypredtrain,ytest,ypredtest); % Scatter plot function %
%*********************************************************
% Evaluation criterion
%*********************************************************
disp('--------Training Results---------');
[zA,eA,RMSE1] = EvalFunction(ytrain,ypredtrain);   % Eval function %

disp('--------Testing Results---------');
[zB,eB,RMSE2] = EvalFunction(ytest,ypredtest);

[zA zB]
%*********************************************************
