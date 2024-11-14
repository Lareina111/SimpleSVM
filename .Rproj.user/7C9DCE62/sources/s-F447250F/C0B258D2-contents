# SimpleSVM

**SimpleSVM** is an R package that implements a basic Support Vector Machine (SVM) for binary classification. It’s designed for educational purposes to demonstrate the fundamentals of SVMs using a simple gradient descent approach.

## Features
- **Binary Classification**: A straightforward linear SVM for binary classification with labels -1 and 1.
- **Gradient Descent**: Implements gradient descent with regularization for effective learning.
- **User-Friendly**: An easy-to-use interface for training and prediction on sample data.

## Installation and Usage

To install SimpleSVM directly from GitHub and run a sample model:

```r
# Install SimpleSVM from GitHub
install.packages('devtools')
devtools::install_github("Lareina111/SimpleSVM")

# Load the package
library(SimpleSVM)

# Generate sample data
set.seed(123)
x <- matrix(rnorm(20), ncol = 2)
y <- ifelse(x[,1] + x[,2] > 0, 1, -1)

# Train the simple SVM model
model <- simple_svm(x, y)

# View model results
print(model$weights)    # Model weights
print(model$intercept)  # Model intercept
