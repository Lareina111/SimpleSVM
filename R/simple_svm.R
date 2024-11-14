#' Simple SVM for Binary Classification
#'
#' This function trains a basic support vector machine (SVM) for binary classification
#' using gradient descent. It classifies data with labels -1 and 1.
#'
#' @param x A matrix or data frame of predictor variables, where each row is an observation.
#' @param y A numeric vector representing the binary response variable, with values -1 or 1.
#' @param lambda A numeric value representing the regularization parameter. Defaults to 0.01.
#' @return A list containing:
#'   \item{weights}{The weights vector of the model.}
#'   \item{intercept}{The intercept (bias term) of the model.}
#' @examples
#' # Generate sample data
#' set.seed(123)
#' x <- matrix(rnorm(20), ncol = 2)
#' y <- ifelse(x[,1] + x[,2] > 0, 1, -1)
#'
#' # Train the simple SVM model
#' model <- simple_svm(x, y)
#'
#' # Print model weights and intercept
#' print(model$weights)
#' print(model$intercept)
#' @export
simple_svm <- function(X, y, learning_rate = 0.001, lambda_param = 0.01, n_iters = 1000) {
  # Convert y to binary labels (-1, 1) if not already
  y <- ifelse(y <= 0, -1, 1)

  # Initialize weights and bias
  n_samples <- nrow(X)
  n_features <- ncol(X)
  weights <- rep(0, n_features)
  bias <- 0

  # Gradient descent
  for (i in 1:n_iters) {
    for (j in 1:n_samples) {
      condition <- y[j] * (sum(X[j, ] * weights) - bias) >= 1
      if (condition) {
        # No misclassification
        weights <- weights - learning_rate * (2 * lambda_param * weights)
      } else {
        # Misclassification
        weights <- weights - learning_rate * (2 * lambda_param * weights - y[j] * X[j, ])
        bias <- bias - learning_rate * y[j]
      }
    }
  }

  # Return trained weights and bias (renamed as intercept)
  list(weights = weights, intercept = bias)
}
