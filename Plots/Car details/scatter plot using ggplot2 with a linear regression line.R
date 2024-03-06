# Load necessary libraries
library(ggplot2) # data visualizations
library(dplyr) # data manipulation tasks

# Read the CSV file into a data frame
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Plots\\Car details\\cardetails v4.csv")

# Display the structure of the data frame
str(data)

# Create a scatter plot with a linear regression line
ggplot(data = data, aes(x = data$Year, y = data$Price)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

# Create a scatter plot without a regression line
ggplot(data = data, aes(x = data$Kilometer, y = data$Price)) +
  geom_point()
