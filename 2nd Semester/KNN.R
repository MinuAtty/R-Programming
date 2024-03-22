# Load required libraries
library(class)   # For k-nearest neighbors classification
library(caTools) # For data splitting

# Load iris dataset
data <- iris
View(data)       # Display the dataset in a separate window

# Split the dataset into training and testing sets
split <- sample.split(data, SplitRatio = 0.7)  # SplitRatio determines the proportion of data for training
train_set <- subset(data, split == TRUE)      # Subset of data for training
test_set <- subset(data, split == FALSE)      # Subset of data for testing

# Feature Scaling - standardize the features to have mean = 0 and standard deviation = 1
train_scale <- scale(train_set [, 1:4])  # Scale the features of the training set
test_scale <- scale(test_set [, 1:4])    # Scale the features of the test set

head(train_scale)  # Display the first few rows of the scaled training set

# Fit KNN model to the training dataset
classifier_knn <- knn(train = train_scale,     # Training data
                      test = test_scale,       # Test data
                      cl = train_set$Species,  # Class labels of the training data
                      k = 1)                   # Number of neighbors to consider (k=1 for this case)

classifier_knn    # Display the predicted classes for the test data

# Create a confusion matrix to evaluate the performance of the model
cm <- table(test_set$Species, classifier_knn)  # Compare actual vs. predicted classes
cm    # Display the confusion matrix

# Calculate the misclassification error (1 - accuracy)
misClassError <- mean(classifier_knn != test_set$Species)
print(paste('Accuracy = ', 1 - misClassError))  # Display the accuracy of the model

# Determine an initial value for k (number of neighbors)
initial_k <- sqrt(NROW(data))
initial_k    # Display the initial value of k

# Fit KNN model with k=11 to the training dataset
classifier_knn <- knn(train = train_scale, test = test_scale,
                      cl = train_set$Species, k = 11)
misClassError <- mean(classifier_knn != test_set$Species)
print(paste('Accuracy = ', 1 - misClassError))  # Display the accuracy of the model for k=11

# Fit KNN model with k=12 to the training dataset
classifier_knn <- knn(train = train_scale, test = test_scale,
                      cl = train_set$Species, k = 12)
misClassError <- mean(classifier_knn != test_set$Species)
print(paste('Accuracy = ', 1 - misClassError))  # Display the accuracy of the model for k=12
