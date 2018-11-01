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

min_error = Inf;
hparam_values = [0.001 0.003 0.01 0.03 0.1 0.3 1 3 10 30];

for C_loop = hparam_values
  for sigma_loop = hparam_values
    trained_model = svmTrain(X, y, C_loop, @(x1, x2) gaussianKernel(x1, x2, sigma_loop));
    prediction_error   = mean(double(svmPredict(trained_model, Xval) ~= yval));
    if( prediction_error <= min_error )
      C     = C_loop;
      sigma = sigma_loop;
      min_error   = prediction_error;
      fprintf('Update: C = %f, Sigma = %f.', C, sigma)
    end
  end
end

fprintf('End of hyperparamter tuning: C = %f, Sigma = %f.', C, sigma)

% =========================================================================

end
