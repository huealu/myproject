%********************************************************
%
% Draw plot for y training and y testing set
% Created by Hue Dinh (https://github.com/huealu)
%
%********************************************************
function draw_train_test(ytrain,ypredtrain,ytest,ypredtest,x1,x2)

% Draw plot for training set
subplot(2,2,1)
plot(ytrain, 'k-')
hold on
plot(ypredtrain, 'r-')
title(x1)
xlabel('Day')
ylabel('PM 2.5 concentration')


% Draw plot for training set
subplot(2,2,2)
plot(ytest, 'k-')
hold on
plot(ypredtest, 'r-')
title(x2)
xlabel('Day')
ylabel('PM 2.5 concentration')



