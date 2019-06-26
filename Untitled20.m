% Carbon content is predicted using Linear Regression model by observing
% length of spark and angle of spark.
% This data has been taken from:
% Novateur Publications,
% International Journal of Research publication in Engineering and
% Technology [IJRPET]
% ISSN : 2454-7875
% Volume 3, Issue 4,April, 2017
% This data is under taken following conditions:
% RPM=3600, 3/4hp, 24 Newton force, Ceremic roller, Grain size=24 grit fine
% length =length of spark=length of axis of spark/cos(40)
% angle=angle of extremes
% carbon content is in Percentage(%)


data = [104.4,18.3,0.08;99.2,20,0.18;96.9,22.8,0.40;93.6,24.9,0.45;90,28.2,0.55;67.8,33.4,0.95];
X = data(:, 1);  
z=data(:,2);
y = data(:, 3);     % results matrix
m = length(y);      % number of training examples
theta = zeros(3, 1);     % initial weights
iterations = 1500;  % Iterations needed for Gradient Descent
alpha = 0.0001;       % Learning Rate



% Compute the Cost Function
X = [ones(m, 1), data(:, 1), data(:,2)];
J = ComputeCost(X, y, theta);

% Run Gradient Descent
[theta, Js] = GradientDescent(X, y, theta, alpha, iterations);


% plotting the cost function
plot(1: iterations, Js, '-b');

% Predicting Profits
fprintf('Percentage prediction for length=100 cm , angle of spark=21  :\t%f\n', ([1, 100,21] * theta) );
fprintf('Percentage prediction for length=92 cm , angle of spark=27  :\t%f\n', ([1, 92,27] * theta));