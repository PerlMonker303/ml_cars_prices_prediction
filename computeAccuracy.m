function accuracy = computeAccuracy (X_test, y_test, theta, mu, sigma)
  # computes the accuracy of the predictions
  m_test = rows(y_test);
  accuracy = 0
  
  for i = 1:m_test
    new_entry = X_test(i, :); # take the current entry from the test data
    
    # normalize the data
    for j = 1:columns(new_entry)
      new_entry(1,j) = (new_entry(1, j) - mu(1, j)) / sigma(1, j);
    endfor
    
    # add a default column for vectorization purposes
    new_entry = [ones(1,1) new_entry];
    
    price = new_entry * theta;
    
    accuracy += abs(price - y_test(i,1));
    
  endfor
  
  accuracy /= m_test;
  
endfunction
