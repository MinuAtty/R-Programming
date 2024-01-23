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

# Load the OJ dataset from the ISLR package
dataset <- OJ

# Display the entire dataset
dataset

# Transform the skim output to a wide format
skim_to_wide(dataset)

# Split the dataset into training and testing sets
splitt <- createDataPartition(y = dataset$Purchase, p = 0.75, list = FALSE)

# Create training and testing datasets based on the partition
train <- dataset[splitt, ]
test <- dataset[-splitt, ]

# Display the dimensions (number of rows and columns) of the training dataset
dim(train)

# Display the dimensions of the testing dataset
dim(test)

# Set seed for reproducibility in random processes
set.seed(15000)

# Build a decision tree classifier using the 'rpart' function
dec_tree <- rpart(formula = Purchase ~ .,
                  data = train,
                  method = "class",
                  xval = 10
)

# Plot the decision tree using rpart.plot
rpart.plot(dec_tree, yesno = TRUE)
