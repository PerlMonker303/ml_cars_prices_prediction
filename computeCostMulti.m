function J = computeCostMulti(X, y, theta)
  
  # number of training examples
  m = length(y);
  
  # initialise the cost to be 0
  sum_cost=0;
  # for each entry
  for i = 1:m
    current_row = X(i, :); # get the current row
    sum_cost += power(current_row*theta - y(i, 1), 2); # apply the formula
  endfor
  J = sum_cost/(2*m); # return the final cost
endfunction
