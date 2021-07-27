%Calculating the average of a given column
function average = calAvg(col)
colSum = 0;
for i = 1:length(col)
    colSum = colSum + col(i);
end
average = colSum/length(col); %Total of data divided the length of the data
end