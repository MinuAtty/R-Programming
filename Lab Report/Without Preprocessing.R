# Load libraries
library(naivebayes)
library(caret)
library(e1071)

# Load the dataset
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Lab Report\\student_portuguese_clean.csv")

# Split the dataset into training and testing sets
set.seed(600)
splitIndex <- createDataPartition(data$final_grade, p = 0.7, list = FALSE)
train_data <- data[splitIndex, ]
test_data <- data[-splitIndex, ]

# Train the Naive Bayes model
model <- naiveBayes(final_grade ~ ., data = train_data)

# Make predictions on the test set
predictions <- predict(model, test_data)

# Evaluate the model
accuracy <- sum(predictions == test_data$final_grade) / nrow(test_data)
print(paste("Accuracy without preprocessing:", round(accuracy, 4)))

