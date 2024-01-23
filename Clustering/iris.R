# Use the built-in iris dataset
data <- iris

# Display the first six rows of the dataset
head(data)

# Load the ggplot2 library for data visualization
library(ggplot2)

# Create a scatter plot of Sepal.Length vs Sepal.Width, color-coded by Species
ggplot(data, aes(Sepal.Length, Sepal.Width)) +
  geom_point(aes(col = Species), size = 3)

# Create a scatter plot of Petal.Length vs Petal.Width, color-coded by Species
ggplot(data, aes(Petal.Length, Petal.Width)) +
  geom_point(aes(col = Species), size = 3)

# Set seed for reproducibility in random processes
set.seed(150)

# Perform k-means clustering on the first four columns of the data with 3 centers, and repeat the process 25 times with different initial cluster centers
cluster_results <- kmeans(data[, 1:4], centers = 3, nstart = 25)

# Display the results of the k-means clustering
cluster_results

# Create a contingency table to show the distribution of actual Species values ('data$Species') across the clusters obtained from k-means
table(cluster_results$cluster, data$Species)

# Load the 'cluster' library for additional clustering-related functions
library(cluster)

# Generate a cluster plot for the iris dataset, coloring points based on the assigned clusters from k-means
clusplot(iris, cluster_results$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0)

