# Load necessary libraries

# Contains a collection of benchmark datasets
# Machine learning and data mining research
library(mlbench) 

# For statistical modeling, machine learning, and data mining
# naive Bayes and clustering methods
library(e1071) 

# For simplifying the process of building and evaluating predictive models
# Classification And Regression Training - caret
library(caret) 

# For data splitting and sampling
library(caTools) 

# Load the BreastCancer dataset from the mlbench package
data("BreastCancer")

# Display the structure of the BreastCancer dataset
str(BreastCancer)

# Display summary statistics of the BreastCancer dataset
summary(BreastCancer)

# Display the unique levels of the 'Class' variable in the BreastCancer dataset
levels(BreastCancer$Class)

# Split the dataset into training and testing sets using sample.split from caTools
split <- sample.split(BreastCancer, SplitRatio = 0.8)

# Subset the data into training and testing sets based on the split
training_set <- subset(BreastCancer, split == TRUE)
testing_set <- subset(BreastCancer, split == FALSE)

# Display the dimensions (number of rows and columns) of the training and testing sets
dim(training_set)
dim(testing_set)

# Set seed for reproducibility in random processes
set.seed(150)

# Build a naive Bayes model using the 'naiveBayes' function from the e1071 package
model <- naiveBayes(Class ~ ., data = training_set)

# Display a summary of the testing set
summary(testing_set)

# Make predictions using the trained naive Bayes model on the testing set
predicted_results <- predict(model, newdata = testing_set)

# Display a table of the predicted results
table(predicted_results)

# Create a confusion matrix to evaluate the performance of the classification model
matrix <- table(testing_set$Class, predicted_results)

# Calculate additional metrics and display a confusion matrix summary using caret's confusionMatrix function
confusionMatrix(matrix)