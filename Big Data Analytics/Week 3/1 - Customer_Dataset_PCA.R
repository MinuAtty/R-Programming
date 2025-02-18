# PCA

# Load necessary libraries
# install.packages("dplyr")
# install.packages("factoextra")

library(ggplot2)  # For visualization
library(dplyr)    # For data manipulation
library(factoextra)  # For PCA visualization

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//Downloads//Week 3//customer_data_pca.csv")  
data  # Display the dataset

# Standardize the data to ensure all variables have equal importance
scaled_data <- scale(data)  
head(scaled_data)  # Display first few rows of standardized data

# Perform Principal Component Analysis (PCA)
pca_model <- prcomp(scaled_data, center = TRUE, scale = TRUE)  
pca_model  # Display PCA model summary

# Display the proportion of variance explained by each principal component
summary(pca_model)  

# Create a Scree plot to visualize the importance of each principal component
fviz_eig(pca_model, addlabels = TRUE, ylim = c(0,100))

# Transform the dataset into principal components
pca_transformed_data <- as.data.frame(pca_model$x)  
head(pca_transformed_data)  # Display first few rows of transformed data

# Visualizing data using the first two principal components (PC1 & PC2)
ggplot(pca_transformed_data, aes(x = PC1, y = PC2)) +
  geom_point(color = "red", alpha = 0.6) +  # Scatter plot with transparency
  ggtitle("Customer Segmentation based on PC1 & PC2") +  # Title for the plot
  theme_minimal()  # Use a minimal theme for better visualization
