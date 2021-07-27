%Calculating the Standard deviation
function sd = calSD(col)
num = length(col);
colSum = 0;
for i = 1:length(col)
    colSum = colSum + col(i);
end
average = colSum/num;
sd = sqrt(sum((col - average).^2/(num-1)));
end