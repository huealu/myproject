%********************************************************
% TrainTestDivide function to divide the data into train and test set
% Created by Hue Dinh (https://github.com/huealu)
%
%%********************************************************
function [xtrain, ytrain, xtest, ytest] = TrainTestDivide(x, y, percentage);

p = percentage
s = size(x,1)

cv = cvpartition(s, 'HoldOut', p);
xtrain = x(cv.training,:);
ytrain = y(cv.training,:);

xtest = x(cv.test,:);
ytest = y(cv.test,:);
