%********************************************************
%
%NormalizeData function
%Normalize data in range from 0 to 1
% Created by Hue Dinh (https://github.com/huealu)
%
%********************************************************
function [x] = NormalizeData(x1);
%y = (y1 - min(y1))/(max(y1) - min(y1));
minVal = min(x1);
maxVal = max(x1);
s = size(x1,2);
for i = 1:s
    x1(:,i) = (x1(:,i) - minVal(i))/(maxVal(i) - minVal(i));
end
x = x1;