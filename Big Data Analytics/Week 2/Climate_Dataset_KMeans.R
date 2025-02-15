library(ggplot2)  # For data visualization

# Read the dataset 
data <- read.csv("C://Users//Minusha Attygala//Downloads//Week 2//Climate.csv")

# Display the first few rows of the dataset
head(data)

# Display the structure of the dataset (data types of each column)
str(data)

# Examine the distribution of ClimateZone values in the dataset
table(data$ClimateZone)

# Convert ClimateZone column to a factor for categorical processing
data$ClimateZone <- as.factor(data$ClimateZone)

# Plot Rainfall against Temperature, colored by ClimateZone
ggplot(data, aes(x= Rainfall, y= Temperature, color=ClimateZone))+
  geom_point(size=3, alpha=0.7)+  # Add points with size and transparency
  labs(title = "Rainfall against Temperature Distribution", # Add title and axis labels
       x = "Rainfall", 
       y = "Temperature")+
  theme_minimal()  # Use a minimal theme for better aesthetics

# Implementation of K-Means clustering

# Remove the 'Country' column (assuming it's not needed for clustering)
model_data <- data[,c("Rainfall", "Temperature")]

# Display the first few rows of the selected data
head(model_data)

# Apply the K-Means clustering algorithm
set.seed(200)  # Set seed for reproducibility
results <- kmeans(model_data, centers = 4)  # Perform clustering with 3 clusters

# Add cluster labels to the original dataset
data$Cluster <- as.factor(results$cluster)

# Plot Rainfall against Temperature, colored by assigned clusters
ggplot(data, aes(x= Rainfall, y= Temperature, colour = Cluster))+
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha=0.4)+  # Draw cluster boundaries
  geom_point(size=3, alpha=0.7)+  # Plot data points
  labs(title = "Rainfall against Temperature Distribution of Clusters", # Add title and axis labels
       x = "Rainfall", 
       y = "Temperature")+
  theme_minimal()  # Use a minimal theme for better aesthetics

# Create a contingency table to compare ClimateZone with Clusters
table(data$ClimateZone, data$Cluster)

# Disable scientific notation
options(scipen = 999)

# Run K-Means clustering for different numbers of clusters (1 to 10)
optimal_number <- sapply(1:10, function(k) kmeans(model_data, centers = k)$tot.withinss)

# Plot the Elbow Method to determine the optimal number of clusters
plot(1:10, optimal_number,  # X-axis: Number of clusters, Y-axis: Total within-cluster sum of squares
     type = "b",  # "b" type means both points and lines will be plotted
     pch = 19,  # Use solid circle points for better visibility
     col = "red",  # Set color to red for clear distinction
     xlab = "Number of Clusters",  # Label for X-axis
     ylab = "Total Within-Cluster Sum of Squares",  # Label for Y-axis
     main = "Elbow Method for Optimal Clusters")  # Title for the plot
