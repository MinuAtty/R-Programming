# Read the first dataset 'admissions.csv' into a dataframe 'data1'
data1 <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\2nd Semester\\Logistic Regression Model Training\\admissions.csv")

# Display the dataframe in a viewer window
View(data1)

# For data visualization
library(ggplot2)

# Create a scatter plot using ggplot, mapping 'gpa' to the x-axis and 'admitted' to the y-axis
# 'geom_jitter' adds a small amount of random noise to the data points to prevent overplotting
# 'height = 0.05' controls the amount of jittering in the y-axis direction
# 'alpha = 0.1' sets the transparency of the points to 0.1 (slightly transparent)
ggplot(data1, aes(x = gpa, y = admitted)) +
  geom_jitter(height = 0.05, alpha = 0.1)

# Fit a logistic regression model where 'admitted' is the response variable and 'gpa' is the predictor
model <- glm(admitted ~ gpa, data = data1, family = "binomial")

# Print a summary of the logistic regression model
summary(model)

# Create another scatter plot similar to the first one, but with a logistic regression curve overlaid
ggplot(data1, aes(x = gpa, y = admitted)) +
  geom_jitter(height = 0.05, alpha = 0.1) +
  geom_smooth(method = 'glm',
              method.args = list(family = "binomial"))



# Read the second dataset 'diabetesmodel.csv' into a dataframe 'data2'
data2 <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\2nd Semester\\Logistic Regression Model Training\\diabetesmodel.csv")

# Check for missing values in the dataframe 'data2'
sum(is.na(data2))

# For data splitting
library(caTools)

# Split the data into training and testing sets using a split ratio of 0.8
split <- sample.split(data2, SplitRatio = 0.8)

# Subset the data into training and testing sets based on the split
training_data <- subset(data2, split == TRUE)
testing_data <- subset(data2, split == FALSE)

# Fit a logistic regression model using the training data
lg_model <- glm(Outcome ~ Pregnancies + Glucose + BloodPressure + SkinThickness + Insulin + BMI + Age, data = training_data,
                family = "binomial")

# Print a summary of the logistic regression model
summary(lg_model)

# Make predictions on the testing data using the logistic regression model
predictions <- predict(lg_model, newdata = testing_data, type = "response")

# Print the predicted probabilities
predictions

# Convert predicted probabilities into predicted classes (0 or 1) using a threshold of 0.5
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# For confusion matrix calculation
library(caret)

# Compute the confusion matrix
cm <- table(testing_data$Outcome, predicted_classes)

# Print the confusion matrix
confusionMatrix(cm)
