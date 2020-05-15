function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

# taking sample values provided in ex6.pdf 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30
C_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

# results store C, sigma, error
results = zeros(length(C_list)*length(sigma_list), 3);

# index for results row
row = 1;

# try all possible pairs of values for C and sigma
for C_val = C_list
  for sigma_val = sigma_list
    # train the model
    model= svmTrain(X, y, C_val, @(x1, x2) gaussianKernel(x1, x2, sigma_val)); 
    # get predicions vector for valiation set
    predictions = svmPredict(model, Xval);
    # get error on validation set - number of wrong predictions
    err_val = sum(abs(predictions - yval));  
    results(row, :) = [C_val, sigma_val, err_val];
    row += 1;
  endfor
endfor

# find minimum error
[min_err, min_row] = min(results(:, 3));

# get C and sigma with minimum error
C = results(min_row, 1); #results(results(:, 3)==min_err, 1);
sigma = results(min_row, 2);  #results(results(:, 3)==min_err, 1);


% =========================================================================

end
