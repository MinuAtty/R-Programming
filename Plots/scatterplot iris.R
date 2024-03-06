# Load the datasets library, which includes the 'iris' dataset
library(datasets)

# Display the first six rows of the 'iris' dataset
head(iris)

# Display summary statistics of the 'iris' dataset
summary(iris)

# Create a set of plots for the 'iris' dataset
plot(iris)

# Create a plot of the 'Species' variable in the 'iris' dataset
plot(iris$Species)

# Create a plot of the 'Petal.Length' variable in the 'iris' dataset
plot(iris$Petal.Length)

# Create a scatter plot of 'Petal.Width' against 'Species' in the 'iris' dataset
plot(iris$Species, iris$Petal.Width)

# Create a scatter plot of 'Petal.Length' against 'Petal.Width' in the 'iris' dataset
plot(iris$Petal.Length, iris$Petal.Width)

# Create another set of plots for the 'iris' dataset
plot(iris)

# Create a customized scatter plot of 'Petal.Length' against 'Petal.Width'
plot(iris$Petal.Length, iris$Petal.Width,
     col = "red",
     pch = 19,       # Use solid circles for points
     main = "Iris: Petal Length vs. Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width")

# Create a plot of the cosine function over the interval [0, 2*pi]
plot(cos, 0, 2*pi)

# Create a plot of the exponential function over the interval [1, 5]
plot(exp, 1, 5)

# Create a plot of the standard normal distribution density function over the interval [-3, 3]
plot(dnorm, -3, +3)

# Create a customized plot of the standard normal distribution density function
plot(dnorm, -3, +3,
     col = "blue",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z-scores",
     ylab = "Probability density function")
