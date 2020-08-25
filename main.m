# Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

# Load Data
test_count = 100 # last 500 data entries will be used for testing
data = csvread('./data/audi.csv');
X = [data(:, 2:2) data(:, 5:5) data(:, 7:9)];
X = X(1:end - test_count,:);
y = data(:, 3);
y = y(1:end - test_count,:);
m = length(y)

fprintf('Normalizing features ...\n');

# Normalizing features
[X mu sigma] = featureNormalize(X);

# Add intercept term to X
X = [ones(m,1) X];

# Now we begin the gradient descent for multiple variables
alpha = 0.3; # 0.3
num_iters = 10; # 10

fprintf('Starting gradient descent with learning rate %d and %d iterations ...\n', alpha, num_iters);

# Call gradient descent to get the best thetas possible for the given data
theta = zeros(columns(X), 1);
lambda = 30
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters, lambda);

fprintf('Plotting graph with cost evolution\n');

# Plot the cost graph to see if we found the best cost
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('The theta computed with gradient descent is: \n');
theta
fprintf('\n');

fprintf('Starting testing phase ...\n');

# Now we predict the price for new cars
# We will take the last 500 cars and check the accuracy
data_test = csvread("./data/audi.csv");
X_test = [data(end - test_count + 1:end, 2:2) data(end - test_count + 1:end, 5:5) data(end - test_count + 1:end, 7:9)];
y_test = data(end - test_count + 1:end, 3);
m_test = rows(y_test)

num_correct_preds = 0

# Compute the accuracy of the predictions
accuracy = computeAccuracy(X_test, y_test, theta, mu, sigma)

printf('Out of %d test entries, predicted with an average difference of %d\n', m_test, accuracy);
