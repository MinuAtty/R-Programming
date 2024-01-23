# Load necessary libraries

# For learning and practicing statistical concepts and machine learning techniques
# Introduction to Statistical Learning with Applications in R - ISLR
library(ISLR)

# For simplifying the process of building and evaluating predictive models
# Classification And Regression Training - caret
library(caret)

# For visualizing decision trees built using the rpart package
library(rpart.plot)

# For data manipulation and visualization
library(tidyverse)

# For generating summary statistics and visualizations of data
library(skimr)

# Read the CSV file "car_evaluation.csv" into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Decision Tree\\Car evaluation\\car_evaluation.csv")

# Display the entire dataset
data

# Display summary statistics of the dataset
summary(data)

# Transform the skim output to a wide format
skim_to_wide(data)

# Display skim summary statistics of the dataset
skim(data)

# Set seed for reproducibility in random processes
set.seed(1800)

# Create a data partition for training and testing sets
partition <- createDataPartition(y = data$unacc, p = 0.75, list = FALSE)

# Create training and testing datasets based on the partition
datatrain <- data[partition, ]
datatest <- data[-partition, ]

# Remove the 'partition' variable from the environment
rm(partition)

# Set seed for reproducibility in random processes
set.seed(1000)

# Build a decision tree classifier using the 'rpart' function
classifier <- rpart(formula = unacc ~ .,
                    data = datatrain,
                    method = "class",
                    xval = 10)

# Plot the decision tree using rpart.plot
rpart.plot(classifier, yesno = TRUE)
