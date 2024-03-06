# Read the CSV file "winequality-red.csv" into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Clustering\\Wine quality\\Winequality-red.csv")

# Display the entire data frame
data

# Display summary statistics of the data frame
summary(data)

# Display the first six rows of the data frame
head(data)

# Set seed for reproducibility in random processes
set.seed(1500)

# Perform k-means clustering on columns 1 to 11 of the data frame with 8 centers, and repeat the process 25 times with different initial cluster centers
cluster_results <- kmeans(data[, 1:11], centers = 8, nstart = 25)

# Display the results of the k-means clustering
cluster_results

# Create a contingency table to show the distribution of actual quality values ('data$quality') across the clusters obtained from k-means
table(cluster_results$cluster, data$quality)

# Load the 'cluster' library for additional clustering-related functions
library(cluster)

# Generate a cluster plot for the data, coloring points based on the assigned clusters from k-means
clusplot(data, cluster_results$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0)
