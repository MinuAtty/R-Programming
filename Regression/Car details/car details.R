# Load necessary libraries

# For data visualization
library(ggplot2)

#  For data manipulation operations
library(dplyr)

# Read the CSV file "cardetails v4.csv" into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Regression\\Car details\\cardetails v4.csv")

# Display the structure of the dataset
str(data)

# Open an interactive viewer for exploring the data 
View(data)

# Create a scatter plot with a regression line using ggplot2 for 'Year' vs 'Price'
ggplot(data = data, aes(x = Year, y = Price)) +
  geom_point() +  # Scatter plot
  geom_smooth(method = lm, se = FALSE)  # Add a linear regression line without confidence intervals

# Create a scatter plot with a regression line using ggplot2 for 'Kilometer' vs 'Price'
ggplot(data = data, aes(x = Kilometer, y = Price)) +
  geom_point() +  # Scatter plot
  geom_smooth(method = lm, se = FALSE)  # Add a linear regression line without confidence intervals

# Fit a linear regression model for 'Price' as a function of 'Year'
regmodel <- lm(Price ~ Year, data = data)

# Display the coefficients of the linear regression model
coef(regmodel)
