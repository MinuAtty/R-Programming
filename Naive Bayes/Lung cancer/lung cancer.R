# Load necessary libraries

# Data visualization
# For creating a wide variety of static and interactive plots, including scatter plots, bar plots, line plots, and more
library(ggplot2)

# For statistical modeling, machine learning, and data mining
# naive Bayes and clustering methods
library(e1071)

# For simplifying the process of building and evaluating predictive models
# Classification And Regression Training - caret
library(caret)

# For data splitting and sampling
library(caTools) 

# Read the CSV file "lung.csv" into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Naive Bayes\\Lung cancer\\lung.csv")

# Display the entire dataset
data

# Display summary statistics of the dataset
summary(data)

# Create a histogram for Alcohol Usage, color-coded by Level
ggplot(data=data,aes(x=data$Alcohol.use)) + 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=data$Level))+
  xlab("Alcohol Usage")+
  ylab("Frequency")+
  ggtitle("Alcohol Usage Distribution")

# Split the dataset into training and testing sets using sample.split from caTools
split_ratio <- sample.split(data, SplitRatio = 0.75)

# Create a training dataset based on the split
training_dataset <- subset(data, split_ratio == "TRUE")

# Display the dimensions (number of rows and columns) of the training dataset
dim(training_dataset)

# Create a testing dataset based on the split
testing_dataset <- subset(data, split_ratio == "FALSE")

# Display the dimensions of the testing dataset
dim(testing_dataset)

# Display summary statistics of the testing dataset
summary(testing_dataset)

# Scale the features of the training and testing datasets
training_dataset1 <- scale(training_dataset[,1:23])
testing_dataset1  <- scale(testing_dataset[,1:23])

# Set seed for reproducibility in random processes
set.seed(100)

# Build a naive Bayes model using the 'naiveBayes' function from the e1071 package
model <- naiveBayes(Level~., data = training_dataset)

# Display summary statistics of the testing dataset (probably a mistake, as it repeats the line above)
summary(testing_dataset)

# Make predictions using the trained naive Bayes model on the testing dataset
predicted_results <- predict(model, newdata = testing_dataset)

# Display a table of the predicted results
table(predicted_results)

# Create a confusion matrix to evaluate the performance of the classification model
matrix <- table(testing_dataset$Level, predicted_results)

# Calculate additional metrics and display a confusion matrix summary using caret's confusionMatrix function
confusionMatrix(matrix)
