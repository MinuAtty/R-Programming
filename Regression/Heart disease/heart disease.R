# Load necessary libraries

# For data visualization
library(ggplot2)

#  For data manipulation operations
library(dplyr)

# Read the CSV file "heart_disease.csv" into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Regression\\Heart disease\\heart_disease.csv")

# Display the structure of the dataset
str(data)

# Create a scatter plot with a regression line using ggplot2
ggplot(data = data, aes(x = age, y = resting_blood_pressure)) +
  geom_point() +  
  geom_smooth(method = lm, se = FALSE)  

# Fit a linear regression model
regmodel <- lm(resting_blood_pressure ~ age, data = data)

# Display the coefficients of the regression model
coef(regmodel)
