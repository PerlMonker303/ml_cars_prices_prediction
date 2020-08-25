<h1>Supervised Learning Practice</h1>
<h2>Description</h2>
<p>Implemented the gradient descent algorithm in Octave to predict the prices of cars based on a training set consisting of 10k cars for sale from the UK. (taken from <a href="https://www.kaggle.com/adityadesai13/used-car-dataset-ford-and-mercedes">here</a>. The features are scaled using the Mean Normalization algorithm.</br>
I wrote this small project to practice my understanding of linear regression with multiple variables and gradient descent for minimizing the cost J(theta) and improving the predictions. I also give a graphical representation for understanding the evolution of the cost (based on the learning rate and the number of iterations).
</p>
<h2>Results</h2>
<p>
  The script managed to predict 100 cars prices with a mean difference of 4245.02 pounds when <i>alpha</i> = 0,3 and <i>num_iterations</i> = 10. Other choices for <i>alpha</i> and <i>num_iterations</i> were also considered, however the best results were given by the previously mentioned values.
</p>
<h2>Concepts practiced</h2>
<ul>
  <li>Multivariable Linear Regression</li>
  <li>Batch Gradient Descent</li>
  <li>Feature Scaling using Mean Normalization</li>
</ul>
