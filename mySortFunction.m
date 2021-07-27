function sorted = mySortFunction(col)
%Using a insertion sort algorithm to sort the data
n = length(col);
for i = 2:n
    j = i-1;
    index = i;
    
    while(j>=1)
        if(col(index)<col(j))
            temp = col(j);
            col(j) = col(index);
            col(index) = temp;
            index = j;
        end
        j =j-1;
    end
end
sorted = col;
end
        