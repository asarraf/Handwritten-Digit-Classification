% PROJECT : HANDWRITTEN DIGIT RECOGNITION
% TEAM : ANKIT SARRAF
%        KARTHICK KRISHNA VENKATAKRISHNAN
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
