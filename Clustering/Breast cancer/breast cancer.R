# Read the CSV file into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Clustering\\Breast cancer\\Breast_cancer_data.csv")

# Display the first six rows of the data frame
head(data)

# Display summary statistics of the data frame
summary(data)

# Set seed for reproducibility in random processes
set.seed(500)

# Perform k-means clustering on columns 4 and 5 of the data frame with 2 centers, and repeat the process 25 times with different initial cluster centers
cluster_results <- kmeans(data[, 4:5], centers = 2, nstart = 25)

# Display the results of the k-means clustering
cluster_results

# Create a contingency table to show the distribution of actual diagnoses ('data$diagnosis') across the clusters obtained from k-means
table(cluster_results$cluster, data$diagnosis)

# Load the 'cluster' library
# Cluster analysis
library(cluster)

# Generate a cluster plot for the data, coloring points based on the assigned clusters from k-means
clusplot(data, cluster_results$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0)
