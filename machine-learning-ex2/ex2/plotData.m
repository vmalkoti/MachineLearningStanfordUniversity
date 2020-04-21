function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

positive = find(y);   % find non-zeros
negative = find(1 .- y);  % find zeros

X_pos_score1 = X(positive, 1);
X_pos_score2 = X(positive, 2);

X_neg_score1 = X(negative, 1);
X_neg_score2 = X(negative, 2);

plot(X_pos_score1, X_pos_score2, 'k+');
plot(X_neg_score1, X_neg_score2, 'ko');


% =========================================================================



hold off;

end
