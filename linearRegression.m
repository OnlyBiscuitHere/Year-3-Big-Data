function line = linearRegression(col1, col2)
%Working out the linear regression
x1 = col1;
y1 = col2;
format long
X = [ones(length(x1),1) x1]; % for working out the y-intercept
b = X\y1; %gradient and coefficient
yCalc = X*b;
scatter(x1,y1,'r')%Scatter the data
hold on
plot(x1,yCalc, 'b')%Plots fit
xlabel('Weight')
ylabel('Horsepower')
title('Linear Regression relation between Horsepower and Weight')
grid on
legend('Ground Truth','Predicted Values','Location','best'); 
y1Sum = 0;
for i = 1:length(y1)
    y1Sum = y1Sum + y1(i);
end
average = y1Sum/length(y1);
Rsq2 = 1 - sum((y1 - yCalc).^2)/sum((y1 - average).^2); %residual
%Mean Sqaured Error(MSE) calculation
format short
mse = sum((y1-yCalc).^2)/length(yCalc)
end