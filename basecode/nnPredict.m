% PROJECT : HANDWRITTEN DIGIT RECOGNITION
% TEAM : ANKIT SARRAF
%        KARTHICK KRISHNA VENKATAKRISHNAN
%        RAHUL SINGH
% FILE : DIGIT PREDICTOR

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function label = nnPredict(w1, w2, data)
% nnPredict predicts the label of data given the parameter w1, w2 of Neural
% Network.

% Input:
% w1: matrix of weights of connections from input layer to hidden layers.
%     w1(i, j) represents the weight of connection from unit j in input 
%     layer to unit j in hidden layer.
% w2: matrix of weights of connections from hidden layer to output layers.
%     w2(i, j) represents the weight of connection from unit j in input 
%     layer to unit j in hidden layer.
% data: matrix of data. Each row of this matrix represents the feature 
%       vector of a particular image
       
% Output: 
% label: a column vector of predicted labels

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   PREDICTION %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% w1 => 50 X 720
% w2 => 10 X 51
% data => 50000 X 719

% Normalization
data = double(data)/255;
N = size(data, 1);                              % 50000

x = ones(N, size(w1, 2));                       % 50000 X 720
x(1:size(data,1), 1:size(data,2)) = data;


% aj => 50000 X 50
aj = x * transpose(w1);                         % 50000 X 50
zj = sigmoid(aj);
zj = horzcat(zj, ones(N,1));                    % Adding one column of ones


% bk => 50000 X 10
% yk => 50000 X 10
bk = zj * transpose(w2);
yk = sigmoid(bk);

label = zeros(size(yk,1),1);

% Store the row wise maximum value of yk in the label
for i = 1 : size(yk,1)
    label (i,1) = find(yk(i,:) == max(yk(i,:)), 1 ) - 1;
end
