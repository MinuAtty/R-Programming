# Load libraries
library(e1071)
library(caret)
library(dplyr)

# Load the dataset
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Lab Report\\student_portuguese_clean.csv")

# Preprocess the data
data_preprocessed <- data %>% mutate(
    age = as.factor(age),
    study_time = as.factor(study_time),
    final_grade = as.factor(final_grade)
  )

# Split the preprocessed data into training and testing sets
train_index <- createDataPartition(data_preprocessed$final_grade, p = 0.7, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Set seed for reproducibility
resample <- createResample(data_preprocessed$final_grade, times = 1, list = FALSE)

# Train the Naive Bayes model with preprocessing
model <- naiveBayes(final_grade ~ ., data = train_data)

# Predict the final grade for the test data
predictions <- predict(model, test_data)

# Evaluate the model performance with preprocessing
confusion_matrix <- table(test_data$final_grade, predictions)
accuracy <- mean(diag(confusion_matrix))
print(paste("Accuracy with preprocessing:", accuracy))
