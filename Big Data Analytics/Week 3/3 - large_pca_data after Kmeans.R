# Load necessary libraries
library(ggplot2)  # For visualization
library(dplyr)  # For data manipulation
library(factoextra)  # For PCA visualization
library(cluster)  # For clustering-related functions

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//OneDrive//Documents//Big Data Practicals//large_pca_data.csv")

# Ensure all data is numeric for PCA and K-Means
data <- data %>% select_if(is.numeric)  

# Standardization (Scaling the data)
scaled_data <- scale(data)

# Perform PCA (Principal Component Analysis)
pca_model <- prcomp(scaled_data, center = TRUE, scale = TRUE)

# Convert PCA results into a dataframe
pca_transformed_data <- as.data.frame(pca_model$x)

# K-Means clustering using the first two principal components (PC1 & PC2)
set.seed(150)  # Ensure reproducibility
cluster_results <- kmeans(pca_transformed_data[,1:2], centers = 4)

# Assign cluster labels to the transformed data
pca_transformed_data$Cluster <- as.factor(cluster_results$cluster)

# Plot PC1 vs PC2 with clusters
ggplot(pca_transformed_data, aes(x = PC1, y = PC2, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +  # Cluster boundaries
  geom_point(size = 3, alpha = 0.7) +  # Data points
  labs(title = "PC1 against PC2 Distribution of Clusters", 
       x = "PC1", 
       y = "PC2") +
  theme_minimal()

# Function to compute convex hull for cluster boundaries
compute_hull <- function(df) {
  df[chull(df$PC1, df$PC2), ]
}

# Compute convex hulls for each cluster
hull_data <- pca_transformed_data %>%
  group_by(Cluster) %>%
  group_split() %>%
  lapply(compute_hull) %>%
  bind_rows()

# Plot with convex hull boundaries
ggplot(pca_transformed_data, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point(size = 3, alpha = 0.8) +  # Data points
  geom_polygon(data = hull_data, aes(x = PC1, y = PC2, fill = Cluster), alpha = 0.3) +  # Convex hulls
  labs(title = "Cluster Boundaries using Convex Hull",
       x = "PC1",
       y = "PC2") +
  theme_minimal()
