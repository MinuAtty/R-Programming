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

# Load the iris dataset
data("iris")

# Display the entire iris dataset
iris
# Display summary statistics of the iris dataset
summary(iris)

# Create a histogram for Sepal Length, color-coded by Species
ggplot(data=iris,aes(x=iris$Sepal.Length)) + 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Sepal Length")+
  ylab("Frequency")+
  ggtitle("Sepal Length Distribution")

# Create a histogram for Sepal Width, color-coded by Species
ggplot(data=iris,aes(x=iris$Sepal.Width)) + 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Sepal Width")+
  ylab("Frequency")+
  ggtitle("Sepal Width Distribution")                 

# Create a histogram for Petal Length, color-coded by Species
ggplot(data=iris,aes(x=iris$Petal.Length)) + 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Petal Length")+
  ylab("Frequency")+
  ggtitle("Petal Length Distribution")

# Create a histogram for Petal Width, color-coded by Species
ggplot(data=iris,aes(x=iris$Petal.Width)) + 
  geom_histogram(binwidth = 0.3, color="black",aes(fill=Species))+
  xlab("Petal Width")+
  ylab("Frequency")+
  ggtitle("Petal Width Distribution")

# Split the dataset into training and testing sets using sample.split from caTools
split_ratio <- sample.split(iris, SplitRatio = 0.75)

# Create a training dataset based on the split
training_dataset <- subset(iris, split_ratio == "TRUE")
dim(training_dataset)

# Create a testing dataset based on the split
testing_dataset <- subset(iris, split_ratio == "FALSE")
dim(testing_dataset)

# Display summary statistics of the testing dataset
summary(testing_dataset)

# Scale the features of the training and testing datasets
training_dataset1 <- scale(training_dataset[, 1:4])
testing_dataset1  <- scale(testing_dataset[, 1:4])

# Set seed for reproducibility in random processes
set.seed(100)

# Build a naive Bayes model using the 'naiveBayes' function from the e1071 package
model <- naiveBayes(Species ~ ., data = training_dataset)

# Display summary statistics of the testing dataset (probably a mistake, as it repeats the line above)
summary(testing_dataset)

# Make predictions using the trained naive Bayes model on the testing dataset
predicted_results <- predict(model, newdata = testing_dataset)

# Display a table of the predicted results
table(predicted_results)

# Create a confusion matrix to evaluate the performance of the classification model
matrix <- table(testing_dataset$Species, predicted_results)

# Calculate additional metrics and display a confusion matrix summary using caret's confusionMatrix function
confusionMatrix(matrix)
