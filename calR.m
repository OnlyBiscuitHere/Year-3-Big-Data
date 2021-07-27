%Function for calculating the correlation coefficient
function r = calR(col1, col2)
num1 = length(col1);%Stores the length of the first column
num2 = length(col2);%Stores the length of the second column
%Storing the averages of each column
colSum1 = 0;
colSum2 = 0;
for i = 1:length(col1)
    colSum1 = colSum1 + col1(i);
    colSum2 = colSum2 + col2(i);
end
average1 = colSum1/num1;
average2 = colSum2/num2;
[sxy, s2x, s2y] = deal(0,0,0); %Sets up data for storing each variable
for i = 1:length(col1)
    sxy = sxy + (col1(i) -  average1)*(col2(i) - average2);
    s2x = s2x + (col1(i) - average1)^2;
    s2y = s2y + (col2(i) - average2)^2;
end
r = sxy /(sqrt(s2x)*sqrt(s2y)); %Returning the correlation coefficient
end