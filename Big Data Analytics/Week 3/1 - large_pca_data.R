# PCA

# Load necessary libraries
# install.packages("dplyr")
# install.packages("factoextra")

library(ggplot2)  # For visualization
library(dplyr)    # For data manipulation
library(factoextra)  # For PCA visualization

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//OneDrive//Documents//Big Data Practicals//large_pca_data.csv")  
head(data) # Display the first few rows of the dataset

# Step 1 - Standardizing the data
# Standardize the data to ensure all variables have equal importance
scaled_data <- scale(data)  
head(scaled_data)  # Display first few rows of standardized data

# Step 2 - Computing the Covariance Matrix
# Find feature pairs with high correlation
cor_matrix <- cor(scaled_data)
print(cor_matrix)

# Step 3 - Computing Eigenvalues & Eigenvectors
# Perform Principal Component Analysis (PCA)
pca_model <- prcomp(scaled_data, center = TRUE, scale = TRUE)  
pca_model$sdev^2  # Eigenvalues 
pca_model  # Display PCA model summary

# Display the proportion of variance explained by each principal component
summary(pca_model)  

# Create a Scree plot to visualize the importance of each principal component
fviz_eig(pca_model, addlabels = TRUE, ylim = c(0,100))

# Create a data frame for the variance explained by each principal component
explained_variance <- data.frame(
  PC = 1:length(pca_model$sdev),
  ExplainedVariance = (pca_model$sdev^2) / sum(pca_model$sdev^2) * 100,  # Variance explained by each component
  CumulativeVariance = cumsum((pca_model$sdev^2) / sum(pca_model$sdev^2) * 100)  # Cumulative variance
)

# Create the Scree plot with ggplot2
ggplot(explained_variance, aes(x = PC)) +
  # Explained Variance (Blue Dashed Line)
  geom_point(aes(y = ExplainedVariance), color = "blue", size = 3) +
  geom_line(aes(y = ExplainedVariance), color = "blue", linetype = "dashed") +
  
  # Cumulative Variance (Red Solid Line)
  geom_point(aes(y = CumulativeVariance), color = "red", size = 3, shape = 15) +
  geom_line(aes(y = CumulativeVariance), color = "red") +
  
  # Add a threshold line at 80% (Green Dashed Line)
  geom_hline(yintercept = 80, linetype = "dashed", color = "green") +
  
  # Labels and Titles
  labs(title = "Scree Plot - Selecting Important PCs",
       x = "Number of Principal Components",
       y = "Variance Explained (%)") +
  
  # Theme for better appearance
  theme_minimal()

# Transform the dataset into principal components
pca_transformed_data <- as.data.frame(pca_model$x)  
head(pca_transformed_data)  # Display first few rows of transformed data

# Visualizing data using the first two principal components (PC1 & PC2)
ggplot(pca_transformed_data, aes(x = PC1, y = PC2)) +
  geom_point(color = "red", alpha = 0.6) +  # Scatter plot with transparency
  ggtitle("Customer Segmentation based on PC1 & PC2") +  # Title for the plot
  theme_minimal()  # Use a minimal theme for better visualization

# Visualizing data using the Second two principal components (PC3 & PC4)
ggplot(pca_transformed_data, aes(x = PC3, y = PC4)) +
  geom_point(color = "red", alpha = 0.6) +  # Scatter plot with transparency
  ggtitle("Customer Segmentation based on PC3 & PC4") +  # Title for the plot
  theme_minimal()  # Use a minimal theme for better visualization
