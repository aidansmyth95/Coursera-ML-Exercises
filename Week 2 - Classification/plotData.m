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

ind_acc = find(y==1);   % index of students admitted
ind_rej = find(y==0);   % index of students rejected

plot(X(ind_acc,1),X(ind_acc,2),'k+','LineWidth', 2,'MarkerSize', 7);
plot(X(ind_rej,1),X(ind_rej,2),'ko','MarkerFaceColor', 'y','MarkerSize', 7);

% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')

% =========================================================================

hold off;

end
