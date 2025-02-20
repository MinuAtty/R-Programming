library(ggplot2)  # Load the ggplot2 package for data visualization

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//Downloads//Week 2//Customer_Data.csv")

# Display the first few rows of the dataset
head(data)

# Display the structure of the dataset (data types of each column)
str(data)

# Plot Annual Income against Spending Score to visualize data distribution
ggplot(data, aes(x= AnnualIncome, y= SpendingScore, color="red"))+  
  geom_point(size=3, alpha=0.7)+  # Add points with size and transparency
  labs(title = "Annual Income against Spending Score Distribution",  # Add title and axis labels
       x = "Annual Income", 
       y = "SpendingScore")+
  theme_minimal()  # Use a minimal theme for better aesthetics

# Implementation of K-Means clustering

# Select relevant columns (Annual Income and Spending Score) for clustering
model_data <- data[,c("AnnualIncome", "SpendingScore")]

# Display the first few rows of the selected data
head(model_data)

# Apply the K-Means clustering algorithm with 3 clusters
set.seed(100)  # Set seed for reproducibility
results <- kmeans(model_data, centers = 3)  # Perform clustering with 3 clusters

# Add cluster labels to the original dataset
data$Cluster <- as.factor(results$cluster)

# Plot Annual Income against Spending Score, colored by assigned clusters
ggplot(data, aes(x= AnnualIncome, y= SpendingScore, colour = Cluster))+  
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha=0.4)+  # Draw cluster boundaries
  geom_point(size=3, alpha=0.7)+  # Plot data points
  labs(title = "Annual Income against Spending Score Distribution of Clusters",  # Add title and axis labels
       x = "Annual Income", 
       y = "SpendingScore")+
  theme_minimal()  # Use a minimal theme for better aesthetics

# Finding the optimal number of clusters using the Elbow Method
optimal_number <- sapply(1:10, function(k) kmeans(model_data, centers = k)$tot.withinss)

# Plot the Elbow Method to determine the optimal number of clusters
plot(1:10, optimal_number,  # X-axis: Number of clusters, Y-axis: Total within-cluster sum of squares
     type = "b",  # "b" type means both points and lines will be plotted
     pch = 19,  # Use solid circle points for better visibility
     col = "red",  # Set color to red for clear distinction
     xlab = "Number of Clusters",  # Label for X-axis
     ylab = "Total Within-Cluster Sum of Squares",  # Label for Y-axis
     main = "Elbow Method for Optimal Clusters")  # Title for the plot
