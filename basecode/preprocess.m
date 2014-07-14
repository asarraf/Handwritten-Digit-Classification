% PROJECT : HANDWRITTEN DIGIT RECOGNITION
% TEAM : ANKIT SARRAF
%        KARTHICK KRISHNA VENKATAKRISHNAN
%        RAHUL SINGH
% FILE : PREPROCESSOR

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [train_data, train_label, validation_data, validation_label, test_data, test_label] = preprocess()
% preprocess function loads the original data set, performs some preprocess
%   tasks, and output the preprocessed train, validation and test data.

% Input:
% Although this function doesn't have any input, you are required to load
% the MNIST data set from file 'mnist_all.mat'.

% Output:
% train_data: matrix of training set. Each row of train_data contains 
%   feature vector of a image
% train_label: vector of label corresponding to each image in the training
%   set
% validation_data: matrix of training set. Each row of validation_data 
%   contains feature vector of a image
% validation_label: vector of label corresponding to each image in the 
%   training set
% test_data: matrix of testing set. Each row of test_data contains 
%   feature vector of a image
% test_label: vector of label corresponding to each image in the testing
%   set

% Some suggestions for preprocessing step:
% - divide the original data set to training, validation and testing set
%       with corresponding labels
% - convert original data set from integer to double by using double()
%       function
% - normalize the data to [0, 1]
% - feature selection

load('mnist_all.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  PREPROCESSING %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add all the training data into all_train_data
all_train_data = [train0; train1; train2; train3; train4; train5; train6; train7; train8; train9];
all_train_data = double(all_train_data);
% Initialization of all_train_label with only 0's
all_train_label = zeros(size(all_train_data,1),1);

% Add all the test data into all_test_data
all_test_data = [test0; test1; test2; test3; test4; test5; test6; test7; test8; test9];
all_test_data = double(all_test_data);
% Initialization of all_train_label with only 0's
all_test_label = zeros(size(all_test_data,1),1);

% a will store the indexes of training data and the test data so that we
% may intialize the values of the respective labels correponding to the
% data which is given to us
a = zeros(10,2);

a(1,1) = size(train0,1);
a(2,1) = size(train1,1) + a(1,1);
a(3,1) = size(train2,1) + a(2,1);
a(4,1) = size(train3,1) + a(3,1);
a(5,1) = size(train4,1) + a(4,1);
a(6,1) = size(train5,1) + a(5,1);
a(7,1) = size(train6,1) + a(6,1);
a(8,1) = size(train7,1) + a(7,1);
a(9,1) = size(train8,1) + a(8,1);
a(10,1) = size(train9,1) + a(9,1);

a(1,2) = size(test0,1);
a(2,2) = size(test1,1) + a(1,2);
a(3,2) = size(test2,1) + a(2,2);
a(4,2) = size(test3,1) + a(3,2);
a(5,2) = size(test4,1) + a(4,2);
a(6,2) = size(test5,1) + a(5,2);
a(7,2) = size(test6,1) + a(6,2);
a(8,2) = size(test7,1) + a(7,2);
a(9,2) = size(test8,1) + a(8,2);
a(10,2) = size(test9,1) + a(9,2);


for i = 1:size(all_train_label,1)
    for j = 1:size(a,1)
       if i <= a(j,1)
           all_train_label(i,1) = (j-1);
           break;
       end
    end
end

for i = 1:size(all_test_label,1)
    for j = 1:size(a,1)
       if i <= a(j,2)
           all_test_label(i,1) = (j-1);
           break;
       end
    end
end

% We want to remove the columns which have std for both the matrices
% Declare a variable for that
cleanColumns = zeros(1, size(all_train_data, 2));

% Since both all_train_data and all_test_data have same number of rows
j = 1;
for i = 1 : size(cleanColumns, 2)
    % Find those columns in the test and training data
    % for which the standard deviation is zero
    if(std(all_train_data(:,i)) == 0 && std(all_test_data(:,i)) == 0)
        % cleanColumns stores such column indexes
        cleanColumns(1,j) = i;
        j = j + 1;
    end
end

cleanColumns = cleanColumns(1, 1:(j-1));

%Remove all the columns from the test and training data acording to the
%indexes stored in the clearColumns
all_test_data(:, cleanColumns) = [];
all_train_data(:, cleanColumns) = [];

% Divide rows in the all_train_data
% Put 50000 into the train_data & respectively in the train_label
% Put remaining 10000 into validation_data & respectively in
% validation_label
randomDistribution = transpose(randperm(size(all_train_data,1)));
randomDistribution1 = randomDistribution(1:10000,1);
randomDistribution2 = randomDistribution(10001:60000,1);

validation_data = zeros(size(randomDistribution1, 1), size(all_train_data, 2));
validation_label = zeros(size(randomDistribution1, 1), size(all_train_label, 2));
for i = 1:size(randomDistribution1,1)
    validation_data(i,:) = all_train_data(randomDistribution1(i,1),:);
    validation_label(i,:) = all_train_label(randomDistribution1(i,1),:);
end

train_data = zeros(size(randomDistribution2, 1), size(all_train_data, 2));
train_label = zeros(size(randomDistribution2, 1), size(all_train_label, 2));
for i = 1:size(randomDistribution2,1)
    train_data(i,:) = all_train_data(randomDistribution2(i,1),:);
    train_label(i,:) = all_train_label(randomDistribution2(i,1),:);
end

% test_data & test_label containg the test data in the random order
randomDistribution = transpose(randperm(size(all_test_data,1)));
test_data = zeros(size(all_test_data, 1), size(all_test_data, 2));
test_label = zeros(size(all_test_label, 1), size(all_test_label, 2));
for i = 1:size(randomDistribution,1)
    test_data(i,:) = all_test_data(randomDistribution(i,1),:);
    test_label(i,:) = all_test_label(randomDistribution(i,1),:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  END OF PREPROCESSING %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
