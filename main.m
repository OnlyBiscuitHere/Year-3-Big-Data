%File I/O
filename = 'car_data.csv';
fileID = fopen(filename); %Opens the file
if fileID == -1 %Checks for file
    disp('Missing file') %Displays message if missing file
end
data = {}; %Array for reading in data
while ~feof(fileID) %Reads data till empty
    tline = fgetl(fileID); %Reads in new line without the enter character
    data = [data {strsplit(tline,',')}]; %Splits the data up where the commas are and stores the data
end
fclose(fileID); %Closes the file
%Seperating the data into their respective columns
MPG = [];
displacement = [];
cylinders = [];
horsepower = [];
weight = [];
acceleration = [];
modelYear = [];
origin = [];
carName = {};
%Setting the data to the right type and storing in respective column
for i = 2:length(data)
    %Saves data for MPG
    for j = 1
        MPG = [MPG; str2double(data{i}{j})];
    end
    %Saves data for cylinders
    for j = 2
        cylinders = [cylinders; str2double(data{i}{j})];
    end
    %Saves data for displacement
    for j = 3
        displacement = [displacement; str2double(data{i}{j})];
    end
    %Saves data for horsepower
    for j = 4
        horsepower = [horsepower; str2double(data{i}{j})];
    end
    %Saves data for weigth
    for j = 5
        weight = [weight; str2double(data{i}{j})];
    end
    %Saves data for acceleration
    for j = 6
        acceleration = [acceleration; str2double(data{i}{j})];
    end
    %Saves data for modelYear column
    for j = 7
        modelYear = [modelYear; str2double(data{i}{j})];
    end
    %Saves data for origin
    for j = 8
        origin = [origin; str2double(data{i}{j})];
    end
    %Saves data for carName
    for j = 9
        carName = [carName; data{i}{j}];
    end
end
%Mean value imputation
MPG(isnan(MPG))=0;
MPGSum = 0;
for i = 1:length(MPG)
    MPGSum = MPGSum + MPG(i);
end
MPGAvg = MPGSum/length(MPG);
MPG(MPG==0) = MPGAvg;

cylinders(isnan(cylinders)) = 0;
cylindersSum = 0;
for i = 1:length(cylinders)
    cylindersSum = cylindersSum + cylinders(i);
end
cylindersAvg = cylindersSum/length(cylinders);
cylinders(cylinders==0) = cylindersAvg;

displacement(isnan(displacement)) = 0;
displacementSum = 0;
for i = 1:length(displacement)
    displacementSum = displacementSum + displacement(i);
end
displacementAvg = displacementSum/length(displacement);
displacement(displacement==0) = displacementAvg;

horsepower(isnan(horsepower)) = 0;
horsepowerSum = 0;
for i = 1:length(horsepower)
    horsepowerSum = horsepowerSum + horsepower(i);
end
horsepowerAvg = horsepowerSum/length(horsepower);
horsepower(horsepower==0) = horsepowerAvg;

weight(isnan(weight)) = 0;
weightSum = 0;
for i = 1:length(weight)
    weightSum = weightSum + weight(i);
end
weightAvg = weightSum/length(weight);
weight(weight==0) = weightAvg;

acceleration(isnan(acceleration)) = 0;
accelerationSum = 0;
for i = 1:length(acceleration)
    accelerationSum = accelerationSum + acceleration(i);
end
accelerationAvg = accelerationSum/length(acceleration);
acceleration(acceleration==0) = accelerationAvg;

modelYear(isnan(modelYear)) = 0;
modelYearSum = 0;
for i = 1:length(modelYear)
    modelYearSum = modelYearSum + modelYear(i);
end
modelYearAvg = modelYearSum/length(modelYear);
modelYear(modelYear==0) = modelYearAvg;

origin(isnan(origin)) = 0;
originSum = 0;
for i = 1:length(origin)
    originSum = originSum + origin(i);
end
originAvg = originSum/length(origin);
origin(origin==0) = originAvg;

%Section 3
%Spliting data
num = length(data)-1;
index = randperm(num); %Sets random index
%Array initialisers
shuffledMPG = []; 
shuffledCylinders = [];
shuffledDisplacement = [];
shuffledHorsepower = [];
shuffledWeight = [];
shuffledAcceleration = [];
shuffledModelYear = [];
shuffledOrigin = [];
shuffledCarName = [];
%Training array initialisers
trainingMPG = []; 
trainingCylinders = [];
trainingDisplacement = [];
trainingHorsepower = [];
trainingWeight = [];
trainingAcceleration = [];
trainingModelYear = [];
trainingOrigin = [];
trainingCarName = [];
%Testing array initialisers
testMPG = []; 
testCylinders = [];
testDisplacement = [];
testHorsepower = [];
testWeight = [];
testAcceleration = [];
testModelYear = [];
testOrigin = [];
testCarName = [];
%Inputting the shuffled data into array
shuffledMPG = [shuffledMPG; MPG(index)];
shuffledCylinders = [shuffledCylinders; cylinders(index)];
shuffledDisplacement = [shuffledDisplacement; displacement(index)];
shuffledHorsepower = [shuffledHorsepower; horsepower(index)];
shuffledWeight = [shuffledWeight; weight(index)];
shuffledAcceleration = [shuffledAcceleration; acceleration(index)];
shuffledModelYear = [shuffledModelYear; modelYear(index)];
shuffledOrigin = [shuffledOrigin; origin(index)];
shuffledCarName = [shuffledCarName; carName(index)];
%Defining the training and test sets
trainingSet = round(0.7 * num);
testSet = round(0.3 * num);
%Putting data into the training set
trainingMPG = [trainingMPG; shuffledMPG(1:trainingSet)]; 
trainingCylinders = [trainingCylinders; shuffledCylinders(1:trainingSet)];
trainingDisplacement = [trainingDisplacement; shuffledDisplacement(1:trainingSet)];
trainingHorsepower = [trainingHorsepower; shuffledHorsepower(1:trainingSet)];
trainingWeight = [trainingWeight; shuffledWeight(1:trainingSet)];
trainingAcceleration = [trainingAcceleration; shuffledAcceleration(1:trainingSet)];
trainingModelYear = [trainingModelYear; shuffledModelYear(1:trainingSet)];
trainingOrigin = [trainingOrigin; shuffledOrigin(1:trainingSet)];
trainingCarName = [trainingCarName; shuffledCarName(1:trainingSet)];
%Putting data into the test set
testMPG = [testMPG; shuffledMPG(trainingSet:length(shuffledMPG))]; 
testCylinders = [testCylinders; shuffledCylinders(trainingSet:length(shuffledCylinders))];
testDisplacement = [testDisplacement; shuffledDisplacement(trainingSet:length(shuffledDisplacement))];
testHorsepower = [testHorsepower; shuffledHorsepower(trainingSet:length(shuffledHorsepower))];
testWeight = [testWeight; shuffledWeight(trainingSet:length(shuffledWeight))];
testAcceleration = [testAcceleration; shuffledAcceleration(trainingSet:length(shuffledAcceleration))];
testModelYear = [testModelYear; shuffledModelYear(trainingSet:length(shuffledModelYear))];
testOrigin = [testOrigin; shuffledOrigin(trainingSet:length(shuffledOrigin))];
testCarName = [testCarName; shuffledCarName(trainingSet:length(shuffledCarName))];