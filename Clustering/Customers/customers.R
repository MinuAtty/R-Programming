# Load the ggplot2 library for data visualization
library(ggplot2)

# Load the dplyr library for data manipulation
library(dplyr)

# Read the CSV file "Customers.csv" into a data frame called 'customer_data'
customer_data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Clustering\\Customers\\Customers.csv")

# Display the structure of the data frame
str(customer_data)

# Display the first six rows of the data frame
head(customer_data)

# Create a scatter plot using ggplot, mapping Annual.Income to the x-axis and Spending.Score to the y-axis
ggplot(customer_data, aes(x = Annual.Income, y = Spending.Score)) +
  geom_point() +
  labs( 
    x = "Annual Income",
    y = "Spending Score",
    title = "Customer Segmentation")

# Extract the relevant features for clustering ("Annual.Income" and "Spending.Score")
customer_features <- customer_data[, c("Annual.Income", "Spending.Score")]

# Standardize the features using the scale function
standardized_features <- scale(customer_features)

# Set the number of clusters (k) to 3
k <- 3

# Perform k-means clustering on the standardized features with 3 clusters
kmeans_result <- kmeans(standardized_features, centers = k)

# Assign cluster labels to the original data based on the k-means results
customer_data$Cluster <- kmeans_result$cluster

# Create a scatter plot with color-coded points based on the assigned clusters
ggplot(customer_data, aes(x = Annual.Income, y = Spending.Score, color = factor(Cluster))) +
  geom_point() +
  labs(
    x = "Annual Income",
    y = "Spending Score",
    title = "Customer Segmentation with K-Means Clustering")
