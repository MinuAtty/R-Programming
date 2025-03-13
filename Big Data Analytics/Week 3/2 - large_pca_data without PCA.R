# Load necessary libraries for data visualization and manipulation
library(ggplot2)  # For creating plots
library(dplyr)  # For data manipulation
library(factoextra)  # For cluster visualization

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//Downloads//Week 3//large_pca_data.csv")

# Display the first few rows of the dataset to understand its structure
head(data)

# Display the structure of the dataset, including variable types
str(data)

# Apply the K-Means clustering algorithm
set.seed(150)  # Set a random seed to ensure reproducibility of results

# Apply K-Means clustering with 3 clusters
results <- kmeans(pca_transformed_data, centers = 3)

# Add the cluster labels to the original dataset
data$Cluster <- as.factor(results$cluster)

# Scatter plot of Age vs Annual Income, colored by cluster labels
ggplot(data, aes(x = Annual_Income, y = Age, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +  # Draw cluster boundaries with transparency
  geom_point(size = 3, alpha = 0.7) +  # Plot data points with slight transparency
  labs(title = "Age vs Annual Income Distribution of Clusters",  # Title for the plot
       x = "Annual Income",  # X-axis label
       y = "Age") +  # Y-axis label
  theme_minimal()  # Use a clean and minimalistic theme for better readability

# Scatter plot of Age vs Spending Score, colored by cluster labels
ggplot(data, aes(x = Spending_Score, y = Age, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +  # Draw cluster boundaries with transparency
  geom_point(size = 3, alpha = 0.7) +  # Plot data points with slight transparency
  labs(title = "Age vs Spending Score Distribution of Clusters",  # Title for the plot
       x = "Spending Score",  # X-axis label
       y = "Age") +  # Y-axis label
  theme_minimal()  # Use a minimal theme

# Scatter plot of Annual Income vs Spending Score, colored by cluster labels
ggplot(data, aes(x = Annual_Income, y = Spending_Score, color = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha = 0.4) +  # Draw cluster boundaries with transparency
  geom_point(size = 3, alpha = 0.7) +  # Plot data points with slight transparency
  labs(title = "Annual Income vs Spending Score Distribution of Clusters",  # Title for the plot
       x = "Annual Income",  # X-axis label
       y = "Spending Score") +  # Y-axis label
  theme_minimal()  # Use a minimal theme for better aesthetics
