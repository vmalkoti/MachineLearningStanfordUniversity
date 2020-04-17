function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% hypothesis : h(x) = theta0 + theta1*x1
h = X * theta;

% error : e = h(x) - y
e = (h - y);

% cost: j(theta) = 1/2m * sum((h(x)-y)^2) -OR- 1/2m * sum(sqr(e))
J = (1/(2*m)) * sum(e.^2);

% =========================================================================

end
