library(ggplot2)  # Load the ggplot2 library for data visualization

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//Downloads//Week 2//origin.csv")
head(data)  # Display the first few rows of the dataset
str(data)   # Show the structure of the dataset

# Examine the dataset by counting occurrences of each country
table(data$Country)

# Convert the Country column to a factor type for categorical processing
data$Country <- as.factor(data$Country)

# Plot a scatter plot of Height vs Weight, colored by Country
ggplot(data, aes(x= Height, y= Weight, color=Country)) +
  geom_point(size=3, alpha=0.7) +  # Add points with size and transparency
  labs(title = "Height against Weight Distribution", # Add title and axis labels
       x = "Height", 
       y = "Weight") +
  theme_minimal()  # Apply a minimal theme for better aesthetics

# Implementing K-Means Clustering

# Remove the Country column and retain only numerical data (Height, Weight)
model_data <- data[,c("Height", "Weight")]
head(model_data)  # Display the first few rows of the modified dataset

# Apply K-Means clustering with 3 clusters
set.seed(150)  # Set seed for reproducibility
results <- kmeans(model_data, centers = 3)

# Add the cluster labels to the original dataset
data$Cluster <- as.factor(results$cluster)

# Plot the clustered data with ellipses around clusters
ggplot(data, aes(x= Height, y= Weight, colour = Cluster)) +
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha=0.4) +  # Add ellipses
  geom_point(size=3, alpha=0.7) +  # Add data points
  labs(title = "Height against Weight Distribution of Clusters", 
       x = "Height", 
       y = "Weight") +
  theme_minimal()  # Apply minimal theme

# Display a table comparing original Country data with Clusters assigned by K-Means
table(data$Country, data$Cluster)

# Determine the optimal number of clusters using the Elbow Method
optimal_number <- sapply(1:10, function(k) kmeans(model_data, centers = k)$tot.withinss)

# Plot the Elbow Method graph to determine the best number of clusters
plot(1:10, optimal_number, type = "b", pch=19, col="red", 
     main = "Elbow Method for Optimal Clusters",
     xlab = "Number of Clusters",
     ylab = "Total Within-Cluster Sum of Squares")
