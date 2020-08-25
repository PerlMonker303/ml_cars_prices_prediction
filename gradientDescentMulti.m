function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

# m = nr of training examples
m = length(y);
# we store the history so we know when the cost converges/diverges
J_history = zeros(num_iters, 1);

# perform num_iters iterations
for iter = 1:num_iters
  
  theta_new = theta;
  for j = 1:rows(theta) # for each theta we want to approximate better
    sum_cost_feat = 0;
    for i = 1:m # compute the sum
      hyp = X(i,:) * theta;
      sum_cost_feat += (hyp - y(i, 1)) * X(i, j:j);
    endfor
    theta_new(j) = theta(j) - alpha * sum_cost_feat / m; # store the new value of thetaj
  endfor
  
  for th = 1:rows(theta)
    theta(th) = theta_new(th);
  endfor
  
  J_history(iter) = computeCostMulti(X, y, theta);
endfor


endfunction
