clc; clear; close all;
load code_for_studs\in_data.mat

i = 5;
figure
% y2 = exp(-sqrt(x(:,i))).*2;
% y2 = log(log((x(:,i)+1)./x(:,i)));
y2 = abs(x(:,i));

plot(x(:,i),y(:,i),x(:,i),y2);
grid on

fcn_checker(x(:,i),y(:,i))