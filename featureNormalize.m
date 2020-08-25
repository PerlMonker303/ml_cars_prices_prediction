function [X_norm, mu, sigma] = featureNormalization(X)
  
#initialise mu and sigma
X_norm = X;
mu = zeros(1, columns(X));
sigma = zeros(1, columns(X));


#sigma and miu are ONE ROW matrices
#calculate the mean values for each COLUMN - feature
for col = 1:columns(X_norm)
  mu(1,col) = mean(X_norm(:,col));
endfor  


#go through the entries and subtract the mean value
for row = 1:rows(X_norm)
  for col = 1:columns(X_norm)
    X_norm(row, col) = X_norm(row, col) - mu(1,col);
  endfor
endfor


#calculate the standard deviation for each column
for col = 1:columns(X_norm)
  sigma(1,col) = std(X_norm(:,col));
endfor


#go through the entries and divide by the std deviation
for row = 1:rows(X_norm)
  for col = 1:columns(X_norm)
    X_norm(row,col) = X_norm(row,col) / sigma(1,col);
  endfor
endfor


#X_norm - holds the result
X = X_norm;

#we store sigma and miu such that when we want to predict the price for a new house
#we first have to normalize it using these values

endfunction
