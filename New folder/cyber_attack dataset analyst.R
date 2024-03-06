# Data Preparation 
# Install and load necessary libraries
install.packages(c("tidyverse", "caret", "arules", "cluster", "rpart", "randomForest"))

library(tidyverse)
library(caret)
library(arules)
library(cluster)
library(rpart.plot)
library(randomForest)

# Load the dataset
data <- read.csv("C:\\Users\\Minusha Attygala\\Downloads\\cybersecurity_attacks.csv")

# Check the structure of the data
str(data)

# Removing rows with missing values
data <- na.omit(data)

# Explore basic statistics
summary(data)

# Depth Analysis using Visualization Techniques
# Visualization libraries
library(ggplot2)
library(corrplot)

# Correlation matrix
cor_matrix <- cor(data)
corrplot(cor_matrix, method = "color")

`# Scatterplot matrix
pairs(data)

# Boxplots for numeric variables
numeric_vars <- sapply(data, is.numeric)
numeric_data <- data[, numeric_vars]
par(mfrow = c(2, 2))
for (i in 1:ncol(numeric_data)) {
  boxplot(numeric_data[, i] ~ data$Target_Variable, main = colnames(numeric_data)[i], xlab = "Target_Variable")
}

# Clustering
# K-means clustering
set.seed(123)
kmeans_model <- kmeans(data[, -c("ID", "Target_Variable")], centers = 3)
table(kmeans_model$cluster)

# Association Rules
# Convert data to transactions
trans <- as(data, "transactions")

# Mine association rules
rules <- apriori(trans, parameter = list(support = 0.1, confidence = 0.8))
inspect(rules)

# Regression
# Simple linear regression
lm_model <- lm(Target_Variable ~ Predictor_Variable1 + Predictor_Variable2, data = data)
summary(lm_model)

# Decision Tree Regression
dt_model <- rpart(Target_Variable ~ ., data = data)
summary(dt_model)

# Classification
# Split data into training and testing sets
set.seed(123)
train_indices <- createDataPartition(data$Target_Variable, p = 0.7, list = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Logistic Regression
logistic_model <- glm(Target_Variable ~ Predictor_Variable1 + Predictor_Variable2, data = train_data, family = "binomial")
summary(logistic_model)

# Random Forest Classification
rf_model <- randomForest(Target_Variable ~ ., data = train_data, ntree = 100)
print(rf_model)

# Evaluate the models on the test set
predictions_logistic <- predict(logistic_model, newdata = test_data, type = "response")
predictions_rf <- predict(rf_model, newdata = test_data)

# Assess model performance (e.g., accuracy, confusion matrix)
confusionMatrix(predictions_logistic, test_data$Target_Variable)
confusionMatrix(predictions_rf, test_data$Target_Variable)




