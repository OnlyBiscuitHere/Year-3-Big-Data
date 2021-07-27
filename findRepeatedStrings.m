%Finding repeated strings values
function rep = findRepeatedStrings(col, car)
rep = 0; %Counter
index = strfind(col, car); %For finding the location of the string
for i = 1:length(index) %Searches whole array
    if index{i} == 1 
        rep = rep + 1; %Increments when the string has been found
    end
end
end
