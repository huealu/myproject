%********************************************************
%Draw scatter plot for training and testing set
% Created by Hue Dinh (https://github.com/huealu)
%
%********************************************************
function ScatteredPlot(ytrain,ypredtrain,ytest,ypredtest)

% Draw plot for training set
syms x y
% Calculate the mean of ytrain and ypredtrain
a = mean(ytrain);
b = mean(ypredtrain);
% Calculate the weights of linear regression
b1 = sum((ypredtrain- b).*(ytrain - a))/sum((ytrain - a).^2);
b0 = b - b1*a;

% The equation of ytrain and ypredtrain
y = b0 + b1*x;
Rtrain = 1 - sum((ytrain - ypredtrain).^2)/sum((ytrain - mean(ytrain)).^2)

% Draw linear regression plot
subplot(2,2,3)
plot(ytrain, ypredtrain, 'ro')
hold on; 
grid on
%ezplot(y,[0 600 -50 350])
title('Scatter plot between observed and predicted PM 2.5 in training set')
xlabel('Observed PM 2.5')
ylabel('Predicted PM 2.5')


% Draw plot for testing set
syms g h
% Calculate the mean of ytrain and ypredtrain
c = mean(ytest);
d = mean(ypredtest);

% Calculate the weights of linear regression
z1 = sum((ypredtest- d).*(ytest - c))/sum((ytest - c).^2);
z0 = d - z1*c;

Rtest = 1 - sum((ytest - ypredtest).^2)/sum((ytest - mean(ytest)).^2)

% The equation of ytrain and ypredtrain
g = z0 + z1*h;

% Draw linear regression plot
subplot(2,2,4)
plot(ytest, ypredtest, 'ro')
hold on; 
grid on
%ezplot(g,[0 600 -50 350])
title('Scatter plot between observed and predicted PM 2.5 in testing set')
xlabel('Observed PM 2.5')
ylabel('Predicted PM 2.5')

