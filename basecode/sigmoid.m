% PROJECT : HANDWRITTEN DIGIT RECOGNITION
% TEAM : KARTHICK KRISHNA VENKATAKRISHNAN
%        ANKIT SARRAF
%        RAHUL SINGH
% FILE : SIGMOID FUNCTION

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function g = sigmoid(z)
% sigmoid computes sigmoid function
% Notice that z can be a scalar, a vector or a matrix

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  CALCULATE THE SIGMOID %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g = 1 ./ (1 + exp(-z));

end