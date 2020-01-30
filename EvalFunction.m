% Evaluation function for training and testing set
%
% define EvalFunction function
function [z,e, RMSE] = EvalFunction(yt,ypredt)
z = immse(yt,ypredt)
e = mean((yt - ypredt).^2)
RMSE = sqrt(e)

