# Load necessary libraries
library(tidyverse)

# Load the mtcars dataset
data(mtcars)

# Display the structure and summary statistics of the dataset
str(mtcars)
summary(mtcars)

View(mtcars)

is.na(mtcars)
sum(is.na(mtcars))

# Data Visualization

## Scatterplot Matrix
pairs(mtcars[, c("mpg", "hp", "wt", "qsec")])

## Boxplot for selected columns
selected_columns <- c("mpg", "hp", "wt", "qsec")
mtcars %>%
  select(selected_columns) %>%
  gather(key = "Variable", value = "Value") %>%
  ggplot(aes(x = Variable, y = Value)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Boxplot for Selected Columns", x = "Variable", y = "Value")

## Histogram for a specific column
ggplot(mtcars, aes(x = hp)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 20) +
  labs(title = "Histogram for Horsepower (hp)", x = "Horsepower", y = "Frequency")

## Pie Chart for a categorical column
cyl_counts <- table(mtcars$cyl)
pie(cyl_counts, labels = paste(names(cyl_counts), "cylinders"), main = "Cylinder Distribution")

## Density Plot for a numeric column
ggplot(mtcars, aes(x = mpg)) +
  geom_density(fill = "skyblue", color = "black") +
  labs(title = "Density Plot for Miles Per Gallon (mpg)", x = "Miles Per Gallon")

# Statistical Tests (Example: t-test)
t_test_result <- t.test(mtcars$mpg ~ mtcars$am)
print(t_test_result)
