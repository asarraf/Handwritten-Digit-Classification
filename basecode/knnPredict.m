% PROJECT : HANDWRITTEN DIGIT RECOGNITION
% TEAM : ANKIT SARRAF
%        KARTHICK KRISHNA VENKATAKRISHNAN
%        RAHUL SINGH
% FILE : KNN CLASSIFIER

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function label = knnPredict(k, train_data, train_label, test_data)
% knnPredict predicts the label of given data by using k-nearest neighbor
% classification algorithm

% Input:
% k: the parameter k of k-nearest neighbor algorithm
% data: matrix of data. Each row of this matrix represents the feature 
%       vector of a particular image

% Output:
% label: a column vector of predicted labels

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% KNN CLASSIFICATION %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

label = knnclassify(test_data,train_data,train_label,k);
end
