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
simple_svm <- function(x, y, lambda = 0.01) {
  n <- nrow(x)
  p <- ncol(x)
  y <- as.numeric(y)

  # Initialize weights and bias
  w <- rep(0, p)
  b <- 0

  # Gradient descent parameters
  learning_rate <- 0.01
  epochs <- 1000

  # Train the model using gradient descent
  for (epoch in 1:epochs) {
    for (i in 1:n) {
      if (y[i] * (sum(w * x[i, ]) + b) < 1) {
        # Update rule when misclassified
        w <- w + learning_rate * ((y[i] * x[i, ]) - (2 * lambda * w))
        b <- b + learning_rate * y[i]
      } else {
        # Update rule when correctly classified
        w <- w - learning_rate * (2 * lambda * w)
      }
    }
  }

  list(weights = w, intercept = b)
}
