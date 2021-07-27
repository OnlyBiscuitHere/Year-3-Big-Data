%Calculating the median of a given column
function med = calMedian(col)
num = length(col); %Stores the length of the data
if mod(num,2) == 0 %If the data length is even
    med = num/2;
    med = med + 1;
else %If the data lenght is odd
    med = (num+1)/2;
end
med = col(med);
end